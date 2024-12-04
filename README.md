# anti-proxy-component
Anti-proxy-component files

# openssl-1.1.1.zip
Used for open.mp-linux-x86-dynssl.tar.gz open-mp server

# openssl-3.0.15.zip
Used for anti-proxy-component

## Install

#### Install ubuntu packages used to run the so file
- `sudo dpkg --add-architecture i386`
- `sudo apt update`
- `sudo apt install wget git build-essential g++-multilib libssl-dev:i386 libfmt-dev:i386`

#### Clone the project
- `git clone https://github.com/raknetwork/anti-proxy-component/`

#### Unzip and move .so files
- `unzip openssl-1.1.1.zip `
- `unzip openssl-3.0.15.zip`

Move all unziped .so files in /usr/lib/i386-linux-gnu/
- `sudo mv openssl-1.1.1/libcrypto.so.1.1 /usr/lib/i386-linux-gnu/`
- `sudo mv openssl-1.1.1/libssl.so.1.1 /usr/lib/i386-linux-gnu/`
- `sudo mv openssl-3.0.15/libcrypto.so.3 /usr/lib/i386-linux-gnu/`
- `sudo mv openssl-3.0.15/libssl.so.3 /usr/lib/i386-linux-gnu/`

#### Unzip anti-proxy-component.zip, move anti-proxy-config.json, whitelisted_ip_pool.json in anti-proxy-component.so in open-mp-server/components/

- `unzip anti-proxy-component.zip`
- `mv anti-proxy-config.json whitelisted_ip_pool.json anti-proxy-component.so open-mp-server/components`

#### Replace json "key" field in anti-proxy-config.json with your purchased private key
- `"key": "Asf019sl5tA51c01lsa..."`


## Optional
#### If you want to build your openssl so files in a manual way, follow these small steps:# wget https://www.openssl.org/source/openssl-1.1.1o.tar.gz
- `sudo dpkg --add-architecture i386`
- `sudo apt update`
- `sudo apt install wget git build-essential g++-multilib libssl-dev:i386 libfmt-dev:i386`

For 32bit compilation.
- `setarch i386`
- `/bin/bash`
Download openssl-1.1.0.
- `wget https://www.openssl.org/source/openssl-1.1.1o.tar.gz`
- `tar -xvf openssl-1.1.1o.tar.gz`
- `cd openssl-1.1.1o`
- `./config`
- `make`
- `sudo cp libcypto.so.1.1 /usr/lib/i386-linux-gnu/`
- `sudo cp libssl.so.1.1 /usr/lib/i386-linux-gnu/`





