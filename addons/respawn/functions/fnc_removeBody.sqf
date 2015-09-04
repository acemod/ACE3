/*
 * Author: bux578
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

private "_bodyRemoveTimer";

params ["_body", "_forceRemove"];

// could be used for SpecOps missions.
_bodyRemoveTimer = if (_forceRemove) then {2} else {GVAR(BodyRemoveTimer) max 0};

[{
    // hideBody takes ~20s till body is fully underground
    // a better hideBody would make this more aesthetic
    deleteVehicle _this;
}, _body, _bodyRemoveTimer, 1] call EFUNC(common,waitAndExecute);
