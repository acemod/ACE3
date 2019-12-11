---
layout: wiki
title: Grenades Framework
description: Explains how to set-up flashbangs, particularly multi-bangs.
group: framework
parent: wiki
order: 7
mod: ace
version:
  major: 3
  minor: 13
  patch: 0
---

## 1. Overview

ACE provides a simple interface for creating flashbang grenades and specifying their properties. It is important that one sets `timeToLive` to be greater than the total possible time until the last explosion, i.e, `ace_grenades_flashbangBangs * ace_grenades_flashbangInterval + ace_grenades_flashbangIntervalMaxDeviation`. Any explosions that occur after the `timeToLive` has expired will occur at `(0,0)`.


## 2. Config Values

There are several config entries specific to ACE flashbangs. All successive values can be left undefined and they will be given the defaults shown in the first example below, with the exception of `ace_grenades_flashbang`, which is equal to `0` if left undefined.

```cpp
class CfgAmmo {
    class MyDefaultFlashbang {
        ace_grenades_flashbang = 1;                         // A flashbang
        ace_grenades_flashbangBangs = 1;                    // with one bang
        ace_grenades_flashbangInterval = 0.5;               // 0.5 seconds between each subsequent bang
        ace_grenades_flashbangIntervalMaxDeviation = 0.1;   // Deviation of up to ± 0.1 seconds on each fuse
    };
    class ACE_G_M84 {
        explosionTime = 2.3;            // Seconds until the initial explosion
        timeToLive = 6;                 // Seconds until the projectile is removed
        ace_grenades_flashbang = 1;     // A normal flashbang
    };
    class ACE_G_CTS9 {
        explosionTime = 1.5;
        timeToLive = 10;
        ace_grenades_flashbang = 1;
        ace_grenades_flashbangBangs = 9;                                        // 9 bangs
        ace_grenades_flashbangInterval = 0.5;                                   // 0.5 seconds between each subsequent bang
        ace_grenades_flashbangIntervalMaxDeviation = "0.1 * sqrt (12*4) / 2";   // Standard deviation of 0.1 seconds on each fuse
    };
    class 16aa_Ammo_6Bang {                                 // British Armed Forces L107A1
        explosionTime = 1;
        timeToLive = 5;
        ace_grenades_flashbang = 1;
        ace_grenades_flashbangBangs = 6;                    // 6 bangs
        ace_grenades_flashbangInterval = 0.25;              // 0.25 seconds between each subsequent bang
        ace_grenades_flashbangIntervalMaxDeviation = 0.05;  // Deviation of up to ± 0.05 seconds on each fuse
    };
};
```

### 2.1 ace_grenades_flashbang

If set to zero or left undefined, the grenade is not treated as a flashbang. If it is set to 1, the grenade will be treated as a flashbang with the associated effects.

### 2.2 ace_grenades_flashbangBangs

The flashbang will explode as many times as is specified. The default is 1.

### 2.3 ace_grenades_flashbangInterval

The average amount of time in seconds, after `explosionTime` has passed, between each subsequent bang.

### 2.4 ace_grenades_flashbangIntervalMaxDeviation

The amount of randomness in the fuse time.
