/*
 * Author: voiper
 * Add or remove global flashlight glow for when player is looking at map.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Flashlight classname ("" for off) <STRING>
 * 2: Set the PVAR? <BOOL> (default: true)
 *
 * Return Value:
 * Glow object <OBJECT>
 *
 * Example:
 * [ACE_player, "ACE_Flashlight_MX991"] call ace_map_fnc_flashlightGlow;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit", "_flashlightType", ["_set", true]];

private _unitLight = _unit getVariable [QGVAR(flashlight), ["", objNull]];
_unitLight params ["_flashlight", "_glow"];

if (!isNull _glow) then {
    detach _glow;
    deleteVehicle _glow;
};

if !(_flashlightType isEqualTo "") then {
    private _color = getText (configFile >> "CfgWeapons" >> _flashlightType >> "ItemInfo" >> "FlashLight" >> "ACE_Flashlight_Colour");
    if !(_color in ["white", "red", "green", "blue", "yellow", "orange"]) then {_color = "white"};
    private _class = format ["ACE_FlashlightProxy_%1", _color];

    _glow = _class createVehicle [0,0,0];
    _glow attachTo [_unit, [0,0.1,-0.05], "neck"];
} else {
    _glow = objNull;
};

if (_set) then {
    _unit setVariable [QGVAR(flashlight), [_flashlight, _glow], true];
};

_glow
