---
layout: wiki
title: Repair
description: Adds custom repair system.
group: feature
category: interaction
parent: wiki
mod: ace
version:
  major: 3
  minor: 3
  patch: 0
---

<div class="panel callout">
    <h5>For information on configuration see [Repair Framework]({{ site.baseurl }}/wiki/framework/repair-framework.html)</h5>
</div>

## 1. Overview

Adds a more realistic repair system.
- Replacing damaged wheels and tracks requires replacement items (using [Cargo System]({{ site.baseurl }}/wiki/framework/cargo-framework.html).
- By default vehicles will start with spare parts (1 wheel or 1 track).
- Can repair specific hitpoints on vehicles.
- Can designate buildings and/or vehicles as repair zones allowing the ability to do a full repair.

## 2. Repairing

- Vehicle's engine should be off
- A `ToolKit` item may be required based on settings (default: not required for wheels, required for tracks or hitpoint repair)

### 2.1 Replacing Wheels or Tracks

- Unload a spare wheel or track (using cargo interaction)
- Drag the spare next to the wheel/track that needs replacing
- Remove the damaged wheel (not needed for track repair)
- Install new wheel or track

### 2.2 Repairing hitpoints

- Amount repaired is based on settings and training level
- Using the interaction system select the hitpoint to repair

## 3. Dependencies

{% include dependencies_list.md component="repair" %}

