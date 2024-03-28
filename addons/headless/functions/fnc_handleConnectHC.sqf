#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Registers connected Headless Client for use.
 *
 * Arguments:
 * 0: Headless Client <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [headlessClient] call ace_headless_fnc_handleConnectHC
 *
 * Public: No
 */

params ["_headlessClient"];

// Exit if HC already registered
// No need to check if distribution or end mission enabled, as if disabled this will never run
if (GVAR(headlessClients) pushBackUnique _headlessClient == -1) exitWith {};

if (XGVAR(log)) then {
    INFO_1("Registered HC: %1",_headlessClient);
};

// Exit if AI distribution is disabled
if (!XGVAR(enabled)) exitWith {};

// Rebalance
[true] call FUNC(rebalance);
