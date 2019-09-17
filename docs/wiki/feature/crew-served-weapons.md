---
layout: wiki
title: Crew Served Weapons
description: Static weapons that require multiple people to crew
group: feature
category: equipment
parent: wiki
mod: ace
version:
  major: 3
  minor: 13
  patch: 0
---

## 1. Overview

Crew Served Weapons are static weapons that require multiple people to crew them.

### 1.1 Loading/Unloading of ammo into static weapons

Static weapons need to be manually loaded with ammo when placed down. The user can also unload ammo from static weapons, and place the ammo into their inventory for transport

### 1.2 Assembling/Disassembling of static weapons

Static weapons are assembled when a tripod is placed down, and the weapon mounted ontop. The user can then disassemble the weapon back into the tripod and weapon-bag and carry it around for the next deployment.

## 2. Usage

### 2.1 Loading Ammo

- Apporach the static weapon with the relavent ammo in your inventory
- Interact with the weapon using <kbd>⊞&nbsp;Win</kbd> (ACE3 default) and navigate to the `CSW` menu.
- Select `Handle Ammo`
- Select `Load X` where X is the ammo you want loaded and wait for the timer to complete

### 2.2 Unloading ammo

- Apporach the static weapon and interact <kbd>⊞&nbsp;Win</kbd> (ACE3 default)
- Navigate to the `CSW` menu
- Select `Unload Ammo` and wait for the timer to complete
- The ammo will be placed to the left of the gun

### 2.3 Assembling Weapon

- Have the tripod and the relavent weapon in your launcher slot
- Place down tripod in the self-interact menu <kbd>Ctrl</kbd> + <kbd>⊞&nbsp;Win</kbd> (ACE3 default)
- Approach the tripod with the wanted weapon, and interact <kbd>⊞&nbsp;Win</kbd> (ACE3 default)
- Navigate to the `CSW` menu, and select `Assemble Weapon`
- Wait for the timer to complete, and the weapon will be assembled in the direction the tripod is facing

### 2.4 Disassembling Weapon

- Approach the static weapon and interact <kbd>⊞&nbsp;Win</kbd> (ACE3 default)
- Navigate to the `CSW` menu
- Select `Disassemble Weapon`
- Wait for the timer to complete
- The tripod, ammo, and weapon will spawn where the static weapon was

## 3. Addon Options

### 3.1 defaultAssemblyMode

- Enables/Disables the ability to assemble the CSW through the addon (Non-Vanilla assembly)
- Default: Off

### 3.2 handleExtraMagazines

- Enables/Disables the magazines in the CSW will appear next to the gun on weapon initialization when using defaultAssemblyMode and you have a pre-placed static weapon
- Default: On

### 3.3 ammoHandling

- Whether or not you want to handle ammo using the CSW way. Does nothing if using defaultAssemblyMode
- Default: On

## 4. Dependencies

{% include dependencies_list.md component="csw" %}
