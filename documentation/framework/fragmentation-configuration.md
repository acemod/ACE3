---
layout: wiki
title: Fragmentation Configuration
description: The fragmentation system (ace_frag) in ACE3 is a significant improvement over the fragmentation system in ACE2.
group: framework
parent: wiki
order: 7
---

The fragmentation system (ace_frag) in ACE3 is a significant improvement over the fragmentation system in ACE2. Previously the system relied on fuzzy math from the values of `indirectHit` and `indirectHitRange` in CfgAmmo to calculate roughly the velocity and range of fragmentation. This had some serious drawbacks, especially in the case of smaller explosives such as hand grenades and 40mm grenades where casualty production was lower than desired.

In ACE3 the system has moved away from what "feels" right to actual explosive engineering equations, primarily the [Gurney equations](http://en.wikipedia.org/wiki/Gurney_equations). This allows us to get close to the actual fragmentation velocities that would be produced by an explosive configuration similar to type of ammo we are simulating.

The system for the end-developer is easy to use, and only requires minimal research into the type of ammo being represented. I will describe how to do this in this ticket.

Below is an example set of explosives configuration properties for sys_frag (in this case an M67 hand grenade):

```c++
ace_frag_metal = 210;     // metal in grams
ace_frag_charge = 185;    // explosive in grams
ace_frag_gurney_c = 2843; // Gurney velocity constant for explosive type. See: http://en.wikipedia.org/wiki/Gurney_equations
ace_frag_gurney_k = 3/5;  // Gurney shape factor, in this case a sphere. See: http://en.wikipedia.org/wiki/Gurney_equations
```

`ace_frag_metal` is the amount of metal being fragmented (generally taken as the entire weight of the warhead, though in some cases you might want to only include the fragmentation jacket or body. `ace_frag_charge` is the amount of explosive filler in the warhead. `ace_frag_metal` and `ace_frag_charge` are dimensionless values, as long as they are both in the same unit (for example kg/kg g/g lbs/lbs).

`ace_frag_gurney_c` is the Gurney constant for explosive force. You can find a list of common explosive types below. If you can not find it here, or want more accurate numbers, just google the type of explosive and Gurney constant and you can find substantial information. This is *NOT* the detonation velocity of the explosive, do not confuse them!

| Type             | Speed    |
|------------------|----------|
|Composition B     | 2700 m/s |
|Composition C-3   | 2680 m/s |
|Cyclotol 75/25    | 2790 m/s |
|HMX               | 2800 m/s |
|LX-14             | 2970 m/s |
|Octol 75/25       | 2800 m/s |
|PBX 9404          | 2900 m/s |
|PBX 9502          | 2377 m/s |
|PETN              | 2930 m/s |
|RDX               | 2830 m/s |
|Tetryl            | 2500 m/s |
|TNT               | 2440 m/s |
|Tritonal          | 2320 m/s |


`ace_frag_gurney_k` is the shape factor for the explosive configuration. You should choose it based on the general configuration of explosives/metal in the warhead. Most grenades for example are a sphere. Artillery and aircraft bombs are a cylinder. Mines generally a flat plate. Below is a list of the three common shapes and their factors.

```
Sphere   = 3/5
Cylinder = 1/2
Plate    = 3/5
```

There are other configurations but these are the most common. If you are interested in others check out the wikipedia link given above. Most of these will not correctly function in sys_frag though due to additional variables for the equation.

In addition to these variables there are different types of fragmentation fragments to choose from, and they can be defined in the config value `ace_frag_classes[]`. Below are a list of the types.

```
ACE_frag_tiny
ACE_frag_tiny_HD
ACE_frag_small
ACE_frag_small_HD
ACE_frag_medium
ACE_frag_medium_HD
ACE_frag_large
ACE_frag_large_HD
ACE_frag_huge
ACE_frag_huge_HD
```

The tinier the piece of fragmentation the shorter the distance of travel. The `_HD` variants are all even higher drag versions. Grenades generally should use the `_HD` variants. Experimentation here is important.

The final information needed is a couple of entries for forcing or ignoring fragmentation for this ammo.

If you set `ace_frag_skip` to 1 then you will skip fragmentation for ammo of this type. This is useful for things that might cause high network load, such as FFAR rockets, or possibly even 40mm grenades from AGLs. Experimentation under network conditions is required.

If you set `ace_frag_force` to 1 it will force the fragmentation system to use frag on this ammo, ignoring sys_frags internal qualifications based on hit values.
