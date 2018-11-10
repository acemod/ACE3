---
layout: wiki
title: ATragMX Framework
description: Explains how to set-up custom gun list entries with the ATragMX.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 0
  patch: 0
redirect_from: "/wiki/framework/atragmx.html"
---

## 1. Configs Values

You do not have to put the `ACE_ATragMX_Presets` class into a separate file. You can reuse `CfgAmmo.hpp` or `CfgWeapons.hpp`.

<div class="panel callout">
    <h5>All values are in METRIC units!</h5>
</div>

### 1.1 `ACE_ATragMX_Presets`

{% raw %}
```cpp
class ACE_ATragMX_Presets {
    class yourTestPreset1 {
        // Profile Name, Muzzle Velocity, Zero Range, Scope Base Angle, AirFriction, Bore Height, Scope Unit, Scope Click Unit, Scope Click Number, Maximum Elevation, Dialed Elevation, Dialed Windage, Mass, Bullet Diameter, Rifle Twist, BC, Drag Model, Atmosphere Model, Muzzle Velocity vs. Temperature Interpolation, C1 Ballistic Coefficient vs. Distance Interpolation
        preset[] = {"testPreset1", 810, 100, 0.0679, -0.0010350, 3.81, 0, 2, 10, 120, 0, 0, 9.525, 7.82, 25.40, 0.393, 1, "ICAO", {{-15,0},{0,0},{10,0},{15,0},{25,0},{30,0},{35,0}}, {{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}}};
    };
    class yourTestPreset2 {
        // Profile Name, Muzzle Velocity, Zero Range, Scope Base Angle, AirFriction, Bore Height, Scope Unit, Scope Click Unit, Scope Click Number, Maximum Elevation, Dialed Elevation, Dialed Windage, Mass, Bullet Diameter, Rifle Twist, BC, Drag Model, Atmosphere Model, Muzzle Velocity vs. Temperature Interpolation, C1 Ballistic Coefficient vs. Distance Interpolation
        preset[] = {"testPreset2", 810, 100, 0.0679, -0.0010350, 3.81, 0, 2, 10, 120, 0, 0, 9.525, 7.82, 25.40, 0.393, 1, "ICAO", {{-15,0},{0,0},{10,0},{15,0},{25,0},{30,0},{35,0}}, {{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}}};
    };
};
```
{% endraw %}
