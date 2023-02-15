#!/usr/bin/env bash
#
# This script assumes a linux environment

DES=$1/assets

printf "*** Packaging assets in $DES... "

rm -rf $DES
mkdir $DES

cp ./assets/assets.json $DES/

if [ -n "${TRAVIS_TAG}" ]; then
  pushd .. > /dev/null
  git clone --depth 1 https://github.com/uBlockOrigin/uAssets.git
  git clone --depth 1 https://github.com/SteelEyeballSac1/nuAssets.git
  popd > /dev/null
fi

mkdir $DES/thirdparties
cp -R ../uAssets/thirdparties                               $DES/thirdparties/
mkdir $DES/nuTensor.d
cp -R ../nuAssets.d/recipes/*                               $DES/nuTensor.d/

echo "done."
