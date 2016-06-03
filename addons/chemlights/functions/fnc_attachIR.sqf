/*
 * Author: voiper
 * Attach IR chemlight to unit or vehicle. Meant to be called from ace_attach_fnc_attach and ace_attach_fnc_placeApprove.
 *
 * Arguments:
 * 1: Calling unit <OBJECT>
 * 2: Original attached ammo <OBJECT>
 * 3: Vehicle/unit to attach to <OBJECT>
 * 4: Attachto offset <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit, _projectile, _vehicle, [-0.05, 0, 0.12]] call ace_chemlights_fnc_attachIRUnit;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit", "_projectile", "_attachTarget", "_offset"];
private ["_config", "_lightClass"];

_config = (configFile >> "CfgAmmo" >> typeOf _projectile);
_lightClass = getText (_config >> "ACE_Chemlight_IR");
_delay = getNumber (_config >> "explosionTime");

[eyePos _unit] call FUNC(shakeSound);

[{
    params ["_lightClass", "_attachTarget", "_offset"];
    private _light = _lightClass createVehicle [0,0,0];
    _light attachTo [_attachTarget, _offset, "rightshoulder"];
    _attachTarget setVariable [QGVAR(IRAttach), _light, true];
}, [_lightClass, _attachTarget, _offset], _delay] call CBA_fnc_waitAndExecute;