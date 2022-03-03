#include "script_component.hpp"
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
TRACE_2(turretChangedEH,_player,_playerTurret);

GVAR(isMaster) = false;
if (_playerTurret isEqualTo []) exitWith {};
private _vehicle = vehicle _player;
private _config = configOf _vehicle;
private _enabled = _vehicle getVariable [QGVAR(enabled), getNumber (_config >> QGVAR(enabled))];
if (!(_enabled in [1, true])) exitWith {};

private _masterTurret = [_config >> QGVAR(masterTurret), "ARRAY", [0, 0]] call CBA_fnc_getConfigEntry;
GVAR(isMaster) = _playerTurret isEqualto _masterTurret;
