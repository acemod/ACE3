---
layout: wiki
title: Flags Framework
description: Explains how to add custom placeable and carryable flags.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 19
  patch: 0
---


## 1. Adding custom flag

Adding a custom flag requires you to create an addon containing specific classes and properties in the config.

### 1.1 Add the item

The easiest way to add a new item is to inherit from an existing flag item. For a item to be detected by the framework, it must have the `ace_flags_texture` and `ace_flags_carrier` properties defined.

```cpp
class CfgWeapons {
    class ace_flags_white;
    class CBA_MiscItem_ItemInfo;
    class TAG_MyFlag: ace_flags_white {
        author = "Me";
        displayName = "Flag (Mine)"; // Item/Flag name
        picture = "\addon_prefix\data\pictures\my_flag_inventory_pic.paa"; // Path to the picture for the inventory item

        ace_flags_texture = "\addon_prefix\data\flags\my_flag.paa"; // Path to the flag texture
        ace_flags_carrier = "TAG_Carrier_MyFlag"; // Classname of the corresponding vehicle that gets placed.
        
        // Path to the icon for the place action. Do not overwrite for default white icon (inherited by ace_flags_white).
        ace_flags_actionIconPlace = "\addon_prefix\data\icons\my_flag_place_icon.paa";
        // Path to the icon for the carry action. Do not overwrite for default white icon (inherited by ace_flags_white).
        ace_flags_actionIconCarry = "\addon_prefix\data\pictures\my_flag_carry_icon.paa";

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 6.6; // (Optional) Overwrite default item/flag mass. We're assuming 300g.
        };
    };
};
```

### 1.2 Add the carrier

Each flag item requires a flag carrier. This is the object that is placed. Inherit from an existing flag carrier, so that the pickup action is shown and the flag texture is set as defined in the corresponding item config. 

```cpp
class CfgVehicles {
    class ace_flags_carrier_white;
    class TAG_Carrier_MyFlag: ace_flags_carrier_white {
        author = "Me";
        displayName = "Flag (Mine)"; // Item/Flag name
        editorPreview = "\addon_prefix\data\editorpreviews\my_flag_carrier.jpg"; // Preview picture shown in editor
    };
};
```

### 1.3 Template for the Carryable Flag Texture

![Image of Template Flag Texture](../../img/flag_carryable_template.png)

This template can also be found inside the addon's data folder.
