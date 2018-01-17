#!/bin/sh
echo "Configuring..."
cd forknote
cmake .
echo "Building..."
make
echo "Copying..."
mkdir -p bin
cp forknote/src/forknoted bin/rcoind.bin
cp forknote/src/simplewallet bin/simplewallet.bin
cp forknote/src/walletd bin
echo '#!/bin/bash
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")
