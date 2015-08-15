/*
 * Author: GitHawk
 * Check if a unit can rearm
 *
 * Arguments:
 * 0: The unit <OBJECT>
 * 1: The target <OBJECT>
 *
 * Return Value:
 * Can rearm <BOOL>
 *
 * Example:
 * [player, tank] call ace_rearm_fnc_canRearm
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_vehicles", "_magazine", "_magazines", "_path", "_return", "_cnt"];
params ["_unit", "_vehicle"];

#define GETRETURNVALUE \
if ((_vehicle magazineTurretAmmo [_magazine, _path]) < getNumber (configFile >> "CfgMagazines" >> _magazine >> "count")) then { \
    _return = true; \
} else { \
    _cnt = { _x == _magazine } count _magazines; \
    if (_cnt < ([_vehicle, _path, _magazine] call FUNC(getMaxMagazines))) then { \
        _return = true; \
    }; \
};

if (isNull _unit  || {!(_unit isKindOf "CAManBase")} || {!local _unit} || { (_vehicle distance _unit) > 7}) exitWith {false};

_magazine = _unit getVariable QGVAR(carriedMagazine);
if (isNil "_magazine") exitWith {false};

// TODO move into loop

_return = false;
_magazines = _vehicle magazinesTurret [-1];
if (_magazine in _magazines) then {
    _path = [-1];
    GETRETURNVALUE
};
if (!_return) then {
    _magazines = _vehicle magazinesTurret [0];
    if (_magazine in _magazines) then {
        _path = [0];
        GETRETURNVALUE
    };
};
if (!_return) then {
    _magazines = _vehicle magazinesTurret [0,0];
    if (_magazine in _magazines) then {
        _path = [0,0];
        GETRETURNVALUE
    };
};
if (!_return) then {
    _magazines = _vehicle magazinesTurret [0,1];
    if (_magazine in _magazines) then {
        _path = [0,1];
        GETRETURNVALUE
    };
};
if (!_return) then {
    _magazines = _vehicle magazinesTurret [1];
    if (_magazine in _magazines) then {
        _path = [1];
        GETRETURNVALUE
    };
};
if (!_return) then {
    _magazines = _vehicle magazinesTurret [2];
    if (_magazine in _magazines) then {
        _path = [2];
        GETRETURNVALUE
    };
};

_return