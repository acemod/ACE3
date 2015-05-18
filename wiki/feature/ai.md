---
layout: wiki
title: AI (Artifical Intelligence)
description: Config based changes to AI to ensure compatibility with advanced AI modifications
group: feature
order: 5
parent: wiki
---

## 1. Overview

### 1.1 Adjusted AI skill values
The idea here is to reduce the AI's godlike aiming capabilties while retaining it's high intelligence. The AI should be smart enough to move through a town, but also be 'human' in their reaction time and aim.
Note: All these values can still be adjusted via scripts, these arrays just change what 0 & 1 are for setSkill.

### 1.2 Firing in burst mode
AI will now use the automatic mode of their weapons at short distances, instead of always relying on firing single shots in quick succession.

### 1.3 Longer engagement ranges
The maximum engagement ranges are increased: AI will fire in bursts with variable length on high ranges of 500 - 700 meters, depending on their weapon and optic.

### 1.4 No deadzones in CQB
Some weapons had minimum engagement ranges. If you were as close as 2 meters to an AAF soldier, he wouldn't open fire, because the AI couldn't find any valid fire mode for their weapon. ACE3 removes this behaviour mostly notable in CQB by adding a valid firing mode.

### 1.5 No scripting
All changes of ACE3 AI are config based to ensure full compatibility with advanced AI modifications like ASR AI.


## 2. Dependencies

`ace_common`
