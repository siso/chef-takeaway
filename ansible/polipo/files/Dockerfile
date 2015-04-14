# Docker to build container for polipo
# Based on Ubuntu
#
# VERSION   0.0.1

# Set the base image to Ubuntu
FROM ubuntu

# File Author / Maintainer
MAINTAINER  Suraj Thapa <thapa.suraj751@gmail.com>

# Update the repository sources list and install polipo
RUN apt-get update && apt-get install -y polipo

# Expose the default port
EXPOSE 8123

# Set default container command
ENTRYPOINT ["polipo"]

# Set proxeyAddress
CMD ["proxyAddress=0.0.0.0"]
