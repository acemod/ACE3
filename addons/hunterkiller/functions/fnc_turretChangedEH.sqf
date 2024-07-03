#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Turret changed event handler. Determine if in a master turret
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Turret <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, [0]] call ace_hunterkiller_fnc_turretChangedEH
 *
 * Public: No
 */

params ["_player", "_playerTurret"];
TRACE_2("turretChangedEH",_player,_playerTurret);

GVAR(mode) = 0;
GVAR(targetTurret) = [];

if (_playerTurret isEqualTo []) exitWith {};
private _vehicle = vehicle _player;
private _config = configOf _vehicle;

// setVar can be real array or true/false
private _hkArray = _vehicle getVariable [QUOTE(ADDON), nil];
if (isNil "_hkArray") then {
    _hkArray = if (isArray (_config >> QUOTE(ADDON))) then {
        getArray (_config >> QUOTE(ADDON))
    } else {
        ((getNumber (_config >> QUOTE(ADDON))) == 1)
    };
};
if (_hkArray isEqualTo true) then { _hkArray = [[[0], 1], [[0,0], 3]]; };
if (_hkArray isEqualTo false) then { _hkArray = []; };

TRACE_1("",_hkArray);
if ((count _hkArray) != 2) exitWith {};

{
    _x params ["_xTurret", "_xMode"];
    TRACE_2("x",_playerTurret,_xTurret);
    if (_xTurret isEqualTo _playerTurret) exitWith {
        TRACE_3("seat active",typeOf _vehicle,_xTurret,_xMode);
        GVAR(mode) = _xMode;
        GVAR(targetTurret) = _hkArray # ((_forEachIndex + 1) % 2) # 0;
    };
} forEach _hkArray;
