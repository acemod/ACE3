ace_vehiclelock
===============

Adds keys as an item, to lock and unlock vehicles.
Primary target would be role play or TVT, but has uses in all game types, even co-ops (e.g.: DAC AI will steal unlocked vehicles)

Two key modes (can be used together):
Simple Side based keys (e.g. "ACE_key_west" works on any hunter)
Custom keys (one key will only open a specific vehicle and nothing else)

#### Items Added:

`ACE_key_lockpick`
`ACE_key_master`
`ACE_key_west`
`ACE_key_east`
`ACE_key_indp`
`ACE_key_civ`

#### Magazine added (should never be manualy added, needs to be 'programed' to work on a vehicle):
`ACE_key_customKeyMagazine`

#### For Mission Makers:

#### Modules:
Vehicle Lock Setup - Settings for lockpick strength and initial vehicle lock state.
Vehicle Key Assign - Sync with vehicles and players.  Will handout custom keys to players for every synced vehicle.

#### Global Variable:
`ACE_VehicleLock_DefaultLockpickStrength` - Time in seconds to lock pick globaly, can also set per-vehicle (-1 would disable)

#### Vehicle setVariables:
`ACE_lock_side` - SIDE: overrides a vehicle's side, allows indfor to use little-bird's with indp keys
`ACE_vehicleLock_pickStr` - NUMBER: secons, determines how long lockpicking with take, overrides ACE_VehicleLock_DefaultLockpickStrength
`ACE_lock_customKeys` - ARRAY: array of strings of magazinesDetails, use the following function to modify

`[bob, car1, true] call ACE_VehicleLock_fnc_addKeyForVehicle;`
will add a `ACE_magazine_customKey` to bob and program it to work on car1

## Maintainers

The people responsible for merging changes to this component or answering potential questions.

- [PabstMirror](https://github.com/PabstMirror)