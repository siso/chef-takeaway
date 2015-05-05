#!/usr/bin/env ruby
#Dir.chdir File.join(__FILE__, "../..")

unless ENV['EDITOR']
  puts "No EDITOR found. Try:"
  puts "export EDITOR=vim"
  exit 1
end

unless ARGV.count == 2
  puts "usage: #{$0} <data bag> <item name>"
  exit 1
end

require 'chef/encrypted_data_bag_item'
require 'json'
require 'tempfile'

data_bag = ARGV[0]
item_name = ARGV[1]
encrypted_path = "data_bags/#{data_bag}/#{item_name}.json"

unless File.exists? encrypted_path
  puts "Cannot find #{File.join(Dir.pwd, encrypted_path)}"
  exit 1
end

data_bag_key_path = File.join(Dir.pwd, ".encrypted_data_bag_secret")
unless File.exists? data_bag_key_path
  puts "Get the data_bag_key and put it in #{data_bag_key_path}."
  exit 1
end

secret = Chef::EncryptedDataBagItem.load_secret(data_bag_key_path)

decrypted_file = Tempfile.new ["#{data_bag}_#{item_name}",".json"]
at_exit { decrypted_file.delete }

encrypted_data = JSON.parse(File.read(encrypted_path))
plain_data = Chef::EncryptedDataBagItem.new(encrypted_data, secret).to_hash

decrypted_file.puts JSON.pretty_generate(plain_data)
decrypted_file.close

system "#{ENV['EDITOR']} #{decrypted_file.path}"

plain_data = JSON.parse(File.read(decrypted_file.path))
encrypted_data = Chef::EncryptedDataBagItem.encrypt_data_bag_item(plain_data, secret)

File.write encrypted_path, JSON.pretty_generate(encrypted_data)
