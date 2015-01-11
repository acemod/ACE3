Adds keys as an item, to lock and unlock vehicles.
Primary target would be role play or TVT, but has uses in all game types, even co-ops (DAC AI will steal unlocked vehicles)

Modules allow fast setup, or can manualy add items and set variables.

Two key modes (can be used together):
Simple Side based keys (e.g. "AGM_item_key_west" works on any hunter)
Custom keys (one key will only open a specific vehicle and nothing else)

Items Added:

AGM_item_key_lockpick
AGM_item_key_master
AGM_item_key_west
AGM_item_key_east
AGM_item_key_indp
AGM_item_key_civ

Magazine added (should never be manualy added, needs to be 'programed' to work on a vehicle):	
AGM_magazine_customKey

For Mission Makers:

Modules:
Vehicle Lock Setup - Settings for lockpick strength, auto assigment of keys at start and initial vehicle lock state.
Vehicle Key Assign - Sync with vehicles and players.  Will handout custom keys to players for every synced vehicle.

Global Variable: 
AGM_VehicleLock_DefaultLockpickStrength - Time in seconds to lock pick globaly, can also set per-vehicle (-1 would disable)

Vehicle setVariables:
agm_lock_side - SIDE: overrides a vehicle's side, allows indfor to use little-bird's with indp keys
agm_vehicleLock_pickStr - NUMBER: secons, determines how long lockpicking with take, overrides AGM_VehicleLock_DefaultLockpickStrength
agm_lock_customKeys - ARRAY: array of strings of magazinesDetails, use the following function to modify

[bob, car1, true] call AGM_VehicleLock_fnc_addKeyForVehicle;
will add a "AGM_magazine_customKey" to bob and program it to work on car1