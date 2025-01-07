---
layout: wiki
title: Wardrobe Framework
description: Explains the wardrobe system and how to make a compat.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 20
  patch: 0
---


## 1. Overview

The Wardrobe Addon gives the player the opportunity to change/modify their current wearables into different variants of these.

For example, if a uniform has a normal variant and a "Rolled-Up Sleeves" variant, the player will be able to use ether an ACE Self Interaction or utilize the CBA Context Menu in their Inventory.

Since there is no common pattern in terms of class inheritence, not even within the same DLC, each possbile variant has to be defined within the classes config properties.

### 1.1 Components

Components are an optional assistance to define a group of variants where one or more variants have components that are merged into another.
For example, Western Saharah comes with turbans in different variations. Those can be interchanged to and from each other without any restriction. But there are also the the variants which utilize the balistic facemasks. In this case, the balistic facemask would be defined as a component and the turban with the the facemask would also be defined having the ballistic facemask as a component.

If the player switches from the variant with the mask to a turban variant without a mask, the mask, being a component that is no longer needed, will be deposited into the players inventory (or on the floor when full) and the turban will be changed in to the desired variant.

More examples can be found below.

### 1.2 Config Guidelines

- An Container (Uniform, Vest, Backpack) should never change its maxLoad, unless there is a really good reason for it. This will result in the loss of items.
- Variants should never "magically" add/remove parts of themselves, unless its handled through a component.
- There should not be a difference in weight between the different variants unless compoents get added/removed.
  - For Example: `Mass of Helmet with Goggles = Mass of Helmet + Mass of Goggles.`

## 2. Config

Only directly defined Subclasses will be taken into account. A fully inherited subclass will be ignored and will not provide any interaction. The ace_wardrobe properties are to be found as a subclass of the item itself. Multiple base configs are designed at root of `configFile`.

## 2.1 Properties


| Class Property |  Data Type | Description |
| -------------- |  ----------- | ----------- |
| modifiableTo[] | Array of Classnames | possible Variants this item can be turned into. |
| components[] | Array of Classnames  | Components the current variant contains within itself | 
| sound[]  | Array of CfgSound Entries | to be chosen by random when the action is performed |
| sound_timing | Number 0..1 | defines the point time relative to the duration when the sound is played |
| gesture | String of Classname | Gesture to be played when the action is performed |
| alternativePicture | String of path to icon | to be used instead of target variant picture |
| alternativeDisplayName | String | Will be used instead of the target variants displayname |
| duration | Number in seconds | Duration of action. Items are being replaced at the end. |

### 2.2 Base Classes

#### 2.2.1 Base

```cpp
// root of configFile
class ace_wardrobe_base {

    modifiableTo[] = {""};

    components[] = {};

    // Supports Multiple Sounds, will pick one by random.
    sound[] = { "ace_wardrobe_fabric_06", "ace_wardrobe_fabric_07", "ace_wardrobe_fabric_16", "ace_wardrobe_fabric_20", "ace_wardrobe_fabric_25"};
    sound_timing = 0;    // [0..1] 0 at the start of the action, 0.5 half way during the duration of the action - always, if completed or not. 1 at the end, only when completed.

    // Gesture
    gesture = "Gear";

    // These will be read from the Target Class, so for example, the uniformclass with the rolled up sleaves, it should say "Roll Up Sleeves"
    alternativePicture = "";
    alternativeDisplayName = "";

    duration = 1; // Minimum Value: 1 - Anything above will produce a progressbar.
};

```

