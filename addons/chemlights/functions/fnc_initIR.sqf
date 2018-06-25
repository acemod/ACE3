#include "script_component.hpp"
/*
 * Author: voiper
 * Spawn IR marker for dummy IR physX object.
 *
 * Arguments:
 * 1: Dummy IR physX <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_object] call ace_chemlights_fnc_initIR;
 *
 * Public: No
 */

params ["_dummy"];

private _chemlightClass = getText (configFile >> "CfgVehicles" >> typeOf _dummy >> "ACE_Attachable");
private _config = configFile >> "CfgAmmo" >> _chemlightClass;
private _delay = getNumber (_config >> "explosionTime");
private _lifeTime = getNumber (_config >> "timeToLive");

[{
    params ["_dummy", "_lifeTime"];
    private _IRMarker = "ACE_Chemlight_IR_Marker" createVehicle [0,0,0];
    _IRMarker attachTo [_dummy, [0,0,0]];
    [FUNC(removeIR), [_dummy, _IRMarker], _lifeTime] call CBA_fnc_waitAndExecute;
}, [_dummy, _lifeTime], _delay] call CBA_fnc_waitAndExecute;
