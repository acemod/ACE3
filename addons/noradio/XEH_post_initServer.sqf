// by commy2
#include "script_component.hpp"

addMissionEventHandler ["HandleDisconnect", {
    [_this select 0, "isPlayer"] call EFUNC(common,unmuteUnit);
}];
