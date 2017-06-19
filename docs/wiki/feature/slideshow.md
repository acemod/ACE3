---
layout: wiki
title: Slideshow
description: Ability to have automatic or controllable slide-shows.
group: feature
category: interaction
parent: wiki
mod: ace
version:
  major: 3
  minor: 2
  patch: 0
---

## 1. Overview

This adds the ability to have images shown on some objects and have other objects being used as remotes.
Please note that only objects with hiddenSelection 0 can be used to render images (whiteboard, TV, PC Screen being the most notable examples).

## 2. Usage

Note that this sections is for users, for mission makers refer to [the entry in mission-tools](../missionmaker/mission-tools.html)
Also if no remotes are defined the "screen" object itself becomes the remote.

### 2.1 Switching between images

- Look at the object used as a remote and use the interaction menu <kbd>⊞&nbsp;Win</kbd> (ACE3 default).
- Select the action that correspond to the image you want (the name of the action depends on the mission maker).

## 3. Dependencies

{% include dependencies_list.md component="slideshow" %}
