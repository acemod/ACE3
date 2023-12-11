---
layout: wiki
title: Slideshow Framework
description: Explains how to set-up slideshows.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 2
  patch: 0
---

## 1. Overview

Slideshow is a very powerful tool for mission makers and platoon leaders giving them the power to project images on some objects.

Slideshow is setup through a module or [function](#create-slideshow).

Important notes:

- Only objects with `hiddenSelection` `0` can be used as "screens".
- If you set a duration the remotes will be disabled (if the remotes are disabled `ace_interaction` is not needed).
- You can have multiple sets of images on different screens by using multiple modules/function calls.
- It is advisable images resolution sizes are powers of 2 (eg. 512x512) to avoid graphical glitches in them.


## 2. Scripting

### 2.1 Create Slideshow

`ace_slideshow_fnc_createSlideshow`

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Screen Objects | Array | Required
1  | Controller Objects | Array | Required (screen objects are used if empty `[]`, none are available with automatic transitions)
2  | Image Paths | Array | Required (paths must use backslash `\`)
3  | Action Names | Array | Required
4  | Slide Duration | Number | Optional (default: `0`, `0` disables automatic transitions)
5  | Set Name | String | Optional (default: localized `"Slides"`)
6  | Texture Selection | Number | Optional (default: `0`)
**R** | None | None | Return value

_Note: Set Name argument added in 3.9.1._

#### 2.1.1 Example

`[[object1, object2], [controller1], ["images\image1.paa", "images\image2.paa"], ["Action1", "Action2"], 5, "My Slides", 1] call ace_slideshow_fnc_createSlideshow;`

   | Arguments | Explanation
---| --------- | -----------
0  | `[object1, object2]` | Objects on which images will be projected on
1  | `[controller1]` | Objects with which slideshow can be controlled
2  | `["images\image1.paa", "images\image2.paa"]` | Paths to images projected on screen objects
3  | `["Action1", "Action2"]` | Action names for interaction menu if automatic transitions are not enabled
4  | `5` | 5s slide duration before change to next image
5  | `"My Slides"` | Main interaction point name, for easier distinguishing of multiple slideshow sets
6  | `1` | Uses texture selection 1 for objects with multiple options

### 2.2 Create Map Images

`ace_slideshow_fnc_mapImage`

```sqf
 * Returns a procedural texture that will display a custom map.
 * Needs to be run on all machines.
 *
 * Arguments:
 * 0: Position <ARRAY> (default: center of map)
 * 1: Scale (1.0 fits entire map in x-dimension) <NUMBER> (default: 1.25)
 * 2: Markers <ARRAY> (default: [])
 * - 0: Position 2D/3D <ARRAY> (default: [0, 0, 0])
 * - 1: Text <STRING> (default: "")
 * - 2: Marker Type or Icon Name <STRING> (default: "mil_dot")
 * - 3: Color <ARRAY> (default: [1, 0, 0, 1])
 * 3: Map Type (0: Normal, 1: Topographic, 2: Satelite) or any custom class (even mission config) <NUMBER, STRING> (default: 0)
 * 4: Code to run on init (will be passed [_map, _display, _displayID]) <CODE> (default: {})
 * 5: Resolution <NUMBER> (default: 4096)
```

### 2.2.1 Map Slideshow Example

```sqf
tex1 = [] call ace_slideshow_fnc_mapImage;
tex2 = [(getPos aWhiteboard), 0.5, [[getpos aWhiteboard, "you", "mil_start"]], 0] call ace_slideshow_fnc_mapImage;
tex3 = [[4000, 4000], 0.5, [[[5000, 5000], "target", "mil_objective"]], 2] call ace_slideshow_fnc_mapImage;
[[aWhiteboard], [], [tex1, tex2, tex3], ["Full", "Sat Start", "Sat Objective"]] call ace_slideshow_fnc_createSlideshow;  
```

### 2.2.2 Map Slideshow Advanced Example

```sqf
private _initCode = {
   params ["_map", "", "_displayID"];

   // Add custom draw event handler (will only be called when display is actually updated)
   _map ctrlAddEventHandler ["draw", {
      params ["_map"];
      _map drawIcon ["\A3\Drones_F\Air_F_Gamma\UAV_02\Data\UI\Map_UAV_02_CA.paa", [0, 0, 1, 1], getPos theUAV, 24, 24, getDir theUAV];
   }];

    // Live update the map
    [{
        params ["_displayID","_idPFH"];
        private _display = findDisplay _displayID;
        if (isNull _display) exitWith { 
            systemChat format ["%1 - removing pfeh", _this];
            [_idPFH] call CBA_fnc_removePerFrameHandler;
        };
        displayUpdate _display;
        
        private _map = _display displayCtrl 1;
        _map ctrlMapAnimAdd [0, 0.3, getpos theUAV];
        ctrlMapAnimCommit _map;
    }, 0, _displayID ] call CBA_fnc_addPerFrameHandler;
};

tex4 = [nil, 0.3, [[getpos aComputer, "you", "mil_start"]], 2, _initCode] call ace_slideshow_fnc_mapImage;
[[aComputer, aComputer2], [], [tex4], ["Sat Follow UAV"]] call ace_slideshow_fnc_createSlideshow;
```
