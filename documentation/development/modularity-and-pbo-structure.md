---
layout: wiki
title: Modularity And PBO Structure
description: 
group: development
parent: wiki
order: 4
---

## 1. Modularity

Main principles:
- As much stuff as possible should be modular
- Strive to make as much stuff as possible run-time togglable. Adding/removing PBOS would still be requiring to toggle any feature relying on config changes.

## 2. PBO Structure

Main principles:

- Try to keep single module dependencies as much as possible
- Interaction would be the requirement for most modules.
- Anything that is 100% config should require Common and not Interaction.

```
Main -> Common -> OptionsMenu -> Interaction -> Most things

Main -> Common -> Config things

Main -> Common -> 3D Models     |
                  Interaction | -> Feature
```

## 3. Optional .PBOs for 3rd Party Mods

- ACE3 policy is to NOT take care of compatibility with third party addons single handely. The current compatible .PBOs were kickstarted by the ACE3 team as an example to mod creators so it's clear which entries are needed for compatibility. The authors of those addons have been contatcted and many of those pbos are due to be included in their respective mods eventually.

<div class="panel callout">
    <h5>Notice for 3rd party mod creators:</h5>
    <p>Most of the config entries are inert if ACE3 is not present, so addons can be made ACE3 compatible without explicitly requiring ACE3. It is best to create and distribute compatibility .PBOs along with the original mod content; feel free to consult with ACE3 devs about how to correctly implement this. All existing compatibility .PBOs are examples and thus no further compatibility .PBOs will be provided by the ACE3 team.</p>
</div>


