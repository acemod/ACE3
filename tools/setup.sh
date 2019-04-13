VERSION=0.6.0
ARCH=$(uname -m)

echo "=> Downloading HEMTT..."
wget -q --show-progress https://github.com/synixebrett/HEMTT/releases/download/v$VERSION/hemtt-v$VERSION-$ARCH-unknown-linux-gnu.tar.gz

echo "=> Extracting HEMTT..."
tar -xzf hemtt-v$VERSION-$ARCH-unknown-linux-gnu.tar.gz -C ../.
rm hemtt-v$VERSION-$ARCH-unknown-linux-gnu.tar.gz

echo "=> Updating HEMTT..."
../hemtt update
