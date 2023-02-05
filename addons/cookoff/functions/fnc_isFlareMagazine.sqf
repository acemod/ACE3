#include "script_component.hpp"
/*
 * Author: Cyruz
 * Checks if the current magazine has ammo which is a flare
 *
 * Arguments:
 * 0: Magazine <STRING>
 *
 * Return Value:
 * 0: Magazine is a flare <BOOL>
 *
 * Example:
 * ["3Rnd_UGL_FlareWhite_F"] call ace_cookoff_fnc_isFlareMagazine
 *
 * Public: No
 */

params ["_magazine"];

private _ammo = getText (configFile >> "CfgMagazines" >> _magazine >> "ammo");
private _intensity = getNumber (configFile >> "CfgAmmo" >> _ammo >> "intensity");
private _flare = getNumber (configFile >> "CfgAmmo" >> _ammo >> "ace_grenades_flare");

if (_intensity isNotEqualTo 0 || _flare isEqualTo 1) then {
    true;
} else {
    false;
};
