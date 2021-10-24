#include "script_component.hpp"
/*
 * Author: PabstMirror
 * x
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
TRACE_2(turretChangedEH,_player,_playerTurret);

if (GVAR(pfID) > -1) then {
    TRACE_1("PFEH Stopping",GVAR(pfID));
    [GVAR(pfID)] call CBA_fnc_removePerFrameHandler;
    GVAR(pfID) = -1;
};
if (_playerTurret isEqualTo []) exitWith {};

private _vehicle = vehicle _player;
private _config = configOf _vehicle;

private _enabled = getNumber (_config >> QGVAR(enabled)); // 2.08 can change to getVar
// if (_enabled == 0) exitWith {};

TRACE_3("turret eh",_player,_playerTurret,typeOf _vehicle);
if ((getNumber (_addonConfig >> "enabled")) != 1) exitWith {};

private _masterTurret = [_config >> QGVAR(masterTurret), "ARRAY", [0, 0]] call CBA_fnc_getConfigEntry;
private _puppetTurret = [_config >> QGVAR(puppetTurret), "ARRAY", [0]] call CBA_fnc_getConfigEntry;

if (_playerTurret in [_masterTurret, _puppetTurret]) then {
    GVAR(pfID) = [LINKFUNC(eachFrame), 0, [_player, _playerTurret, _vehicle, _masterTurret, _puppetTurret, [], -1, -1]] call CBA_fnc_addPerFrameHandler;
    TRACE_1("PFEH Started",GVAR(pfID));
};
