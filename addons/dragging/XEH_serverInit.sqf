// by commy2
#include "script_component.hpp"

// release object on hard disconnection. Function is identical to killed
addMissionEventHandler ["HandleDisconnect", {_this call FUNC(handleKilled)}];
