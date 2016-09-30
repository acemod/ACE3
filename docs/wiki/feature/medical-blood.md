---
layout: wiki
title: Medical Blood
description: Spawn blood drops for bleeding units.
group: feature
category: realism
parent: wiki
mod: ace
version:
  major: 3
  minor: 8
  patch: 0
---

<div class="panel callout">
    <h5>Note:</h5>
    <p>This component supports both ACE medical as well as the vanilla medical systems.</p>
</div>

## 1. Overview

When any unit is bleeding, this component will spawn blood drops on the ground. The same happens for units that are taking damage. It can be configured to run only for players, for all units (AI and Players) or disabled through the ACE Settings framework.

## 2. In game

<img src="{{ site.baseurl }}/img/wiki/feature/ace_blood_screen.jpg" width="500" height="160" alt="ACE Blood in game" />

## 3. Dependencies

{% include dependencies_list.md component="medical_blood" %}
