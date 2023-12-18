#include "..\script_component.hpp"
/*
 * Author: Alganthe
 * Text statement for the weapon muzzle velocity stat.
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

params ["", "_configWeapon"];

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
    private _configMagazine = configFile >> "CfgMagazines" >> _magazine;
    private _muzzleVelocity = getNumber (_configMagazine >> "initSpeed");
    private _initSpeedCoef = getNumber (_configWeapon >> "initSpeed");
    if (_initSpeedCoef < 0) then {
        _muzzleVelocity = _muzzleVelocity * -_initSpeedCoef;
    };
    if (_initSpeedCoef > 0) then {
        _muzzleVelocity = _initSpeedCoef;
    };

    private _abAdjustText = "";
    if (
        missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false] &&
        {missionNamespace getVariable [QEGVAR(advanced_ballistics,barrelLengthInfluenceEnabled), false]} // this can be on while AB is off or vice-versa
    ) then {
        private _configAmmo = (configFile >> "CfgAmmo" >> (getText (_configMagazine >> "ammo")));
        private _barrelLength = getNumber (_configWeapon >> "ACE_barrelLength");
        private _muzzleVelocityTable = getArray (_configAmmo >> "ACE_muzzleVelocities");
        private _barrelLengthTable = getArray (_configAmmo >> "ACE_barrelLengths");
        private _abShift = [_barrelLength, _muzzleVelocityTable, _barrelLengthTable, 0] call EFUNC(advanced_ballistics,calculateBarrelLengthVelocityShift);
        if (_abShift != 0) then {
            _abAdjustText = " [AB]";
            _muzzleVelocity = _abShift;
        };
    };
    format ["%1 m/s (%2 ft/s)%3", _muzzleVelocity toFixed 0, (_muzzleVelocity * 3.28084) toFixed 0, _abAdjustText]
};
