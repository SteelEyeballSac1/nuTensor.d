#!/usr/bin/env bash
#
# This script assumes a linux environment

echo "*** nuTensor.d.firefox: Creating web store package"
echo "*** nuTensor.d.firefox: Copying files"

BLDIR=dist/build
DES="$BLDIR"/nuTensor.d.firefox
rm -rf $DES
mkdir -p $DES

bash ./tools/make-assets.sh $DES

cp -R ./src/*                               $DES/
cp    platform/chromium/*.js                $DES/js/
cp -R platform/chromium/img/*               $DES/img/
cp    LICENSE.txt                           $DES/

cp    platform/firefox/*.js                 $DES/js/
cp    platform/firefox/manifest.json        $DES/

echo "*** nuTensor.d.firefox: Generating meta..."
python3 tools/make-firefox-meta.py          $DES/

if [ "$1" = all ]; then
    echo "*** nuTensor.d.firefox: Creating package..."
    pushd $DES > /dev/null
    zip ../$(basename $DES).xpi -qr *
    popd > /dev/null
elif [ -n "$1" ]; then
    echo "*** nuTensor.d.firefox: Creating versioned package..."
    pushd $DES > /dev/null
    zip ../$(basename $DES).xpi -qr *
    popd > /dev/null
    mv "$BLDIR"/nuTensor.d.firefox.xpi "$BLDIR"/nuTensor.d"$1".firefox.xpi
fi

echo "*** nuTensor.d.firefox: Package done."
