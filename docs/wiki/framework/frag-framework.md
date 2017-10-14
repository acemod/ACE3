---
layout: wiki
title: Fragmentation Framework
description: Explains how to set-up fragmentation system for explosives using ACE3 fragmentation system.
group: framework
parent: wiki
order: 7
mod: ace
version:
  major: 3
  minor: 0
  patch: 0
---

## 1. Overview

The fragmentation system in ACE3 is a significant improvement over the fragmentation system in ACE2. Previously the system relied on fuzzy math from the values of `indirectHit` and `indirectHitRange` in `CfgAmmo` to calculate roughly the velocity and range of fragmentation. This had some serious drawbacks, especially in the case of smaller explosives such as hand grenades and 40mm grenades where casualty production was lower than desired.

In ACE3 the system has moved away from what "feels" right to actual explosive engineering equations, primarily the [Gurney equations](http://en.wikipedia.org/wiki/Gurney_equations). This allows us to get close to the actual fragmentation velocities that would be produced by an explosive configuration similar to type of ammo we are simulating.

The system for the end-developer is easy to use, and only requires minimal research into the type of ammo being represented.


## 2. Config Values

```cpp
class CfgAmmo {
    class MyGrenade {
        ace_frag_enabled = 1;  // Enable fragmentation (0-disabled, 1-enabled)
        ace_frag_metal = 210;  // Amount of metal being fragmented (grams) - information below
        ace_frag_charge = 185;  // Amount of explosive filler (grams) - information below
        ace_frag_gurney_c = 2843;  // Gurney velocity constant for explosive type - information below
        ace_frag_gurney_k = 3/5;  // Gurney shape factor - information below
        ace_frag_classes[] = {"ACE_frag_large"};  // Type of fragments - information below
        ace_frag_skip = 0;  // (Optional) Skip fragmentation for this ammo type (0-disabled, 1-enabled) - information below
        ace_frag_force = 1;  // (Optional) Force fragmentation system (0-disabled, 1-enabled) - information below
    };
};
```

### 1.1 Metal amount

`ace_frag_metal`

Amount of metal being fragmented (generally taken as the entire weight of the warhead, though in some cases you might want to only include the fragmentation jacket or body.

Dimensionless value, as long as same unit as `ace_frag_charge` (for example `kg/kg` or `g/g` or `lbs/lbs`).

### 1.2 Explosives filler amount

`ace_frag_charge`

Amount of explosive filler in the warhead. `ace_frag_metal` and `ace_frag_charge` are dimensionless values, as long as they are both in the same unit (for example kg/kg g/g lbs/lbs).

Dimensionless value, as long as same unit as `ace_frag_metal` (for example `kg/kg` or `g/g` or `lbs/lbs`).

### 1.3 Gurney velocity constant

`ace_frag_gurney_c`

Gurney constant for explosive force. You can find a list of common explosive types below. If you can not find it here, or want more accurate numbers, just google the type of explosive and Gurney constant and you can find substantial information. This is **not** the detonation velocity of the explosive, do not confuse them!

Type            | Speed
--------------- | --------
Composition B   | 2700 m/s
Composition C-3 | 2680 m/s
Cyclotol 75/25  | 2790 m/s
HMX             | 2800 m/s
LX-14           | 2970 m/s
Octol 75/25     | 2800 m/s
PBX 9404        | 2900 m/s
PBX 9502        | 2377 m/s
Pentolite       | 2750 m/s
PETN            | 2930 m/s
RDX             | 2830 m/s
Tetryl          | 2500 m/s
TNT             | 2440 m/s
Tritonal        | 2320 m/s

### 1.4 Gurney shape factor

`ace_frag_gurney_k`

Shape factor for the explosive configuration. You should choose it based on the general configuration of explosives/metal in the warhead. Most grenades for example are a sphere. Artillery and aircraft bombs are a cylinder. Mines generally a flat plate. Below is a list of the three common shapes and their factors.

Shape    | Factor
-------- | ------
Sphere   | 3/5
Cylinder | 1/2
Plate    | 3/5

There are other configurations but these are the most common. If you are interested in others check out the wikipedia link given above. Most of these will not correctly function in ACE3 though due to additional variables for the equation.

### 1.5 Fragments type

`ace_frag_classes[]`

There are different types of fragmentation fragments to choose from, and they can be defined in this config value.

| Type
| ----
| ACE_frag_tiny
| ACE_frag_tiny_HD
| ACE_frag_small
| ACE_frag_small_HD
| ACE_frag_medium
| ACE_frag_medium_HD
| ACE_frag_large
| ACE_frag_large_HD
| ACE_frag_huge
| ACE_frag_huge_HD

The tinier the piece of fragmentation the shorter the distance of travel. The `_HD` variants are all even higher drag versions. Grenades generally should use the `_HD` variants. Experimentation here is important.

### 1.6 Ignore fragmentation

`ace_frag_skip`

Setting this to `1` will skip fragmentation for ammo of this type. This is useful for things that might cause high network load, such as FFAR rockets, or possibly even 40mm grenades from AGLs. Experimentation under network conditions is required.

### 1.7 Force fragmentation

`ace_frag_force`

Settings this to `1` will force the fragmentation system to use frag on this ammo, ignoring internal qualifications based on hit values.
