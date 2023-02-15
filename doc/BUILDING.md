## Building nuTensor.d

### Requirements

Tools:
* bash
* python 3

You will need both this nuTensor.d and the nuAssets repositories. These should both be placed in the same directory:
```
git clone https://github.com/geekprojects/nuAssets.git
git clone https://github.com/SteelEyeballSac1/nuTensor.d.git
cd nuTensor.d
```

### Packaging
You can now run the scripts that package everything up.
These are bash scripts. They have only been tested on Linux and MacOS.

#### For Firefox
```
tools/make-firefox.sh all
```

#### For Chrome/Chromium (Not yet tested)
```
tools/make-chromium.sh all
```

#### For Opera (Not yet tested)
```
tools/make-opera.sh
```

The installation package should now be found in dist/build/

### Installing

Follow the instructions in [README.md](README.md) to install it.
