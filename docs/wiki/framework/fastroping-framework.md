---
layout: wiki
title: Fast Roping Framework
description: Explains the config values and functions used for making a helicopter fast roping capable.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 5
  patch: 0
---

If you want to prepare a helicopter from your addon for fast roping, there's a few ways to do that.

## 1. Using simple rope origin points

By using simple rope origin points you will only need two config entries:

```
ace_fastroping_enabled = 1;
ace_fastroping_ropeOrigins[] = {
    {x, y, z},
    {x, y, z}
};
```

This will create the ropes at the two given points. If you have defined memory points for the rope origins, you can use them too:

```
ace_fastroping_enabled = 1;
ace_fastroping_ropeOrigins[] = {"ropeOriginLeft", "ropeOriginRight"};
```

You can also use more or less than two rope origins. You can additionally execute code on rope deployment and rope cutting, for example for opening and closing the helicopters doors, see "3. Using onPrepare and onCut functions" for that.

## 2. Using a FRIES

If your helicopter is not fast roping capable by default, you can make it take a FRIES. A FRIES is just a simple model that gets attached to the helicopter with its own rope origin points. ACE3 already includes two FRIES that are used in real life and can be attached to most helicopters.

To make your helicopter FRIES capable, you need to add the following config entries:

```
ace_fastroping_enabled = 2;
ace_fastroping_friesType = "yourFRIESType";
ace_fastroping_friesAttachmentPoint[] = {x, y, z};
ace_fastroping_onCut = "ace_fastroping_fnc_onCutCommon";
ace_fastroping_onPrepare "ace_fastroping_fnc_onPrepareCommon";
ace_fastroping_ropeOrigins[] = {"ropeOriginLeft", "ropeOriginRight"};
```

Let us go through each of them:

- `ace_fastroping_enabled = 2` tells ACE that your helicopter is fast roping capabale but needs a FRIES for that.
- `ace_fastroping_friesType` defines the object that will be used as a FRIES on your helicopter
- `ace_fastroping_friesAttachmentPoint` defines the coordinates at which the FRIES will be attached to.
- See 3.3 for more information about `ace_fastroping_onCut` and `ace_fastroping_onPrepare`. Note: These two entries are necessary for fast roping with a FRIES.
- `ace_fastroping_ropeOrigins` defines the memory points or coordinates from the FRIES where the ropes will be attached to.

## 2.1 Using one of the given FRIES

ACE3 includes two FRIES:

- `ACE_friesAnchorBar`, a system with two extendable rope hooks, based on a system used in the UH60 Blackhawk
- `ACE_friesGantry`, a system consisting of two symmetrical external gantries

Both can be used with 3rd party helicopters. To adjust the width or rotation of the gantries on the second FRIES, you will need to adjust the `initPhase` on the animations. Please look into their current config for further details.

## 2.2 Creating a custom FRIES

To create a custom FRIES you will need to look out for a few things:

- Make sure your FRIES inherits from `ACE_friesBase`.
- If possible, create memory points for the rope origins and name them "ropeOriginLeft" and "ropeOriginRight" for consistency.
- If your FRIES has an animations that should get executed on FRIES preparation and rope cutting, it's recommended to name them "extendHookLeft" and "extendHookRight" so the current `ace_fastroping_fnc_onCutCommon` and `ace_fastroping_fnc_onPrepareCommon` functions can be used.

## 3. Using onPrepare and onCut functions

The `onCut` and `onPrepare` functions are responsible for opening/closing the helicopter doors and animating the FRIES (if equipped) when the FRIES gets prepared and the ropes get cut.

ACE3 provides two functions that are compatible with most helicopters and all ACE3 FRIES. It is recommended to use the naming scheme for doors that is present in the base game so you can use the already existing functions `ace_fastroping_fnc_onCutCommon` and `ace_fastroping_fnc_onPrepareCommon`. You can however define your own functions if you so desire. Note that these functions run in the unscheduled environment, so commands like `sleep` and `waitUntil` will not work unless you use `spawn`. It is recommended to use `ace_common_fnc_waitAndExecute` and `ace_common_fnc_waitUntilAndExecute` instead though.
