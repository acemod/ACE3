#include "..\script_component.hpp"
/*
 * Author: Cyruz
 * Checks if the magazine's ammo are flares.
 *
 * Arguments:
 * 0: Magazine <STRING>
 *
 * Return Value:
 * If magazine is type of flare <BOOL>
 *
 * Example:
 * "3Rnd_UGL_FlareWhite_F" call ace_cookoff_fnc_isMagazineFlare
 *
 * Public: No
 */

params ["_magazine"];

private _configAmmo = configFile >> "CfgAmmo" >> getText (configFile >> "CfgMagazines" >> _magazine >> "ammo");

getNumber (_configAmmo >> "intensity") != 0 || {getNumber (_configAmmo >> QEGVAR(grenades,flare)) == 1}
