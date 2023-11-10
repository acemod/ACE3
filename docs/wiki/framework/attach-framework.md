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

An item can be added to the ACE Attach framework by adding the ``ACE_attachable`` property to a class in ``CfgWeapons`` or ``CfgMagazines``. The value must be the classname of a valid class in ``CfgVehicles``:
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
In the case the item needs to have a particular orientation when attached, add the config value: ``ace_attach_orientation`` which is an array describing the ``roll`` and ``yaw`` orientation of the object.  
The default value is: ``[0,0]``. 

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
|----------|---------|---------|---------|---------|---------|
|`ace_attach_attached` | [_attachedObject, _itemClassname, _temporary] | Local | Called after an item is attached to an object. `_temporary` flag means the item is being re-attached (after a unit is exiting a vehicle, for example)
|`ace_attach_detaching` | [_attachedObject, _itemClassname, _temporary] | Local | Called just before an item is detached/removed from an object. `_temporary` flag means the item will be reattached later, see above.


### 2.2 Init event for newly attached objects
If you wish to listen to the ``postInit`` event of the physical object that gets attached after its created and attached, use ``CBA_Extended_EventHandlers`` in the ``CfgVehicles`` config of your new item:
```cpp
class CBA_Extended_EventHandlers_base;
class CfgVehicles {
    class ThingX;
	// The object that gets created and attached in ACE
    class new_attachable_item_classname: ThingX {
        scope = HIDDEN;
        displayName = "New ACE attachable item";
        model = QPATHTOF(data\model_file.p3d);
		vehicleClass = "";
        
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers_base {};
        };
    };
};
```
You can then register the listener in ``CfgEventHandlers``:
```cpp
class Extended_InitPost_Eventhandlers {
	class new_attachable_item_classname {
	 	init = QUOTE(_this call FUNC(initEvent));
	};
};
```

Make sure that the classname you are listening to is the one defined in ``CfgVehicles`` as this is the physical item that gets created when attached.   

**NOTE:** If attaching the object to yourself, as a player, then the init event will be rerun everytime you leave a vehicle, as ACE Attach system will remove and re-add player attached items whenever they enter and leave vehicles.   
