#include "script_component.hpp"
/*
 * Author: voiper
 * Switch flashlight on/off.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: New flashlight classname ("" for off) <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player, "ACE_Flashlight_MX991"] call ace_map_fnc_switchFlashlight;
 *
 * Public: No
 */

params ["_unit", "_newFlashlight"];

private _unitLight = _unit getVariable [QGVAR(flashlight), ["", objNull]];
_unitLight params ["_flashlight", "_glow"];

if (GVAR(mapGlow)) then {
    // we don't want to set the PVAR twice in a row, so tell this func not to set it
    _glow = [_unit, _newFlashlight, false] call FUNC(flashlightGlow);
};

if (-1 < [_newFlashlight, _flashlight] findIf {[_unit, _x] call FUNC(needPlaySound)}) then {
    playSound QGVAR(flashlightClick);
};

_unit setVariable [QGVAR(flashlight), [_newFlashlight, _glow], true];
