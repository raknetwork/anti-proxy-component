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


