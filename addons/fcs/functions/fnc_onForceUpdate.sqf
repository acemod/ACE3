#include "script_component.hpp"

if !([ACE_player, vehicle ACE_player, []] call EFUNC(common,canInteractWith)) exitWith {false};
if !((!GVAR(enabled) && FUNC(canUseFCS)) || FUNC(canUseRangefinder)) exitWith {false};

[vehicle ACE_player, [ACE_player] call EFUNC(common,getTurretIndex), -1, false] call FUNC(keyDown);
[vehicle ACE_player, [ACE_player] call EFUNC(common,getTurretIndex), -1, false, false] call FUNC(keyUp);