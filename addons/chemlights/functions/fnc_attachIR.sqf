/*
 * Author: voiper
 * Attach IR chemlight to shoulder. Meant to be called from ace_attach_fnc_attach.
 *
 * Arguments:
 * 1: Original attached ammo <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_projectile] call ace_chemlights_fnc_createIRChemlight;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_projectile", "_unit"];
private ["_config", "_vehClass"];

_config = (configFile >> "CfgAmmo" >> typeOf _projectile);
_vehClass = getText (_config >> "ACE_Chemlight_IR");
_delay = getNumber (_config >> "explosionTime");

[eyePos _unit] call FUNC(shakeSound);

[{
    params ["_vehClass", "_unit"];
    private _light = _vehClass createVehicle [0,0,0];
    _light attachTo [_unit, [-0.05, 0, 0.12], "rightshoulder"];
    _unit setVariable [QGVAR(IRAttach), _light, true];
}, [_vehClass, _unit], _delay] call CBA_fnc_waitAndExecute;