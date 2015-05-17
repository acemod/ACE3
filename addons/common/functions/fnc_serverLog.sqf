// by esteldunedain
#include "script_component.hpp"

if (isServer) then {
    diag_log _this;
} else {
    [_this, QUOTE(FUNC(serverLog)), 1] call FUNC(execRemoteFnc);
};
