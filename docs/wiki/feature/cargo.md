---
layout: wiki
title: Cargo
component: cargo
description: Adds the ability to transport cargo using vehicles.
group: feature
category: interaction
parent: wiki
mod: ace
version:
  major: 3
  minor: 3
  patch: 0
---

## 1. Overview
Adds the ability to load and unload cargo from vehicles. Unloading can happen via two methods: Regular unloading and deploying, where you can preplace the item before it's unloaded.

## 2. Usage

### 2.1 Loading an object
- Interact with the object to be loaded <kbd>⊞ win</kbd>.
- Select the `Load` option.
- Select which vehicle you want to load the object in.
- Wait for the progress bar to finish. To cancel loading, press <kbd>Escape</kbd>.

### 2.2 Checking a vehicle's cargo
- Interact with the vehicle whose cargo is to be checked <kbd>⊞ win</kbd>.
- Select the `Cargo` option.

### 2.3 Unloading an object from a vehicle
- Open the vehicle's cargo menu (see "Checking a vehicle's cargo")
- Press `Unload`.
- Wait for the progress bar to finish. To cancel unloading, press <kbd>Escape</kbd>.

### 2.4 Deploying an object from a vehicle
- Open the vehicle's cargo menu (see "Checking a vehicle's cargo")
- Press `Deploy`.
- Use the mouse to fine tune the placement of the object.
- When ready to place, press left click to start deploying the object.
- Wait for the progress bar to finish. To cancel deploying, press <kbd>Escape</kbd>.

### 2.5 Loading an object into a vehicle via Vehicle-in-Vehicle (ViV)
Vehicles that support the base game's Vehicle-in-Vehicle transport can carry objects physically attached to them, visible on the vehicle. ACE provides its own interaction, load time and unloading for this.
- Interact with the object to be loaded <kbd>⊞ win</kbd>.
- Select the `Load to ViV` option.
- Select which vehicle you want to load the object in.
- Wait for the progress bar to finish. To cancel loading, press <kbd>Escape</kbd>.

### 2.6 Unloading, deploying and paradropping ViV cargo
- Open the vehicle's cargo menu (see "Checking a vehicle's cargo"). ViV cargo is listed there.
- Press `Unload` or `Deploy` and follow the same steps as for regular cargo (see 2.3 and 2.4).
- On aircraft, loadmasters (and pilots, by default) can paradrop ViV cargo through the vehicle's self-interaction menu, the same way as regular cargo. The object is released and opens its own parachute.
