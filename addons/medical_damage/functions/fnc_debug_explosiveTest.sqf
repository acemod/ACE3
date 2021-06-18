#include "script_component.hpp"
/*
 * Author: Pterolatypus
 * Testing function that spawns AI units in a spiral around the given point and optionally spawns a projectile at the center
 * Used for observing the effects of explosive munitions
 *
 * Arguments:
 * 0: Center position, format PositionAGL <ARRAY>
 * 1: Distance to spawn units <ARRAY>
 *    0: Min (default: 1)
 *    1: Max (default: 10)
 *    2: Step (default: 1)
 * 2: Unit class to spawn <STRING> (default: "B_Soldier_F")
 * 3: Ammo class to spawn, "" or nil to skip  <STRING> (default: "")
 * 4: Delay between unit placement and ammo spawning in seconds <NUMBER> (default: 1)
 * 5: Function to run on each unit that is spawned (optional) <CODE> params [_unit, _center, _ammoClass]
 *
 * ReturnValue:
 * Nothing
 *
 * Example:
 * [position player, [20, 80, 5]] call ace_medical_damage_fnc_debug_explosiveTest
 *
 * Public: No
 */
params [
    "_center",
    ["_distances", []],
    ["_unitClass", "B_Soldier_F"],
    ["_ammoClass", ""],
    ["_delay", 1],
    "_initCode"
];

_distances params [["_min", 1], ["_max", 10], ["_step", 1]];

if (isNil "_center") exitwith {};

_max = _max max _min;
private _nSteps = 0 max ceil ((_max - _min) / _step);
private _angleStep = 360 / (_nSteps + 1);

for "_distance" from _min to _max step _step do {
    private _i = (_distance - _min) / _step;
    private _angle = _i * _angleStep;
    private _offset = [_distance * sin _angle, _distance * cos _angle, 0];
    private _position = _center vectorAdd _offset;
    private _unit = (createGroup west) createUnit [_unitClass, _position, [], 0, "CAN_COLLIDE"];
    if !(isNil "_initCode") then {
        [_unit, _center, _ammoClass] call _initCode;
    };
};

// spawn the ammo above the ground falling. necessary for shells, doesn't cause problems for grenades etc.
if (_ammoClass != "") then {
    [{
        params ["_ammoClass", "_center"];
        private _position = _center vectorAdd [0, 0, 5];
        private _obj = _ammoClass createVehicle _position;
        _object setVectorDirAndUp [[0, 0, -1], [0, 1, 0]];
        _obj setVelocity [0, 0, -20];
    }, [_ammoClass, _center], _delay] call CBA_fnc_waitAndExecute;
};