#include "script_component.hpp"

params ["_display"];

_display displayAddEventHandler ["MouseZChanged", {(_this select 1) call FUNC(handleScrollWheel)}];
_display displayAddEventHandler ["MouseButtonDown", {
    // Right clicking cancels deployment
    if ((_this select 1) == 1 && {ACE_player getVariable [QGVAR(isDeploying), false]}) then {
        GVAR(placeAction) = PLACE_CANCEL;
    };
}];
