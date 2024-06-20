---
layout: wiki
title: Attach Framework
description: Explains how to add items to the ACE Attach Framework.
group: framework
order: 0
parent: wiki
mod: ace
version:
  major: 3
  minor: 17
  patch: 0
---

## 1. Config Values
### 1.1 Make item attachable

An item can be added to the ACE Attach framework by adding the `ACE_attachable` property to a class in `CfgWeapons` or `CfgMagazines`. The value must be the classname of a valid class in `CfgVehicles`:
```cpp
class CfgWeapons {
    class attach_item: CBA_MiscItem {
        ACE_attachable = "new_attachable_item_classname";
    };
};

class CfgVehicles {
    class ThingX;
    class new_attachable_item_classname: ThingX {
        scope = 1; // Should be 1 (private) or 2 (public), scope 0 will cause errors on object creation
        displayName = "New ACE attachable item";
        model = "\path\to\my\model.p3d";
        vehicleClass = "";
    };
};
```

### 1.2 Define attach orientation for non-symmetric items
In the case the item needs to have a particular orientation when attached, add the config value: `ace_attach_orientation` which is an array describing the `roll` and `yaw` orientation of the object.
The default value is: `[0,0]`.

Example:
```cpp
class CfgWeapons {
    class attach_item: CBA_MiscItem {
        ACE_attachable = "new_attachable_item_classname";
        ace_attach_orientation[] = {0,180}; // 180deg yaw
    };
};
```

## 2. Event Handlers
### 2.1 Listenable Events
| Event Key | Parameters | Locality | Description |
|----------|---------|---------|---------|
|`ace_attach_attached` | [_attachedObject, _itemClassname, _temporary] | Local | Called after an item is attached to an object. `_temporary` flag means the item is being re-attached (after a unit is exiting a vehicle, for example) |
|`ace_attach_detaching` | [_attachedObject, _itemClassname, _temporary] | Local | Called just before an item is detached/removed from an object. `_temporary` flag means the item will be reattached later, see above. |

### 2.2 Other events for attached objects
Use [CBA Extended Event Handlers](https://github.com/CBATeam/CBA_A3/wiki/Extended-Event-Handlers-(new)). Note that objects attached to units will be deleted/created upon entering/exiting vehicles and should be handled accordingly.
