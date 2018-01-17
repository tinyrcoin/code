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
cp forknote/src/walletd bin/walletd.bin
cp forknote/src/miner bin/miner
wrapbin() {
echo '#!/bin/bash
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")
export PATH="$DIR:$PATH"
' > $2
echo "exec $1.bin $3 \$DIR/coin.conf \$@" >> $2
chmod +x $2
}
cp coin.conf bin
gen rcoind bin/rcoind --config-file
gen simplewallet bin/simplewallet --config-file
gen walletd bin/walletd --config
echo "All required binaries now in ./bin"

