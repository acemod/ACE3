---
layout: wiki
title: XM157 Framework
description: Explains how to add the XM157 scope framework
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 5
  minor: 1
  patch: 0
---

## 1. Config Values

### 1.1 Scope config

```cpp
class CfgWeapons {
    class ItemCore;
    class InventoryOpticsItem_Base_F;

    class your_XM157: ItemCore {
        class CBA_ScriptedOptic {
            bodyTexture = "\z\ace\addons\xm157\data\ace_vector_body_co.paa";
            bodyTextureSize = 1;
            hideMagnification = 1;
            disableTilt = 0;
        };
        weaponInfoType = "ace_xm157_info";
        class ItemInfo: InventoryOpticsItem_Base_F {
            modelOptics = "\x\cba\addons\optics\cba_optic_big_100.p3d";
            class OpticsModes {
                class optic {
                    opticsID=1;
                    useModelOptics=1;
                    opticsPPEffects[]={ "OpticsCHAbera1", "OpticsBlur1" };
                    opticsZoomMin = "8 call (uiNamespace getVariable 'cba_optics_fnc_setOpticMagnificationHelper')";
                    opticsZoomMax = "1 call (uiNamespace getVariable 'cba_optics_fnc_setOpticMagnificationHelper')";
                    opticsZoomInit = "1 call (uiNamespace getVariable 'cba_optics_fnc_setOpticMagnificationHelper')";
                    discreteDistance[] = {100};
                    discreteDistanceInitIndex = 0;
                    distanceZoomMin=100;
                    distanceZoomMax=100;
                    memoryPointCamera="opticView";
                    visionMode[] = {"Normal"};
                    opticsFlare=1;
                    opticsDisablePeripherialVision=1;
                    cameraDir="";
                };
            };
        };
    };
};

```
### 1.2 Ammo Config
Shells can be set to airburst based on lased distance

```cpp
class myAmmo: G_40mm_HE {
    class Eventhandlers {
        fired = QUOTE(call ace_xm157_fnc_airburst_ammoFired);
    };
};
```
