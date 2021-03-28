#include "script_component.hpp"
/*
 * Author: rocko
 * Fixes animation issues that may get you stuck
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_common_fnc_headBugFix
 *
 * Public: Yes
 *
 * Note: Has to be spawned not called
 */

private _unit = ACE_player;
private _anim = animationState _unit;

[QGVAR(headbugFixUsed), [profileName, _anim]] call CBA_fnc_serverEvent;
[QGVAR(headbugFixUsed), [profileName, _anim]] call CBA_fnc_localEvent;

if (_unit != vehicle _unit  || {!([_unit, objNull, ["isNotSitting"]] call FUNC(canInteractWith))}) exitWith {false};

private _pos = getPosATL _unit;
private _dir = getDir _unit;

titleCut ["", "BLACK"];
[_unit, "headBugFix"] call FUNC(hideUnit);

// create invisible headbug fix vehicle
private _dummy = createVehicle ["ACE_Headbug_Fix", _pos, [], 0, "NONE"];
_dummy setDir _dir;
_unit moveInAny _dummy;
sleep 0.1; // @todo

unassignVehicle _unit;
_unit action ["Eject", vehicle _unit];
_unit setDir _dir;
_unit setPosATL _pos;
sleep 1.0;

deleteVehicle _dummy;

[_unit, "headBugFix"] call FUNC(unhideUnit);
titleCut ["", "PLAIN"];
true
