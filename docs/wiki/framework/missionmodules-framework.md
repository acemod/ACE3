---
layout: wiki
title: Mission Modules Framework
description: Explains how to configure the mission modules.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 0
  patch: 0
---

## 1. Ambient Sounds

Used for ambient sounds loop (synced in multiplayer). Can be configured using a mission module.

This module randomizes the time when the sound file is played and the position where the sound file is played (if "Follow Players" is set to No).

`Minimal Distance` and `Maximal Distance` influence the position from where the sound file is played. Setting both values to 0 forces the module to play the sound from where it was placed in the editor.

`Minimal Delay` and `Maximal Delay` work in a similar fashion but are used to randomize when the sound file is played. Setting both values to 0 plays the sound from mission start.
