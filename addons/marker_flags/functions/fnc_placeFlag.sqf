#include "script_component.hpp"
/*
 * Author: Brett Mayson
 * Places a flag in front of the unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Flag <STRING>
 *
 * Return Value:
 * Flag <OBJECT>
 *
 * Example:
 * [player, "ace_marker_flags_white"] call ace_marker_flags_fnc_placeFlag
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]], ["_flag", QGVAR(white), [""]]];

_unit removeItem _flag;
_flag = GVAR(flagCache) get _flag; // convert to vehicle type
private _pos = _unit modelToWorld [0, 1, 0];
private _flag = _flag createVehicle _pos;
_flag setPos _pos;
[QGVAR(placed), [_unit, _flag]] call CBA_fnc_localEvent;
[_unit, "PutDown"] call EFUNC(common,doGesture);
