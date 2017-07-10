---
layout: wiki
title: Rangecard
description: Adds a range card for your weapons.
group: feature
category: equipment
parent: wiki
mod: ace
version:
  major: 3
  minor: 1
  patch: 0
---

## 1. Overview

Add a range card that updates itself for your weapon and the type of ammo you're using.


## 2. Usage

### 2.1 Opening the range card

#### 2.1.1 Interaction Menu
- Open the self interaction menu <kbd>Ctrl</kbd> + <kbd>⊞&nbsp;Win</kbd>
- Select `Equipment`
- Select `Open Range Card`

#### 2.1.2 Custom key
- `OPTIONS` / `CONTROLS` / `CONFIGURE ADDONS` / `ACE3 Equipment`

#### 2.1.3 Inventory
<img src="{{ site.baseurl }}/img/wiki/feature/abtools_inventory.png" width="900" height="450" alt="Inventory management" />

### 2.2 Using the range card
- To use this to it's full potential the use of a [Vector 21]({{ site.baseurl }}/wiki/feature/vector.html) is strongly recommended, a [Kestrel 4500]({{ site.baseurl }}/wiki/feature/kestrel4500.html) will also help.
- Pull out your rangefinder ([Vector 21]({{ site.baseurl }}/wiki/feature/vector.html) preferred) and get the distance between you and your target.
- Open your rangetable and look under the `Target range` column.
- Move to the `Bullet Drop` column, the drop is in MRADs, you need to compensate for it by adjusting your sight. Example, you want to adjust for a bullet drop of -7.9 MRADs  simply adjust your scope 7.9 MRADs vertically. (check [feature scopes]({{ site.baseurl }}/wiki/feature/scopes.html) ) for this.
- Possibility to modify, copy and share the range card between spotter and shooter.
<img src="{{ site.baseurl }}/img/wiki/feature/rangecard_menu.jpg" width="350" height="350" alt="Range card self interaction menu" />


## 3. Dependencies

{% include dependencies_list.md component="rangecard" %}
