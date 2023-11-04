---
layout: wiki
title: Attach Framework
description: Explains how to add items to ACE's Attach system.
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

An item can be added to ACEs "Attach to Vehicle" and "Attach to Self" system by adding the following config value to the ``CfgWeapons`` or ``CfgMagazines`` configs:
```cpp
class CfgWeapons {
    class attach_item: CBA_MiscItem {
        ACE_attachable = "new_attachable_item_classname";
    };
};
```

The classname in ``ACE_attachable`` has to match a config value in ``CfgVehicle`` which to be able to spawn the physical item in the world. Example:
```cpp
class CfgVehicles {
    class ThingX;
	// The object that gets created and attached in ACE
    class new_attachable_item_classname: ThingX {
        scope = HIDDEN;
        displayName = "New ACE attachable item";
        model = QPATHTOF(data\model_file.p3d);
		vehicleClass = "";
    };
};
```

### 1.2 Define attach orientation for non-symmetric items
In the case the item needs to have a particular orientation when attached, add the config value: ``ACE_attachable_orientation`` which is an array describing the ``vectorDir`` orientation of the object.  
The default value is: ``[1,0,0]``. 

Example: 
```cpp
class CfgWeapons {
    class attach_item: CBA_MiscItem {
        ACE_attachable = "new_attachable_item_classname";
        ACE_attachable_orientation[] = {-1,0,0};
    };
};
```

## 2. Event Handlers
### 2.1 Attach Events   
Attach system have certain events for attaching and detatching you can listen to:  

| Event Key | Parameters | Locality | Type | Description |
|----------|---------|---------|---------|---------|---------|
|`ace_attach_attached` | [_attachedObject, _itemClassname, _temporary] | Local | Listen | After an item was attached to a unit/vehicle. _temporary flag means a item is being re-attached after the player exits a vehicle
|`ace_attach_detaching` | [_attachedObject, _itemName, _temporary] | Local | Listen | Just before an item gets detached/removed from a unit/vehicle. _temporary flag means its detached because the player unit entered a vehicle.


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
	 	init = QUOTE( _this call FUNC(initEvent));
	};
};
```

Make sure that the classname you are listening to is the one defined in ``CfgVehicles`` as this is the physical item that gets created when attached.   
**NOTE:** If attaching the object to yourself, as a player, then the init event will be rerun everytime you leave a vehicle, as ACE Attach system will remove and re-add player attached items whenever they enter and leave vehicles.   