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
  minor: 18
  patch: 2
---


## 1. Overview

## 2. Config

- Only directly defined Subclasses will be taken into account. An fully inherited subclass will be ignored and will not provide an Interaction.

## 2.1 Properties

### 2.2 Base Classes

#### 2.2.1 Base

#### 2.2.2 Base Uniform Sleeves Up / Down

#### 2.2.3 Base Uniform Gloves On / Off

#### 2.2.4 Base Uniform Jacket Open / Closed

#### 2.2.4 Base Helmet Visor Up / Down


## 3. Examples

### 3.1 Linear Example

### 3.2 Advanced Example (Components)


## 4. Sounds



### 4.1 Integrated Sounds







<!--- WIP - Formatting Examples below ~~~


### 1.1 Adding a tag

```cpp
class ACE_Tags {
    class yourTagClass {
        displayName = "My Tag";  // Name of your tag being displayed in the interaction menu
        requiredItem = "ACE_SpraypaintBlack";  // Required item to have in the inventory to be able to spray your tag (eg. `"ACE_SpraypaintBlack"`, `"ACE_SpraypaintRed"`, `"ACE_SpraypaintGreen"`, `"ACE_SpraypaintBlue"` or any custom item from `CfgWeapons`)
        textures[] = {"path\to\texture1.paa", "path\to\texture2.paa"};  // List of texture variations (one is randomly selected when tagging)
        materials[] = {"path\to\material.rvmat"}; // Optional: List of material variations (one is randomly selected). Keep empty if you don't need a custom material.
        icon = "path\to\icon.paa";  // Icon being displayed in the interaction menu
        tagModel = "UserTexture1m_F"; // Optional: The 3D Model that will be spawned with the texture on it, can either be CfgVehicles classname or P3D file path.
    };
};
```


## 2. Scripting

### 2.1 Adding a tag

`ace_tagging_fnc_addCustomTag`

|    | Arguments | Type | Optional (default value) |
| ---| --------- | ---- | ------------------------ |
| 0  | Unique Identifier | String | Required |
| 1  | Display Name | String | Required |
| 2  | Required Item | String | Required |
| 3  | Textures | Array | Required |
| 4  | Icon | String | Optional (default: `""` - Default white point) |
| 5  | Material Paths | Array | Optional (default: `[]` - No custom material) |
| 6  | Tag Model | String | Optional (default: `"UserTexture1m_F"` - 1x1m texture surface) |
| **R** | Successfully Added Tag | Boolean | Return value |

#### 2.1.1 Example

`["ace_victoryRed", "Victory Red", "ACE_SpraypaintRed", ["tagTexture1.paa", "tagTexture2.paa"], "icon.paa"] call ace_tagging_fnc_addCustomTag;`

|    | Arguments | Explanation |
| ---| --------- | ----------- |
| 0  | `"ace_victoryRed"` | Unique identifier (similar to class name) |
| 1  | `"Victory Red"` | Name of your tag being displayed in the interaction menu |
| 2  | `"ACE_SpraypaintRed"` | Required item to have in the inventory to be able to spray your tag |
| 3  | `["tagTexture1.paa", "tagTexture2.paa"]` | List of texture variants (one is randomly selected when tagging) |
| 4  | `"icon.paa"` | Icon being displayed in the interaction menu |


### 2.2 Tags in description.ext

Tags can also be configured in description.ext like shown above.
File Paths will be relative to your mission, if you want to define Tags inside description.ext but use Addon paths for `Texture`/`Material`/`TagModel` you need to prefix the path with `@`.

This is how above config would look when using Addon paths from description.ext:

```cpp
class ACE_Tags {
    class yourTagClass {
        displayName = "My Tag";  // Name of your tag being displayed in the interaction menu
        requiredItem = "ACE_SpraypaintBlack";  // Required item to have in the inventory to be able to spray your tag (eg. `"ACE_SpraypaintBlack"`, `"ACE_SpraypaintRed"`, `"ACE_SpraypaintGreen"`, `"ACE_SpraypaintBlue"` or any custom item from `CfgWeapons`)
        textures[] = {"@path\to\texture1.paa", "@path\to\texture2.paa"};  // List of texture variations (one is randomly selected when tagging)
        materials[] = {"@path\to\material.rvmat"}; // Optional: List of material variations (one is randomly selected). Keep empty if you don't need a custom material.
        icon = "@path\to\icon.paa";  // Icon being displayed in the interaction menu
        tagModel = "UserTexture1m_F"; // Optional: The 3D Model that will be spawned with the texture on it, can either be CfgVehicles classname or P3D file path.
    };
};
```









<div class="panel callout">
    <h5>Note:</h5>
    <p>This is just a guide to add tags using the framework. This is not a guide to make your own spray objects.</p>
</div>

--!>