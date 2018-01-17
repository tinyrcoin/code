#!/bin/sh
fail() { echo "NOT FOUND"; exit 1; }
echo "Looking for git..."
which git || fail
git clone https://github.com/tinyrcoin/forknote
wget -O coin.conf https://github.com/tinyrcoin/tkwallet/raw/master/coin.conf
echo "Run 'sh build_daemon.sh' to build RCoin's modified Forknote.
echo "Requirements: libboost 1.55+, g++ 4.7 or newer"
