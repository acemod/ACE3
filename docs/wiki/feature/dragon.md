---
layout: wiki
title: M47 Dragon Missile
description: M47 Dragon
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

### 1.1 Guidance

The M47 Dragon is a wire-guided SACLOS missile with a unique manuever system. It has a series of charges along the missile that fire every third of a second to adjust the missile on course

### 1.2 Attack profiles

The missile requires line of sight to the target at all times. Keep your crosshair on the target as the missile cruises toward it until impact.
If you lose line of sight the missile will stop tracking toward your crosshair and will fly on its current trajectory. You can regain control if the missile re-enters line of sight.
If the missile exceeds its maximum range the wire will snap and it will fly off in a random direction.
The missiles manuever system causes inaccuracy that cannot be corrected for by the gunner. This means that the risk of missing increases as range goes up

## 2. Usage

### 2.1 Placement

- Ensure that you have the M47 Super-Dragon launcher as well as the SU-36/P sighting unit
- Use self interaction <kbd>Ctrl</kbd>+<kbd>⊞&nbsp;Win</kbd> (ACE3 default key bind `Self Interaction Key`)
- Select 'Place Tripod'
- Interact with the missile <kbd>⊞&nbsp;Win</kbd> (ACE3 default key bind `Interaction Key`)
- Select 'Attach Sight'
- Get into the launcher
- Point at target
- Fire

### 2.2 Tear Down
- Interact with the missile <kbd>⊞&nbsp;Win</kbd> (ACE3 default key bind `Interaction Key`)
- Select 'Disassemble'
- Look to the right of the launcher and pick up the sighting unit
- Move on

## 3. Sight Ranging

The Dragon gunners use the stadia lines in the daysight to determine if a target falls within range. Moving and stationary vehicles may present flank, oblique, and frontal or rear targets (Figure 1).
At maximum range (1,500 meters), a 7-meter (23-foot) long target completely fills the area between the stadia lines and exceeds the stadia lines at a closer range.

**Figure 1. Frontal, oblique, and flank targets**
<img src="{{ site.baseurl }}/img/wiki/feature/m47_fro_obl_fla.png" width="1400" height="452" alt="Frontal, Oblique, and Flank targets" />

### 3.1 **Flanking Targets (Full Stadia)**

Adjust the sight picture by moving the launcher so the target centers between the stadia lines (Figure 2).

**Figure 2. Range determination for flank target.**
<img src="{{ site.baseurl }}/img/wiki/feature/m47_flank.png" width="1400" height="331" alt="Frontal, Oblique, and Flank targets" />

### 3.2 **Oblique Targets**

If you can see more of the flank, use the full-stadia method (Figure 3.1). The vehicle should appear to fill the area between the stadia lines. If you see more of the front or rear, use the half-stadia method (Figure 3.2). The track of the vehicle should fit between one stadia line and the center.

**Figure 3.1. Range determination for oblique target, more flank visible**
<img src="{{ site.baseurl }}/img/wiki/feature/m47_oblique_45.png" width="1400" height="408" alt="Frontal, Oblique, and Flank targets" />
**Figure 3.2. Range determination for oblique target, more front or rear visible**
<img src="{{ site.baseurl }}/img/wiki/feature/m47_oblique_60.png" width="1400" height="331" alt="Frontal, Oblique, and Flank targets" />

### 3.3 **Frontal (Head-On) or Rear (Going Away, Half-Stadia) Targets**

Adjust the sight picture by moving the launcher to align the vertical cross hair and one of the stadia lines on the target (Figure 4)

**Figure 4. Range determination for frontal or rear target.**
<img src="{{ site.baseurl }}/img/wiki/feature/m47_frontal.png" width="1400" height="357" alt="Frontal, Oblique, and Flank targets" />

## 4. Dependencies

{% include dependencies_list.md component="dragon" %}
