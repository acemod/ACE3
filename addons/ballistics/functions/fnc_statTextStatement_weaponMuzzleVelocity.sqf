#include "..\script_component.hpp"
/*
 * Author: Alganthe
 * Text statement for the weapon muzzle velocity stat.
 *
 * Arguments:
 * 0: Stats <ARRAY> (unused)
 * 1: Weapon config path <CONFIG>
 * 2: Magazine config path <CONFIG> (default: configNull)
 *
 * Return Value:
 * Display text <STRING>
 *
 * Public: No
*/

params ["", "_configWeapon", ["_configMagazine", configNull]];

if (isNull _configMagazine) then { // Get the current weapon's mag
    _configMagazine = configFile >> "CfgMagazines" >> (weaponState EGVAR(arsenal,center)) select 3;
};

if (isNull _configMagazine) exitWith { // Nothing in the magwell
    localize "str_empty";
};

private _muzzleVelocity = getNumber (_configMagazine >> "initSpeed");

private _abAdjustText = "";
private _useAB = missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false] && {EGVAR(advanced_ballistics,barrelLengthInfluenceEnabled)};

if (_useAB) then {
    private _configAmmo = configFile >> "CfgAmmo" >> (getText (_configMagazine >> "ammo"));
    private _barrelLength = getNumber (_configWeapon >> "ACE_barrelLength");
    private _muzzleVelocityTable = getArray (_configAmmo >> "ACE_muzzleVelocities");
    private _barrelLengthTable = getArray (_configAmmo >> "ACE_barrelLengths");
    private _abShift = [_barrelLength, _muzzleVelocityTable, _barrelLengthTable, 0] call EFUNC(advanced_ballistics,calculateBarrelLengthVelocityShift);
    if (_abShift != 0) then {
        _abAdjustText = " [AB]";
        _muzzleVelocity = _abShift;
    };
} else {
    private _initSpeedCoef = getNumber (_configWeapon >> "initSpeed");

    if (_initSpeedCoef > 0) then {
        _muzzleVelocity = _initSpeedCoef;
    } else {
        if (_initSpeedCoef < 0) then {
            _muzzleVelocity = _muzzleVelocity * -_initSpeedCoef;
        };
    };
};

format ["%1 m/s (%2 ft/s)%3", _muzzleVelocity toFixed 0, (_muzzleVelocity * METERS_TO_FEET_MULT) toFixed 0, _abAdjustText]
