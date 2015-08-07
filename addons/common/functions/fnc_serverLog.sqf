/*
 * Author: esteldunedain
 * ?
 *
 * Argument:
 * ?
 *
 * Return value:
 * None
 *
 * Public: no
 */
#include "script_component.hpp"

if (isServer) then {
    diag_log _this;
} else {
    [_this, QFUNC(serverLog), 1] call FUNC(execRemoteFnc);
};
