# phpcoin-miner

This is the miner of the phpcoin project. For more information, visit [phpcoin.net](https://phpcoin.net).

## Pre-conditions

docker and docker-compose are installed.

## How to use it

1. Download the docker-compose.yml file from [GitHub](https://raw.githubusercontent.com/Chasing66/phpcoin-miner/main/docker-compose.yml)
   ```
    wget -O docker-compose.yml https://raw.githubusercontent.com/Chasing66/phpcoin-miner/main/docker-compose.yaml
   ```
2. Edit the environment variables in the docker-compose.yml file, input your own values
3. Run the following command to start the docker-compose:
   ```
   docker-compose up -d
   ```

## Onekey installation

```
curl -fsSL https://raw.githubusercontent.com/Chasing66/phpcoin-miner/main/phpcoin-miner.sh | bash
```
