/*
 * Author: esteldunedain
 * Log a RPT messaged on just the server
 *
 * Arguments:
 * 0: Text to display <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["x happened"] call ace_common_fnc_serverLog;
 *
 * Public: no
 */
#include "script_component.hpp"

params [["_msg", "", [""]]];

if (isServer) then {
    diag_log text _msg;
} else {
    [QGVAR(serverLog), _this] call CBA_fnc_serverEvent;
};
