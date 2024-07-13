# Internal-HTTP-Proxy

This repository contains the setup for an internal HTTP proxy using OpenVPN and Squid. The configuration and scripts are organized as follows:

## Directory Structure

```
📦Internal-HTTP-Proxy
 ┣ 📂config
 ┃ ┣ 📂openvpn
 ┃ ┃ ┣ 📜auth.txt
 ┃ ┃ ┗ 📜config.ovpn
 ┃ ┗ 📂squid
 ┃ ┃ ┗ 📜squid.conf
 ┣ 📜docker-compose.yml
 ┣ 📜Dockerfile.openvpn
 ┣ 📜Dockerfile.squid
 ┣ 📜entrypoint-openvpn.sh
 ┗ 📜entrypoint.sh
```

## Contents

- **config/**: Contains configuration files for OpenVPN and Squid.

  - **openvpn/**: OpenVPN configuration files.
    - `auth.txt`: Contains OpenVPN authentication credentials.
    - `config.ovpn`: OpenVPN configuration file.
  - **squid/**: Squid proxy configuration file.
    - `squid.conf`: Configuration for Squid proxy.

- **docker-compose.yml**: Defines the services, networks, and volumes for Docker Compose.
- **Dockerfile.openvpn**: Dockerfile for building the OpenVPN container.
- **Dockerfile.squid**: Dockerfile for building the Squid proxy container.
- **entrypoint-openvpn.sh**: Entrypoint script for the OpenVPN container.
- **entrypoint.sh**: Entrypoint script for the Squid container.

## Getting Started

To set up the internal HTTP proxy, follow these steps:

1. **Clone the repository:**

   ```bash
   git clone <repository-url>
   cd Internal-HTTP-Proxy
   ```

2. **Configuration:**

   - Update the OpenVPN configuration in `config/openvpn/config.ovpn`.
   - Update the Squid proxy configuration in `config/squid/squid.conf`.

3. **Authentication:**

   - Add your OpenVPN credentials to `config/openvpn/auth.txt`.

4. **Build and run the Docker containers:**

   ```bash
   docker-compose up --build
   ```

## Usage

Once the containers are up and running, the Squid proxy will route traffic through the OpenVPN connection. Ensure that your client applications are configured to use the Squid proxy.

## Troubleshooting

- Check the container logs for any issues:

  ```bash
  docker-compose logs
  ```

- Ensure that the OpenVPN and Squid configurations are correct and properly formatted.

## Contributing

If you wish to contribute, please fork the repository and submit a pull request with your changes.

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.
