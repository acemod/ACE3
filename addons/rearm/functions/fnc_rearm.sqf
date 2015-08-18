/*
 * Author: GitHawk
 * Starts progress bar for rearming a vehicle.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, vehicle] call ace_rearm_fnc_rearm
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_magazineClass", "_ammo", "_tmpCal", "_cal", "_idx", "_needRearmMags", "_magazineDisplayName"];
params ["_unit"];

_magazineClass = _unit getVariable QGVAR(carriedMagazine);
if (isNil "_magazineClass") exitWith {false};

_ammo = getText (configFile >> "CfgMagazines" >> _magazineClass >> "ammo");
_tmpCal = getNumber (configFile >> "CfgAmmo" >> _ammo >> "ace_caliber");
_cal = 8;
if (_tmpCal > 0) then {
    _cal = _tmpCal;
} else {
    _tmpCal = getNumber (configFile >> "CfgAmmo" >> _ammo >> QGVAR(caliber));
    if (_tmpCal > 0) then {
        _cal = _tmpCal;
    } else {
        diag_log format ["[ACE] ERROR: Undefined Ammo [%1 : %2]", _ammo, inheritsFrom (configFile >> "CfgAmmo" >> _ammo)];
        if (_ammo isKindOf "BulletBase") then {
            _cal = 8;
        } else {
            _cal = 100;
        };
    };
};
_cal = round _cal;
_idx = REARM_CALIBERS find _cal;
if (_idx == -1) then {
    _idx = 2;
};

// Get magazines that can be rearmed
_needRearmMags = [_target, _magazineClass] call FUNC(getNeedRearmMagazines);
_needRearmMags params ["_needRearm", "_turretPath", "_cnt"];

// Exit if no magazines need rearming
if (!_needRearm) exitWith {
    diag_log format ["[ACE] ERROR: Could not find turret for %1 in %2", _magazineClass, typeOf _target];
};

//hint format ["Magazine: %1\nAmmo: %2\nCaliber: %3\nIndex: %4\nTurretPath: %5\nREARM_DURATION_REARM: %6\nCount: %7", _magazine, _ammo, _cal, _idx, _turretPath, (REARM_DURATION_REARM select _idx), (REARM_COUNT select _idx)];

_magazineDisplayName =  getText(configFile >> "CfgMagazines" >> _magazineClass >> "displayName");
if (_magazineDisplayName == "") then {
    _magazineDisplayName = _magazineClass;
    diag_log format ["[ACE] ERROR: Magazine is missing display name [%1]", _magazineClass];
};

[
    (REARM_DURATION_REARM select _idx),
    [_target, _unit, _turretPath, _cnt, _magazineClass, (REARM_COUNT select _idx)],
    FUNC(rearmSuccess),
    "",
    format [localize LSTRING(RearmAction), getText(configFile >> "CfgVehicles" >> (typeOf _target) >> "displayName"), _magazineDisplayName],
    {true},
    ["isnotinside"]
] call EFUNC(common,progressBar);
