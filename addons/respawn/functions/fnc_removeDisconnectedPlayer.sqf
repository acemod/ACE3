/*
  Name: ACE_Respawn_fnc_removeDisconnectedPlayer
  
  Author(s):
    commy2
  
  Description:
    handles the disconnected event
  
  Parameters:
    0: BOOLEAN - forceRemove // not used atm
  
  Returns:
    VOID
*/

#include "script_component.hpp"

private ["_forceRemove", "_body", "_uid"];

_forceRemove = _this select 0;

{
    if (getPlayerUID _x == _uid) exitWith {
        _body = _x;
    };
} forEach playableUnits;

if (!isNil "_body" && {!alive _body}) then {
    [_body, _forceRemove] call FUNC(removeBody);
};
