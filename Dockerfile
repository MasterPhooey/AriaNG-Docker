# Use Ubuntu as the base image
FROM ubuntu:20.04

# Install aria2 and nginx
RUN apt-get update && \
    apt-get install -y aria2 nginx && \
    rm -rf /var/lib/apt/lists/*

# Copy aria2.conf and WebUI (index.html)
COPY aria2.conf /root/.aria2/aria2.conf
COPY index.html /var/www/html/index.html

# Set aria2's default download directory and configuration
VOLUME ["/downloads"]

# Expose the necessary ports
EXPOSE 6800
EXPOSE 80

# Start aria2 and nginx when the container starts
CMD ["sh", "-c", "aria2c --conf-path=/root/.aria2/aria2.conf & nginx -g 'daemon off;'"]