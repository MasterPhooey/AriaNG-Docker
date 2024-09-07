# Aria2 + AriaNg Docker Setup

This project provides a Dockerized setup for running **Aria2** with the **AriaNg** WebUI for managing downloads. The WebUI is served via Nginx, and Aria2 is configured to support RPC for remote download management.

## Features

- **Aria2**: A lightweight, multi-protocol download utility supporting HTTP, FTP, BitTorrent, and Metalink.
- **AriaNg WebUI**: A modern WebUI for managing Aria2 downloads easily and efficiently. For more information, visit [AriaNg on GitHub](https://github.com/mayswind/AriaNg).

## Requirements

- Docker
- Docker Compose (if using the Compose setup)

## Running the Container

You can pull the pre-built Docker image from [Docker Hub](https://hub.docker.com/r/masterphooey/ariang-docker):

### Pull the Image

   ```docker pull masterphooey/ariang-docker:latest```

### Build and Run with Docker

1. Run the Docker container:

   ```docker run -p 6800:6800 -p 8080:80 -v $(pwd)/downloads:/downloads masterphooey/ariang-docker```

   - Port 6800: Aria2 RPC port (used by AriaNg to communicate with Aria2)
   - Port 8080: Web UI served by Nginx
   - /downloads: Volume for downloaded files (mapped to the host)

### Build and Run with Docker Compose

If you are using Docker Compose, you can run the container with the following steps:

1. Build and start the service:

   ```docker-compose up --build```

2. Access the WebUI at:

   ```http://localhost:8080```

## Configuration

- **aria2.conf**: You can modify the `aria2.conf` file to change settings like the default download directory, number of connections, and more. The default configuration disables IPv6 and allows RPC access.
- **Environment Variables**:
  - ARIA2_RPC_SECRET: Secret token for RPC access (recommended for security).
  - ARIA2_DOWNLOAD_DIR: The default directory for storing downloads (default: `/downloads`).
  - ARIA2_CONNECTIONS: Number of connections per download (default: `4`).

## Using the AriaNg WebUI

1. Access the WebUI at ```http://localhost:8080``` (replace `localhost` with your server's IP if running remotely).
2. Configure the RPC URL in AriaNg settings:
   - RPC URL: ```http://localhost:6800/jsonrpc```
   - RPC Secret Token: Set this to match the `ARIA2_RPC_SECRET` value if you're using one.

For more information on AriaNg, visit the official [AriaNg GitHub repository](https://github.com/mayswind/AriaNg).

## License

This project is licensed under the MIT License.