#### 2.2.2 Base Uniform Sleeves Up / Down
Common Base Class for Uniforms with Sleeves Up/Down Variants
```cpp
class ace_wardrobe_base_U_sleeves_up: ace_wardrobe_base {
    alternativeDisplayName = CSTRING(sleevesUp);  
};
class ace_wardrobe_base_U_sleeves_down: ace_wardrobe_base {
    alternativeDisplayName = CSTRING(sleevesDown);
};
```
#### 2.2.3 Base Uniform Gloves On / Off
Common Base Class for Uniforms with Gloves On/Off Variants
```cpp
class ace_wardrobe_base_U_gloves_on: ace_wardrobe_base {
    alternativeDisplayName = CSTRING(glovesOn); 
};
class ace_wardrobe_base_U_gloves_off: ace_wardrobe_base {
    alternativeDisplayName = CSTRING(glovesOff);
};
```
#### 2.2.4  Base Uniform Jacket Open / Closed
Common Base Class for Uniforms who are open/closed in the front
```cpp
class ace_wardrobe_base_U_jacket_open: ace_wardrobe_base {
    alternativeDisplayName = CSTRING(jacketOpen); 
};
class ace_wardrobe_base_U_jacket_closed: ace_wardrobe_base {
    alternativeDisplayName = CSTRING(jacketClose);
};
```

#### 2.2.5 Base Helmet Visor Up / Down
Common Base Class for Helmets with a Visor that can be flipped up or down.
Here, the duration is carefully timed to be aligned with the "click" of the soun.

```cpp
class ace_wardrobe_base_H_visor_up: ace_wardrobe_base {
    duration = 0.25;
    gesture ="gestureNod";

    sound[] = {CN_SOUND(helmet_visor,05)};
    sound_timing = 0;

    alternativeDisplayName = CSTRING(visorUp);
};

class ace_wardrobe_base_H_visor_down: ace_wardrobe_base {
    duration = 0.25;
    gesture ="gestureNod";

    sound[] = {"ace_wardrobe_05"};
    sound_timing = 0;

    alternativeDisplayName = CSTRING(visorDown);
};
```
#### 2.2.6 Base Headgear with Goggles on / off
Common Base Class for Headgear with goggles that can be used as a facewear item.
```cpp
class ace_wardrobe_base_H_goggles_on: ace_wardrobe_base {
    gesture ="GestureWipeFace";
    alternativeDisplayName = CSTRING(gogglesOn);
};

class ace_wardrobe_base_H_goggles_off: ace_wardrobe_base {
    gesture ="GestureWipeFace";
    alternativeDisplayName = CSTRING(gogglesOff);
};
```


## 3. Examples

### 3.1 Linear Example

- first, we import the wardrobe base classes `ace_wardrobe_base_U_sleeves_down` and `ace_wardrobe_base_U_sleeves_up` at the root of `configFile`.
- The uniform we would like to configure is part of CfgWeapons and inherits from `Uniform_Base`.
- Then we edit the desired classes and create the `ace_wardrobe` subclass by inheriting from the partent base classes.
- Afterwards, we define which variants this class can be modified to.
- This Example does not require the use of components since we're not adding or removing anything.
```cpp
// config.cpp
class ace_wardrobe_base_U_sleeves_down;
class ace_wardrobe_base_U_sleeves_up;

class CfgWeapons {
    class Uniform_Base;

    // Sleeves Down Variant
    class U_B_CTRG_1: Uniform_Base {
        class ace_wardrobe: ace_wardrobe_base_U_sleeves_down {
            modifiableTo[] = { "U_B_CTRG_3" };
            components[] = {};
        };
    };

    // Sleeves Up Variant
    class U_B_CTRG_3: Uniform_Base {
        class ace_wardrobe: ace_wardrobe_base_U_sleeves_up {
            modifiableTo[] = { "U_B_CTRG_1" };
            components[] = {};
        };
    };
};
```
### 3.2 Complex Example with partial use of components


