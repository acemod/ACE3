---
layout: wiki
title: Captives
description: System for taking and handling captives.
group: feature
category: interaction
parent: wiki
mod: ace
version:
  major: 3
  minor: 0
  patch: 0
---

## 1. Overview

### 1.1 Take captives
Introduces a captivity system.

### 1.2 Load and unload captives into / from vehicles
You can load and unload captives from vehicles using ACE3 interactions.

### 1.3 Frisk captives
You can frisk a restrained captive.

### 1.4 Surrendering
Allows players to surrender. It renders the unit unable to move and with the hands behind its head. When surrendered AI won't fire.

## 2. Usage

### 2.1 Taking a unit into captivity
- You need `Cable Tie`.
- Approach the unit and Interact <kbd>⊞ win</kbd> (ACE3 default).
- The interaction is located around the hands in the form of a handcuffs icon.
- Repeat to release.

### 2.2 Escorting a captive
- Interact with the captive <kbd>⊞ win</kbd>.
- Select the `Escort prisoner` option.
- To stop escorting, use the mousewheel and select `Release` or use Self Interaction <kbd>Ctrl</kbd>+<kbd>⊞ win</kbd> and select `Release`.

### 2.3 Loading and unloading a captive into/from a vehicle
- Escort the captive.
- Approach the vehicle you wish to load the captive unit into.
- Interact with the vehicle <kbd>⊞ win</kbd> and select `Load captive`.
- To unload the captive interact with the vehicle <kbd>⊞ win</kbd>
- Select `Passengers`.
- Select the captive.
- Select `Unload captive`.

## 3. Dependencies

{% include dependencies_list.md component="captives" %}
