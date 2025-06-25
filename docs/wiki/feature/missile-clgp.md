---
layout: wiki
title: Cannon Launched Guided Projectiles
component: missile_clgp
description: Support for missiles that are cannon-launched
group: feature
category: realism
parent: wiki
mod: ace
version:
  major: 3
  minor: 19
  patch: 0
---

## 1. Pike

40mm laser guided grenade
- ~2km range
- Long grenade will only fit in swing-open GLs using the magazine well `CBA_40mm_EGLM` (e.g. M320 but not M203)

## 2. Copperhead M712

155mm laser-guided artillery

### 2.1 Shell configuration

Use vehicle-interaction <kbd>⊞&nbsp;Win</kbd> (while seated) to open the shell interface
- First digit sets trajectory: 1-2 is ballistic, 3-8 is shaped (glide)
- Second digit programs time delay: 1-8 will go up to 45 seconds in ballistic mode and 48 seconds in shaped
- Final 3 digits set the laser pulse code (currently it will take the form of 1XXX)
