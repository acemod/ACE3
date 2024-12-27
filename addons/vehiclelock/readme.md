ace_vehiclelock
===============

Adds keys as an item, to lock and unlock vehicles.
Primary target would be role play or TVT, but has uses in all game types, even co-ops (e.g.: DAC AI will steal unlocked vehicles)

Two key modes (can be used together):
* Simple Side based keys (e.g. "ACE_key_west" works on any [WEST] vehicle like the M-ATV//hunter)
* Custom keys (one key will only open a specific vehicle and nothing else)

#### Items Added:

`ACE_key_lockpick`
`ACE_key_master`
`ACE_key_west`
`ACE_key_east`
`ACE_key_indp`
`ACE_key_civ`

#### Magazine added:
`ACE_key_customKeyMagazine` (should never be manualy added, needs to be "programed" to work on a vehicle, see `ACE_VehicleLock_fnc_addKeyForVehicle`)

## For Mission Makers:

#### Modules:
* Vehicle Lock Setup - Settings for locking inventory of locked vehicles, default lockpick time, and initial vehicle lock state.
* Vehicle Key Assign - Sync with vehicles and players.  Will handout custom keys to players for every synced vehicle.  Will NOT work for JIP units.

#### Vehicle setVariables:
* `ACE_VehicleLock_lockSide` - SIDE: overrides a vehicle's side, allows indfor to use little-bird's with indp keys
* `ACE_vehicleLock_lockpickStrength` - NUMBER: secons, determines how long lockpicking with take, overrides ACE_VehicleLock_DefaultLockpickStrength

#### Public Functions:
`[bob, car1, true] call ACE_VehicleLock_fnc_addKeyForVehicle;` - will add a `ACE_key_customKeyMagazine` to bob and program it to work on car1

