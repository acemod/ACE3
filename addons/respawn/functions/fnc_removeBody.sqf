/*
 * Author: bux578, commy2
 * Removes a given body.
 *
 * Arguments:
 * 0: Body <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [corpse] call ace_respawn_fnc_removeBody
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_body", "_forceRemove"];

private "_bodyRemoveTimer";
_bodyRemoveTimer = [GVAR(BodyRemoveTimer) max 0, 2] select _forceRemove; // could be used for SpecOps missions.

[{
    // hideBody takes ~20s till body is fully underground
    // a better hideBody would make this more aesthetic
    deleteVehicle _this;
}, _body, _bodyRemoveTimer] call EFUNC(common,waitAndExecute);
