---
layout: wiki
title: Advanced Throwing
description: Precise system for throwing grenades and other throwable items.
group: feature
category: interaction
parent: wiki
mod: ace
version:
  major: 3
  minor: 7
  patch: 0
redirect_from: "/wiki/feature/advancedthrowing.html"
---

## 1. Overview

Advanced Throwing adds an alternate way of throwing grenades and other throwable items. It solves the issues vanilla Arma throwing has, such as hard to effectively throw through a window even when you are standing right next to it, hard to judge distance and similar. Additionally, it adds other features, such as cooking, picking up already thrown grenades, different throw modes, distance and flight arc indicators, which vanilla lacks. It is also entirely optional (can be disabled through settings) and configurable.

### 1.1 Throwing Modes

There are 3 throwing modes in Advanced Throwing, normal, high and drop. Normal mode is similar in power to vanilla throwing, high mode lobs the grenade higher, for example for throwing over walls, drop mode drops the grenade at your feet or slightly away, for example for dropping smoke or chemlights. Drop mods are indicated by both the throw arc indicator and the actual representation of the grenade in the world.

Drop mode has additional functionality which allows you to extend the arm and drop the grenade slightly further away, for example for dropping through windows, especially helpful where Arma's geometry would simply make it bounce back into your lap.

After cooking a grenade any mode can be used to throw it further or it can simply be held in hand (at least with smoke grenades, chemlights and similar, not recommended with frag grenades).

Grenade will be thrown where you are currently looking at, free-look (including TrackIR) is fully supported. However, the further to the side and back you are looking, the lower the throw power will be.

### 1.2 Indicators

When enabled, an arc of colored filled circles will indicate the path grenade will fly through.

Color | Meaning
----- | --------
White | Flight path
Green | Collision with ground surface
Red | Collision with object
Yellow | Possible collision (_added in ACE3 v3.8.0_)

Possible collisions are collisions that might happen, but there is also a chance that the grenade will not collide with that object. It is impossible to predict in many cases due to different object configurations.

### 1.3 Rethrowing

Advanced Throwing allows you to pick up grenades that have already been thrown. You have to be very close to it to effectively pick it up. Useful for rethrowing smoke grenades or repositioning chemlights. Frag grenades can also be thrown back, for example out of the house, however doing so is extremely risky.

### 1.4 Settings

Various settings can be set according to your likeness. Next to global toggle to disable Advanced Throwing there are settings to hide the throw arc indicating approximate throw distance and the arc it will fly through and hide mouse controls. Additionally for server administrators and mission makers, picking up grenades can be entirely disabled, as well as a setting to enable picking up attached items such as chemlights attached to vehicles or other player's shoulder.


## 2. Usage

Make sure to use different keybinds for Advanced Throwing or unbind vanilla throwing keybinds to prevent incidents.

### 2.1 Throwing
- You need a throwable item.
- Press <kbd>⇧&nbsp;Shift</kbd>+<kbd>G</kbd> (ACE3 default) to prepare the item.
- Press the keybind again to select next throwable item in the inventory.
- Press <kbd>LMB</kbd> to throw.
- Press <kbd>MMB</kbd> to prime/cook.
- Press <kbd>RMB</kbd> to cancel throw.
- Throw will also be cancelled when opening any interface, reloading, switching weapons and aiming.

### 2.2 Changing Mode
- Use <kbd>Scroll Wheel</kbd> to change between **normal** and **high** modes.
- Press <kbd>Ctrl</kbd>+<kbd>G</kbd> (ACE3 default) to change to **drop** mode.
- Use <kbd>Scroll Wheel</kbd> to extend or contract drop distance.

### 2.3 Picking Up
- Approach a throwable item on the ground.
- Interact with the item <kbd>⊞&nbsp;Win</kbd> (ACE3 default).
- Select `Pick Up`.
- Item will be placed in your hands, but you may not cancel the throw.


## 3. Dependencies

{% include dependencies_list.md component="advanced_throwing" %}
