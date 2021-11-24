---
layout: wiki
title: Vehicle Damage
description: Enhances vanilla armoured vehicle damage simulation.
group: feature
category: realism
parent: wiki
mod: ace
version:
  major: 3
  minor: 14
  patch: 0
---

## 1. Overview

Removes hit-point based damage on armoured vehicles.

### 1.1 Differences from vanilla

Vehicle damage is component based in this system. Rather than catastrophically exploding when an arbitrary amount of damage is recieved, the system calculates what warhead hit you, if it hit SLAT/ERA, and what components it hits.
When you are hit, a calculation takes place and determines which people inside the vehicle should get hurt.

### 1.2 How is damage calculated

Damage takes into account what warhead hits you, the speed it hits you at, and how much armour it hit.

If you are hit with a HEAT warhead, the system will check if you hit any ERA or SLAT armour and if so it negates all damage from hitting your vehicle and instead the component absorbs it.
Once the SLAT or ERA is destroyed, if hit again in the same spot the warhead will penetrate. Tandem HEAT will penetrate and destroy the armour, however. AP ammo has a chance to destroy it.

All ammunition shot at a vehicle is considered into the calculation. If the ammo is incendiary and it penetrates into a vital component there is a chance for cook-off to occur.

At the time of writing, blow-out panels are not simulated within the system.

### 1.3 What components are considered

- Engine
- Hull
- Turret
- Gun barrel
- Track
- Wheels
- Fuel Tank
- SLAT
- ERA

### 1.4 What warheads are considered

- AP (General AP ammo: APFSDS, Solid Shot, etc.)
- HEAT
- HEAT (Tandem)
- HE

## 2. Component Overview

### 2.1 Engine

The engine drives the vehicle. If the engine takes a critical hit, it will be destroyed and the vehicle will become immobile.

- Can cook-off [Y]
- Can injure occupants [Y]

### 2.2 Hull

The hull is a hitpoint that is simulated to be a crew compartment. If you penetrate the hull there is a chance for occupants to take damage. Hits on the hull can also fragment and take out other components, like the turret and engine.

- Can cook-off [Y]
- Can injure occupants [Y]

### 2.3 Turret

The turret is assumed to house the ammo racks and hydraulics/electronics that control turret movement. On turret hit there is a chance for the turret to jam requiring further repair.

- Can cook-off [Y]
- Can injure occupants [Y]

### 2.4 Gun barrel

The gun barrel is the barrel for any weapon on the vehicle. If hit, there is a chance for the barrel to be broken requiring further repair to shoot and traverse.

- Can cook-off [N]
- Can injure occupants [N]

### 2.5 Track

A track on the vehicle. If hit, the track can break and immobilise the vehicle.

- Can cook-off [N]
- Can injure occupants [N]

### 2.6 Wheels

A wheel on the vehicle. If hit, the wheel can break and immobilise the vehicle.

- Can cook-off [N]
- Can injure occupants [N]

### 2.7 Fuel Tank

When hit, the fuel tank will leak fuel and require repair to hold fuel again.

- Can cook-off [Y]
- Can injure occupants [N]

### 2.8 SLAT

When hit, HEAT warheads will be defeated and no damage will be applied. If hit with Tandem HEAT or HE the SLAT will be destroyed. If hit with AP, there is a small chance for SLAT to be damaged.

- Can cook-off [N]
- Can injure occupants [N]

### 2.9 ERA

When hit, HEAT warheads will be defeated and no damage will be applied. If hit with AP, Tandem HEAT, or HE the ERA will be destroyed.

- Can cook-off [N]
- Can injure occupants [N]

## 3. Addon Options

### 3.1 Enable

- Enables/Disables the vehicle damage simulation
- Default: On

### 3.2 Enable/Disable Ammo Removal During Cook-Off

- Enables/Disables whether or not vehicle ammo will be fully removed upon cooking-off
- Default: On

### 3.3 Enable/Disable advanced car damage (Experimental)

- Enable experimental car damage. System will apply vehicle damage simulation to "car" types (trucks, SUVs, Humvees, etc.). Not fully tested and could be immbalanced causing weird behaviours.
- Default: Off

## 4. Dependencies

{% include dependencies_list.md component="vehicle_damage" %}
