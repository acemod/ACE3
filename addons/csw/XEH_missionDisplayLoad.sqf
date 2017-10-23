#include "script_component.hpp"

params ["_display"];

_display displayAddEventHandler ["MouseButtonDown", {[ACE_player, _this select 1] call FUNC(tripodDeploy)}];

