/*
  Name: ACE_Respawn_fnc_showFriendlyFireMessages

  Author(s):
    commy2

  Description:
    shows a message in system chat of who killed who

  Parameters:
    0: OBJECT - unit
    1: OBJECT - killer

  Returns:
    VOID
*/

#include "script_component.hpp"

private ["_unit", "_killer"];

_unit = _this select 0;
_killer = _this select 1;

if (_unit != _killer && side group _unit in [side group ACE_player, civilian] && {side group _killer == side group ACE_player}) then {
    systemChat format ["%1 was killed by %2", [_unit] call EFUNC(common,getName), [_killer] call EFUNC(common,getName)];

    // Raise ACE globalEvent
    ["killedByFriendly", [_unit, _killer]] call EFUNC(common,globalEvent);
};
