#include "..\script_component.hpp"
/*
 * Author: Cyruz
 * Checks if the magazine has ammo which is a flare
 *
 * Arguments:
 * 0: Magazine <STRING>
 *
 * Return Value:
 * 0: If magazine is type of flare <BOOL>
 *
 * Example:
 * ["3Rnd_UGL_FlareWhite_F"] call ace_cookoff_fnc_isMagazineFlare
 *
 * Public: No
 */

params ["_magazine"];

private _ammo = getText (configFile >> "CfgMagazines" >> _magazine >> "ammo");
private _intensity = getNumber (configFile >> "CfgAmmo" >> _ammo >> "intensity");
private _flare = getNumber (configFile >> "CfgAmmo" >> _ammo >> QEGVAR(grenades,flare));

_intensity != 0 || _flare == 1
