#!/bin/bash
#
# This script assumes a linux environment

echo "*** nuTensor.d(Chromium): Creating package"
echo "*** nuTensor.d(Chromium): Copying files"

DES=./dist/build/nuTensor.d.chromium
rm -rf $DES
mkdir -p $DES

bash ./tools/make-assets.sh $DES

cp -R ./src/*                           $DES/
cp -R $DES/_locales/nb                  $DES/_locales/no # Chrome store quirk
cp    ./platform/chromium/*.js          $DES/js/
cp -R ./platform/chromium/img/*         $DES/img/
cp    ./platform/chromium/manifest.json $DES/
cp    LICENSE.txt                       $DES/

echo "*** nuTensor.d.chromium: Generating meta..."
python3 tools/make-chromium-meta.py $DES/

if [ "$1" = all ]; then
    echo "*** nuTensor.d.chromium: Creating package..."
    pushd $(dirname $DES/)
    zip nuTensor.d.chromium.zip -qr $(basename $DES/)/*
    popd
elif [ -n "$1" ]; then
    echo "*** nuTensor.d.chromium: Creating versioned package..."
    pushd $(dirname $DES/) > /dev/null
    zip nuTensor.d_"$1".chromium.zip -qr $(basename $DES/)/*
    popd > /dev/null
fi

echo "*** nuTensor.d(Chromium): Package done."
