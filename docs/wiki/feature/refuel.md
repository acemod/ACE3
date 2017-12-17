---
layout: wiki
title: Refuel
description: Adds the option to refuel vehicles.
group: feature
category: interaction
parent: wiki
mod: ace
version:
  major: 3
  minor: 4
  patch: 0
---

## 1. Overview

This adds the option to refuel vehicles. The basic concept of refuel a vehicle is similar to reality. You need to interact with the fuel source (i.e. fuel truck, gas pump, ...), the fuel nozzle and the vehicle you want to refuel.

## 2. Usage

### 2.1 Start refueling vehicles
- Interact with the fuel source <kbd>⊞&nbsp;Win</kbd> (ACE3 default key bind `Interact Key`).
- Select `Take fuel nozzle`. Your character will holster his weapon and receive a fuel nozzle.
- Walk close to the vehicle you want to refuel and follow the instructions on the screen to connect the nozzle.
- Refueling starts automatically after nozzle connecting if possible.

Refueling takes some time which depends on its fuel tank size, the vehicle type and the module settings.

### 2.2 Returning the nozzle
- Interact with the nozzle <kbd>⊞&nbsp;Win</kbd> (ACE3 default key bind `Interact Key`).
- Select `Stop fueling` if refueling is still under way.
- Select `Take fuel nozzle` which is only possible after stopping. Your character will holster his weapon and pick up the fuel nozzle.
- Walk close to the fuel source and follow the instructions on the screen to return the nozzle.

### 2.3 Checking the remaining fuel
- Interact with the fuel truck <kbd>⊞&nbsp;Win</kbd> (ACE3 default key bind `Interact Key`).
- Select `Check remaining fuel`.
- A hint will display the remaining fuel in liters.

### 2.4 Checking the fuel counter
- Interact with the fuel source <kbd>⊞&nbsp;Win</kbd> (ACE3 default key bind `Interact Key`).
- Select `Check fuel counter`.
- A hint will display the fueled amount in liters.

## 3. FAQ

### Can I drop the nozzle?
Yes, follow the instructions on the screen.

### Can I pick up a nozzle?
Yes, using the interact menu <kbd>⊞&nbsp;Win</kbd> (ACE3 default key bind `Interact Key`).

### The nozzle was dropped. What's wrong?
You can only use the nozzle within a close distance from its source. You may need to park closer.

### The engine of the fuel truck can't be on. Why?
While refueling, you can't move the fuel truck. Return the nozzle.

### How do I replenish the fuel supply on a fuel truck?
Please check the framework description for more details.

### How do I increase the length of the hose?
There is a global setting that will effect all vehicles and static pumps. To only effect a specific vehicle put the following in it's init box:
```cpp
this setVariable ["ace_refuel_hoseLength", 30];
```

## 4. Dependencies

{% include dependencies_list.md component="refuel" %}
