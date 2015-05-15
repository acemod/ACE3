---
layout: wiki
title: Modularity And PBO Structure
description: 
group: development
parent: wiki
order: 4
---

###  Modularity

Main principles:
- As much stuff as possible should be modular
- Strive to make as much stuff as possible run-time togglable. Adding/removing PBOS would still be requiring to toggle any feature relying on config changes.

### PBO Structure

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
