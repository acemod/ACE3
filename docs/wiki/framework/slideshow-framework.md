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

<div class="panel callout">
<h5>Note:</h5>
<p>Mission MUST be in a PBO format (not bare folder) when used on a dedicated server with slideshow images inside a mission due to an <a href="https://feedback.bistudio.com/T80668">issue</a> to prevent errors.</p>
</div>


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
**R** | None | None | Return value

_Note: Set Name argument added in 3.9.1._

#### 2.1.1 Example

`[[object1, object2], [controller1], ["images\image1.paa", "images\image2.paa"], ["Action1", "Action2"], 5, "My Slides"] call ace_slideshow_fnc_createSlideshow;`

   | Arguments | Explanation
---| --------- | -----------
0  | `[object1, object2]` | Objects on which images will be projected on
1  | `[controller1]` | Objects with which slideshow can be controlled
2  | `["images\image1.paa", "images\image2.paa"]` | Paths to images projected on screen objects
3  | `["Action1", "Action2"]` | Action names for interaction menu if automatic transitions are not enabled
4  | `5` | 5s slide duration before change to next image
5  | `"My Slides"` | Main interaction point name, for easier distinguishing of multiple slideshow sets
