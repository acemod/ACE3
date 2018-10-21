---
layout: wiki
title: Medical AI
description: Makes AI heal themselves and each other with the ACE Medical system.
group: feature
category: realism
parent: wiki
mod: ace
version:
  major: 3
  minor: 7
  patch: 0
---

<div class="panel callout">
    <h5>Note:</h5>
    <p>Medical AI is currently only able to deal with the basic medical system! Read further for more details.</p>
</div>

## 1. Overview

ACE Medical AI makes AI units heal themselves and each other when ACE Medical is enabled. They will do this automatically when they consider themselves *fairly safe*, as in they're not suppressed and haven't fired a shot since a few seconds.


## 2. Usage

### 2.1 Multiplayer

The Medical AI will only become active if the AI units use the basic medical system (which is the default setting) and run on locally hosted multiplayer, dedicated servers and headless clients. In case you are concerned about performance, Medical AI is based on a CBA state machine, which means there is next to no performance loss caused by it.

### 2.2 Singleplayer

AI units will also heal themselves in singleplayer. If the player is in control of an AI group and uses basic medical, Medical AI is also enabled and will run for the players group as well. The AI subordinates will automatically start healing themselves and do not need to be told to do so manually through the command menu, additionally the groups medic will also start healing other units (including the player).


## 3. Dependencies

{% include dependencies_list.md component="medical_ai" %}
