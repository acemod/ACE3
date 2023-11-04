#include "script_component.hpp"

params ["_display"];

_display displayAddEventHandler ["MouseZChanged", {(_this select 1) call FUNC(handleScrollWheel)}];
_display displayAddEventHandler ["MouseButtonDown", {
    // Right clicking cancels deployment
    if (_this select 1 == 1) then {
        ACE_player call FUNC(handleDeployInterrupt);
    };
}];
