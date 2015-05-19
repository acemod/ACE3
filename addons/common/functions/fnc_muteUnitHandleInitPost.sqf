// by commy2
#include "script_component.hpp"

PARAMS_1(_unit);

// setSpeaker gets overwritten after init on remote units; if unit is muted, setSpeaker again
if (count (_unit getVariable [QGVAR(muteUnitReasons), []]) > 0) then {
    ["setSpeaker", [_unit, "ACE_NoVoice"]] call FUNC(localEvent);
};
