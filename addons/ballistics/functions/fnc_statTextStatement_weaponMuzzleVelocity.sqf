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
#include "script_component.hpp"

params ["", "_config"];

if (EGVAR(arsenal,currentLeftPanel) == 2002) then {
    private _primaryMag = primaryWeaponMagazine EGVAR(arsenal,center);

    if (count _primaryMag > 0) then {
        [primaryWeapon EGVAR(arsenal,center), _primaryMag select 0]
    } else {
        [primaryWeapon EGVAR(arsenal,center), ""]
    };
} else {
    private _primaryMag = handgunMagazine EGVAR(arsenal,center);

    if (count _primaryMag > 0) then {
        [handgunWeapon EGVAR(arsenal,center), _primaryMag select 0]
    } else {
        [handgunWeapon EGVAR(arsenal,center), ""]
    };
} params ["_weapon", "_magazine"];

private _initSpeed = getNumber (_config >> "initSpeed");

if (_magazine isEqualTo "") then {
    _initSpeed
} else {
    private _ammoCfg = (configFile >> "CfgAmmo" >> (getText (configFile >> "CfgMagazines" >> _magazine >> "ammo")));
    private _barrelLength = getNumber (_config >> "ACE_barrelLength");
    private _muzzleVelocityTable = getArray (_ammoCfg >> "ACE_muzzleVelocities");
    private _barrelLengthTable = getArray (_ammoCfg >> "ACE_barrelLengths");

    if (_barrelLength != 0 && {count _muzzleVelocityTable > 0} && {count _barrelLengthTable > 0}) then {
            private _muzzleVelocity = [_barrelLength, _muzzleVelocityTable, _barrelLengthTable, 0] call EFUNC(advanced_ballistics,calculateBarrelLengthVelocityShift);

            format ["%1 m/s (%2 ft/s)", _muzzleVelocity toFixed 0, (_muzzleVelocity * 3.28084) toFixed 0]
    } else {
        _initSpeed
    };
};
