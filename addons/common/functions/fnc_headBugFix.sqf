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
 * Public: Yes
 *
 * Note: Has to be spawned not called
 */
#include "script_component.hpp"

private ["_unit", "_anim", "_pos", "_dir", "_dummy"];

_unit = ACE_player;
_anim = animationState _unit;

["HeadbugFixUsed", [profileName, _anim]] call FUNC(serverEvent);
["HeadbugFixUsed", [profileName, _anim]] call FUNC(localEvent);

if (_unit != vehicle _unit  || {!([_unit, objNull, ["isNotSitting"]] call FUNC(canInteractWith))}) exitWith {false};

_pos = getPosATL _unit;
_dir = getDir _unit;

titleCut ["", "BLACK"];
[_unit, "headBugFix"] call FUNC(hideUnit);

// create invisible headbug fix vehicle
_dummy = createVehicle ["ACE_Headbug_Fix", _pos, [], 0, "NONE"];
_dummy setDir _dir;
_unit moveInAny _dummy;
sleep 0.1;

unassignVehicle _unit;
_unit action ["Eject", vehicle _unit];
_unit setDir _dir;
_unit setPosATL _pos;
sleep 1.0;

deleteVehicle _dummy;

[_unit, "headBugFix"] call FUNC(unhideUnit);
titleCut ["", "PLAIN"];
true
