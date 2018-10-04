#include "script_component.hpp"
/*
 * Author: Jonpas
 * Checks if Tactical Ladder is empty (no one climbing it).
 *
 * Arguments:
 * 0: Ladder <OBJECT>
 *
 * Return Value:
 * Can Be Picked Up <BOOL>
 *
 * Example:
 * [ladder] call ace_tacticalladder_fnc_isLadderEmpty;
 *
 * Public: No
 */

params ["_ladder"];

private _unitsNearLadder = nearestObjects [_ladder, ["CAManBase"], 4];
TRACE_1("Near Ladder",_unitsNearLadder);

private _ladderEmpty = true;
{
    if (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> animationState _x >> "ACE_isLadder") == 1) exitWith {
        _ladderEmpty = false;
        TRACE_1("On Ladder",_x);
    };
} forEach _unitsNearLadder;

_ladderEmpty
