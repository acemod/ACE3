---
layout: wiki
title: Tagging Framework
description: Explains how to use tagging framework to add custom tags.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 7
  patch: 0
---

<div class="panel callout">
    <h5>Note:</h5>
    <p>This is just a guide to add tags using the framework. This is not a guide to make your own spray objects.</p>
</div>

## 1. Config Values

### 1.1 Adding a tag

```cpp
class ACE_Tags {
    class yourTagClass {
        displayName = "My Tag";  // Name of your tag being displayed in the interaction menu
        requiredItem = "ACE_SpraypaintBlack";  // Required item to have in the inventory to be able to spray your tag (eg. `"ACE_SpraypaintBlack"`, `"ACE_SpraypaintRed"`, `"ACE_SpraypaintGreen"`, `"ACE_SpraypaintBlue"` or any custom item from `CfgWeapons`)
        textures[] = {"path\to\texture1.paa", "path\to\texture2.paa"};  // List of texture variations (one is randomly selected when tagging)
        icon = "path\to\icon.paa";  // Icon being displayed in the interaction menu
    };
};
```


## 2. Scripting

### 2.1 Adding a tag

`ace_tagging_fnc_addCustomTag`

   | Arguments | Type | Optional (default value)
---| --------- | ---- | ------------------------
0  | Unique Identifier | String | Required
1  | Display Name | String | Required
2  | Required Item | String | Required
3  | Textures | Array | Required
4  | Icon | String | Optional (default: `""` - Default white point)
**R** | Successfully Added Tag | Boolean | Return value

#### 2.1.1 Example

`["ace_victoryRed", "Victory Red", "ACE_SpraypaintRed", ["tagTexture1.paa", "tagTexture2.paa"], "icon.paa"] call ace_tagging_fnc_addCustomTag;`

   | Arguments | Explanation
---| --------- | -----------
0  | `"ace_victoryRed"` | Unique identifier (similar to class name)
1  | `"Victory Red"` | Name of your tag being displayed in the interaction menu
2  | `"ACE_SpraypaintRed"` | Required item to have in the inventory to be able to spray your tag
3  | `["tagTexture1.paa", "tagTexture2.paa"]` | List of texture variants (one is randomly selected when tagging)
4  | `"icon.paa"` | Icon being displayed in the interaction menu
