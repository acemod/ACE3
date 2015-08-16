/*
 * Author: GitHawk
 * Rearms a vehicle
 *
 * Arguments:
 * 0: The vehicle <OBJECT>
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

#define GETRETURNVALUE \
_cnt = { _x == _magazine } count _magazines; \
if ((_target magazineTurretAmmo [_magazine, _path]) < getNumber (configFile >> "CfgMagazines" >> _magazine >> "count")) then { \
    _turretPath = _path; \
    _return = true; \
} else { \
    if (_cnt < ([_target, _path, _magazine] call FUNC(getMaxMagazines))) then { \
        _turretPath = _path; \
        _return = true; \
    }; \
};

private ["_ammo", "_tmpCal", "_cal", "_idx", "_return", "_cnt", "_magazineDisplayName"];
params ["_unit", "_vehicle"];

_magazine = _unit getVariable QGVAR(carriedMagazine);
if (isNil "_magazine") exitWith {false};

_ammo = getText (configFile >> "CfgMagazines" >> _magazine >> "ammo");
_tmpCal = getNumber (configFile >> "CfgAmmo" >> _ammo >> "ace_caliber");
_cal = 8;
if (_tmpCal > 0) then {
    _cal = _tmpCal;
} else {
    _tmpCal = getNumber (configFile >> "CfgAmmo" >> _ammo >> QGVAR(caliber));
    if (_tmpCal > 0) then {
        _cal = _tmpCal;
    } else {
        diag_log format ["ACE_Rearm: Undefined Ammo [%1 : %2]", _ammo, inheritsFrom (configFile >> "CfgAmmo" >> _ammo)];
        if (_ammo isKindOf "BulletBase") then {
            _cal = 8;
        } else {
            _cal = 100;
        };
    };
};
_cal = round _cal;
_idx = CALIBERS find _cal;
if (_idx == -1 ) then {
    _idx = 2;
};

_return = false;
_turretPath = [0]; _cnt = 0;
_magazines = _target magazinesTurret [-1];
if (_magazine in _magazines) then {
    _path = [-1];
    GETRETURNVALUE
};
if (!_return) then {
    _magazines = _target magazinesTurret [0];
    if (_magazine in _magazines) then {
        _path = [0];
        GETRETURNVALUE
    };
};
if (!_return) then {
    _magazines = _target magazinesTurret [0,0];
    if (_magazine in _magazines) then {
        _path = [0,0];
        GETRETURNVALUE
    };
};
if (!_return) then {
    _magazines = _target magazinesTurret [0,1];
    if (_magazine in _magazines) then {
        _path = [0,1];
        GETRETURNVALUE
    };
};
if (!_return) then {
    _magazines = _target magazinesTurret [1];
    if (_magazine in _magazines) then {
        _path = [1];
        GETRETURNVALUE
    };
};
if (!_return) then {
    _magazines = _target magazinesTurret [2];
    if (_magazine in _magazines) then {
        _path = [2];
        GETRETURNVALUE
    } else {
        diag_log format ["ACE_Rearm: Could not find turret for %1 in %2", _magazine, typeOf _target];
    };
};

//hint format ["Magazine: %1\nAmmo: %2\nCaliber: %3\nIndex: %4\nTurretPath: %5\nDURATION_REARM: %6\nCount: %7", _magazine, _ammo, _cal, _idx, _turretPath, (DURATION_REARM select _idx), (COUNT select _idx)];

_magazineDisplayName =  getText(configFile >> "CfgMagazines" >> _magazine >> "displayName");
if (_magazineDisplayName == "") then {
    _magazineDisplayName = _magazine;
    diag_log format ["ACE_Rearm: Magazine is missing display name [%1]", _magazine];
};

[
    (DURATION_REARM select _idx),
    [_target, _unit, _turretPath, _cnt, _magazine, (COUNT select _idx)],
    FUNC(rearmSuccess),
    "",
    format [localize LSTRING(RearmAction), getText(configFile >> "CfgVehicles" >> (typeOf _target) >> "displayName"), _magazineDisplayName],
    {true},
    ["isnotinside"]
] call EFUNC(common,progressBar);