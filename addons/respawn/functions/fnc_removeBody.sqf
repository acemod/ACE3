/*
  Name: ACE_Respawn_fnc_removeBody

  Author(s):
    bux578

  Description:
    removes a given body

  Parameters:
    0: OBJECT - body
    1: BOOLEAN - forceRemove // not used atm

  Returns:
    VOID
*/

#include "script_component.hpp"

private ["_body", "_forceRemove", "_bodyRemoveTimer"];

_body = _this select 0;
_forceRemove = _this select 1;

_bodyRemoveTimer = GVAR(BodyRemoveTimer) max 0;

// could be used for SpecOps missions.
if (_forceRemove) then {
  _bodyRemoveTimer = 2;
};

[{
    // hideBody takes ~20s till body is fully underground
    // a better hideBody would make this more aesthetic
    deleteVehicle _this;
}, _body, _bodyRemoveTimer, 1] call EFUNC(common,waitAndExecute);
