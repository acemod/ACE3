#include "..\script_component.hpp"
/*
 * Author: commy2
 * Handles the climb animation finishing.  Called from "AnimDone" event handler.
 *
 * Arguments:
 * 0: The Unit (usually the player) <OBJECT>
 * 1: The finisehd animation <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "ACE_climb"] call ace_movement_fnc_handleClimb
 *
 * Public: No
 */

params ["_unit", "_anim"];

private _pos = _unit modelToWorldVisual (_unit selectionPosition "camera");

[_unit, "AmovPknlMstpSnonWnonDnon", 2] call EFUNC(common,doAnimation);

_pos = _pos vectorDiff (_unit selectionPosition "camera");

_unit setPosASL (AGLToASL _pos);
TRACE_2("",AGLToASL _pos,getPosASL _unit);
