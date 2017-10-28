---
layout: wiki
title: Pylons
description: Adds an interface that allow players to configure aircraft pylons in-game.
group: feature
category: interaction
parent: wiki
mod: ace
version:
  major: 3
  minor: 11
  patch: 0
---

## 1. Overview

Adds an interface that allow players to configure aircraft pylons in-game. Loadouts can be saved and loaded through interface.

## 2. Usage

### 2.1 Configure Pylons

To configure pylons you need a `Toolkit` equipped, a rearm vehicle nearby and be an engineer (Note: these requirements can be disabled)

- Interact with aircraft using <kbd>⊞ Win</kbd> (ACE3 default key bind `Interaction Key`).
- Select `Configure Pylons`.
- Configure your loadout in the menu that appears.
- Press `APPLY` when done.
- Rearm the aircraft (see [Rearm](rearm.html) page).

### 2.2 Managing loadouts

To save a custom loadout you first configure it. In the text box above `SAVE`, `LOAD` and `DELETE` you type the loadout name, then press `SAVE`.

To load a custom loadout you select it in the preset pane and press `LOAD` followed by `APPLY`.

To delete a custom loadout you select it in the preset pane and press `DELETE`.

## 3. Dependencies

{% include dependencies_list.md component="pylons" %}
