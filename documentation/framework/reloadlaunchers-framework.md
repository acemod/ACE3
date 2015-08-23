---
layout: wiki
title: reloadlaunchers framework
description:
group: framework
order: 5
parent: wiki
---

## 1. Adding third party reload

```c++
class CfgWeapons {

    class Launcher_Base_F;  // launcher base class

    class yourlauncher: Launcher_Base_F {  // launcher class
        ACE_reloadlaunchers_enabled = 1;  // enable third party reload (your buddies reloading for you)
    };
};
```
