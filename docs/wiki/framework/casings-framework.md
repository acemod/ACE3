---
layout: wiki
title: Casings Framework
description: Explains how to set-up dropped magazine models with ACE3 casings system.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 0
  patch: 0
---

## 1. Config Values

```cpp
class CfgAmmo { // In order of priority
    class MyAmmo {
        cartridge = "CartridgeClassnameInCfgVehicles"; // if empty (""), no casing will be created
        ace_casings_model = "path\to\casing\model.p3d"; // Dropped casing will have this model if not an empty string
    };
};

class CfgVehicles {
    class MyCartridge {
        model = "path\to\cartridge\model.p3d"; // If empty string or model, no casing will be created
    };
};

class CfgMagazines {
    class MyMagazine { // In order of priority
        // If magazine is compatible with vanilla Mk20's EGLM, model will always be "A3\Weapons_F\MagazineProxies\mag_40x36_HE_1rnd.p3d"
        ace_casings_model = "path\to\magazine\model.p3d"; //Dropped magazine will have this model if not an empty string
        modelSpecialIsProxy = 1;
        modelSpecial = "path\to\magazine\proxy\model.p3d"; // Proxy model
        model = "path\to\magazine\dropped\model.p3d"; // Dropped model

        // If model doesn't exist, is the default dropped magazine model (pouch), or is empty, no dropped magazine will be created.
    };
};
```
