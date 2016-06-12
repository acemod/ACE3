/*
 * Author: voioper
 * Switch flashlight on/off.
 *
 * Arguments:
 * 0: New flashlight classname ("" for off) <STRING>
 *
 * Return value:
 * None
 *
 * Example:
 * ["ACE_Flashlight_MX991"] call ace_map_fnc_switchFlashlight;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_newFlashlight"];
private _oldFlashlight = GVAR(flashlightInUse);

if (GVAR(mapGlow)) then {
    [_newFlashlight] call FUNC(flashlightGlow);
};

if (
    (getNumber (configFile >> "CfgWeapons" >> _newFlashlight >> "ItemInfo" >> QGVAR(Flashlight) >> QGVAR(Flashlight_Sound)) > 0) ||
    {getNumber (configFile >> "CfgWeapons" >> _oldFlashlight >> "ItemInfo" >> QGVAR(Flashlight) >> QGVAR(Flashlight_Sound)) > 0}
) then { 
    playSound QGVAR(flashlightClick);
};

GVAR(flashlightInUse) = _newFlashlight;