#include "script_component.hpp"

"debug_render:" call FUNC(callExtension);

_animateCurrentVehicleWorker = {
    if( (vehicle ACE_player) != ACE_player) then {
        [(vehicle ACE_player), true] call FUNC(getAnimationStates);
    };
};
[_animateCurrentVehicleWorker, 0, []] call CBA_fnc_addPerFrameHandler;