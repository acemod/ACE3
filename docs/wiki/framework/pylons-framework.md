---
layout: wiki
title: Pylons Framework
description: Explains how to set-up pylons whitelist and blacklist
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 13
  patch: 0
---

### 1 Setting a whitelist

To set a whitelist, set the `ace_pylons_magazineWhitelist` variable with an array containing possible magazines.

For example, place an AH-9 Pawnee, with the following in init line:

`this setVariable ["ace_pylons_magazineWhitelist", ["PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_7Rnd_Rocket_04_AP_F"]];`.

Blacklists are set in the same way. Set the `ace_pylons_magazineBlacklist` variable with an array containing banned magazines.

`this setVariable ["ace_pylons_magazineBlacklist", ["PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_7Rnd_Rocket_04_AP_F"]];`.

This would set the only available loadouts to be Hydra 70s. This will not change what is loaded by default, or affect whether it can rearm.
