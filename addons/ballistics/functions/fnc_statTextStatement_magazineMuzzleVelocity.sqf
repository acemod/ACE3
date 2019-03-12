#include "script_component.hpp"
/*
 * Author: Alganthe
 * Text statement for the magazine ammo muzzle velocity stat.
 *
 * Arguments:
 * 0: Type what it is here <TYPE> (unused)
 * 1: Item config path <CONFIG>
 *
 * Return Value:
 * Display text <STRING>
 *
 * Public: No
*/

params ["", "_config"];

if (EGVAR(arsenal,currentLeftPanel) == 2002) then {
    private _primaryMag = primaryWeaponMagazine EGVAR(arsenal,center);

    [primaryWeapon EGVAR(arsenal,center), configName _config]
} else {
    private _primaryMag = handgunMagazine EGVAR(arsenal,center);

    [handgunWeapon EGVAR(arsenal,center), configName _config]
} params ["_weapon", "_magazine"];

if (_magazine isEqualTo "") then {
    localize "str_empty";
} else {
    private _weaponCfg = configFile >> "CfgWeapons" >> _weapon;
    private _ammoCfg = (configFile >> "CfgAmmo" >> (getText (configFile >> "CfgMagazines" >> _magazine >> "ammo")));
    private _barrelLength = getNumber (_weaponCfg >> "ACE_barrelLength");
    private _muzzleVelocityTable = getArray (_ammoCfg >> "ACE_muzzleVelocities");
    private _barrelLengthTable = getArray (_ammoCfg >> "ACE_barrelLengths");

    if (_barrelLength != 0 && {count _muzzleVelocityTable > 0} && {count _barrelLengthTable > 0}) then {
        private _muzzleVelocity = if (["ace_advanced_ballistics"] call EFUNC(common,isModLoaded)) then {
            [_barrelLength, _muzzleVelocityTable, _barrelLengthTable, 0] call EFUNC(advanced_ballistics,calculateBarrelLengthVelocityShift);
        } else {
            getNumber (_config >> "initSpeed")
        };

        format ["%1 m/s (%2 ft/s)", _muzzleVelocity toFixed 0, (_muzzleVelocity * 3.28084) toFixed 0]
    } else {
        localize "str_empty";
    };
};