```cpp
// config.cpp
class ace_wardrobe_base;

class CfgWeapons {
    // BASECLASS
    class H_Shemag_khk;
    
    // WS Turban with Balistic Mask
    class H_turban_02_mask_black_lxws: H_Shemag_khk {
        class ace_wardrobe: ace_wardrobe_base {
            modifiableTo[] = { "lxWS_H_turban_01_black", "lxWS_H_turban_02_black", "lxWS_H_turban_03_black", "lxWS_H_turban_04_black" };
            components[] = { "lxWS_H_bmask_base" };
        };
    };
    // WS Turban Variant 1
    class lxWS_H_turban_01_black: H_Shemag_khk {
        class ace_wardrobe: ace_wardrobe_base {
            modifiableTo[] = { "lxWS_H_turban_02_black", "lxWS_H_turban_03_black", "lxWS_H_turban_04_black", "H_turban_02_mask_black_lxws" };
            components[] = { }; // not required to be defined since it empty array get inherited from the base parent.
        };
    };
    // WS Turban Variant 2
    class lxWS_H_turban_02_black: lxWS_H_turban_01_black {
        class ace_wardrobe: ace_wardrobe_base {
            modifiableTo[] = { "lxWS_H_turban_01_black", "lxWS_H_turban_03_black", "lxWS_H_turban_04_black", "H_turban_02_mask_black_lxws" };
            components[] = { }; // not required to be defined since it empty array get inherited from the base parent.
        };
    };
    // WS Turban Variant 3
    class lxWS_H_turban_03_black: lxWS_H_turban_01_black {
        class ace_wardrobe: ace_wardrobe_base {
            modifiableTo[] = { "lxWS_H_turban_01_black", "lxWS_H_turban_02_black", "lxWS_H_turban_04_black", "H_turban_02_mask_black_lxws" };
            components[] = { }; // not required to be defined since it empty array get inherited from the base parent.
        };
    };
    // WS Turban Variant 4
    class lxWS_H_turban_04_black: lxWS_H_turban_01_black {
        class ace_wardrobe: ace_wardrobe_base {
            modifiableTo[] = { "lxWS_H_turban_01_black", "lxWS_H_turban_02_black", "lxWS_H_turban_03_black", "H_turban_02_mask_black_lxws" };
            components[] = { }; // not required to be defined since it empty array get inherited from the base parent.
        };
    };
};

```


### 3.3 Complex Example with thorough use of components

```cpp
// config.cpp
class ace_wardrobe_base;

class CfgGlasses {
    class None;
    class G_Balaclava_blk;
    class G_Bandanna_shades;

    // Aviator Sunglasses
    class G_Aviator: None {
        class ace_wardrobe: ace_wardrobe_base {
            modifiableTo[] = { "G_Bandanna_aviator" };
            components[] = {"G_Aviator"};
        };
    };
    // Bandana, Black with Aviator Sunglasses
    class G_Bandanna_aviator: G_Bandanna_shades {
        class ace_wardrobe: ace_wardrobe_base {
            modifiableTo[] = { "G_Bandanna_blk", "G_Aviator" };       
            components[] = { "G_Bandanna_blk", "G_Aviator" };
        };
    };
    // Bandana, Black
    class G_Bandanna_blk: G_Balaclava_blk {
        class ace_wardrobe: ace_wardrobe_base {
            modifiableTo[] = { "G_Bandanna_aviator" };
            components[] = { "G_Bandanna_blk" };
        };
    };
};
```

## 4. Sounds

The following CfgSounds classes are integrated in ace_wardrobe and are the default sounds for the `ace_wardrobe_base` and `ace_wardrobe_base_H_visor_up`/`ace_wardrobe_base_H_visor_down` base classes.

### 4.1 Integrated Sounds

The number at the end of the classnames indicates the length of the file in 1/10th seconds.
10 -> 1 sec, 15 -> 1.5sec, ...

- `ace_wardrobe_fabric_06`
- `ace_wardrobe_fabric_07`
- `ace_wardrobe_fabric_16`
- `ace_wardrobe_fabric_20`
- `ace_wardrobe_fabric_25`
- `ace_wardrobe_helmet_visor_05`