#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Removes the specified speed dial from unit's speed dial.
 *
 * Arguments:
 * 0: Speed dial name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * "IED 1" call ace_explosives_fnc_removeFromSpeedDial
 *
 * Public: Yes
 */

params [["_name", "", [""]]];

if (_name == "") exitWith {};

private _speedDial = ACE_player getVariable [QGVAR(speedDial), []];

if (_speedDial isEqualTo []) exitWith {};

_speedDial deleteAt (_speedDial findIf {(_x select 0) == _name});

nil
