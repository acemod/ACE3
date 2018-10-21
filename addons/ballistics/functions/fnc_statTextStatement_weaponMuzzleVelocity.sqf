#include "script_component.hpp"
/*
 * Author: Alganthe
 * Text statement for the weapon muzzle velocity stat
 *
 * Arguments:
 * 0: Not used
 * 1: item config path (CONFIG)
 *
 * Return Value:
 * String to display
 *
 * Public: No
*/

params ["", "_config"];

if (EGVAR(arsenal,currentLeftPanel) == 2002) then {
    private _primaryMag = primaryWeaponMagazine EGVAR(arsenal,center);

    [primaryWeapon EGVAR(arsenal,center), _primaryMag param [0, ""]]
} else {
    private _primaryMag = handgunMagazine EGVAR(arsenal,center);

    [handgunWeapon EGVAR(arsenal,center), _primaryMag param [0, ""]]
} params ["_weapon", "_magazine"];

if (_magazine isEqualTo "") then {
    localize "str_empty";
} else {
    private _ammoCfg = (configFile >> "CfgAmmo" >> (getText (configFile >> "CfgMagazines" >> _magazine >> "ammo")));
    private _barrelLength = getNumber (_config >> "ACE_barrelLength");
    private _muzzleVelocityTable = getArray (_ammoCfg >> "ACE_muzzleVelocities");
    private _barrelLengthTable = getArray (_ammoCfg >> "ACE_barrelLengths");

    if (_barrelLength != 0 && {count _muzzleVelocityTable > 0} && {count _barrelLengthTable > 0}) then {
        private _muzzleVelocity = [_barrelLength, _muzzleVelocityTable, _barrelLengthTable, 0] call EFUNC(advanced_ballistics,calculateBarrelLengthVelocityShift);

        format ["%1 m/s (%2 ft/s)", _muzzleVelocity toFixed 0, (_muzzleVelocity * 3.28084) toFixed 0]
    } else {
        localize "str_empty";
    };
};
