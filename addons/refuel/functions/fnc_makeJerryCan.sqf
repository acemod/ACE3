#include "..\script_component.hpp"
/*
 * Author: GitHawk
 * Makes an object into a jerry can.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Fuel amount (in liters) <NUMBER> (default: 20)
 *
 * Return Value:
 * None
 *
 * Example:
 * cursorObject call ace_refuel_fnc_makeJerryCan
 *
 * Public: Yes
 */

// Only run this after the settings are initialized
if (!EGVAR(common,settingsInitFinished)) exitWith {
    EGVAR(common,runAtSettingsInitialized) pushBack [FUNC(makeJerryCan), _this];
};

if (!GVAR(enabled)) exitWith {};

params [["_target", objNull, [objNull]], ["_fuelAmount", 20, [0]]];

if (
    isNull _target ||
    {_target isKindOf "AllVehicles"} ||
    {_target getVariable [QGVAR(jerryCan), false]}
) exitWith {};

_target setVariable [QGVAR(jerryCan), true];
_target setVariable [QGVAR(source), _target];
_target setVariable [QGVAR(capacity), _fuelAmount];

if (isServer) then {
    [_target, _fuelAmount] call FUNC(setFuel); // has global effects
    [QGVAR(jerryCanInitalized), [_target]] call CBA_fnc_globalevent;
};

if (!hasInterface) exitWith {};

// Main Action
private _action = [QGVAR(refuel),
    LLSTRING(refuel),
    QPATHTOF(ui\icon_refuel_interact.paa),
    {},
    {true},
    {},
    [],
    [0, 0, 0],
    REFUEL_ACTION_DISTANCE
] call EFUNC(interact_menu,createAction);
[_target, 0, ["ACE_MainActions"], _action] call EFUNC(interact_menu,addActionToObject);

// Add pickup
_action = [QGVAR(pickUpNozzle),
    LLSTRING(takeFuelCanister),
    QPATHTOF(ui\icon_refuel_interact.paa),
    {[_player, _target] call FUNC(takeNozzle)},
    {[_player, _target] call FUNC(canTakeNozzle)},
    {},
    [],
    [0, 0, 0],
    REFUEL_ACTION_DISTANCE
] call EFUNC(interact_menu,createAction);
[_target, 0, ["ACE_MainActions", QGVAR(refuel)], _action] call EFUNC(interact_menu,addActionToObject);

// Add turnOn
_action = [QGVAR(turnOn),
    LLSTRING(turnOn),
    QPATHTOF(ui\icon_refuel_interact.paa),
    {[_player, _target] call FUNC(turnOn)},
    {[_player, _target] call FUNC(canTurnOn)},
    {},
    [],
    [0, 0, 0],
    REFUEL_ACTION_DISTANCE
] call EFUNC(interact_menu,createAction);
[_target, 0, ["ACE_MainActions", QGVAR(refuel)], _action] call EFUNC(interact_menu,addActionToObject);

// Add turnOn container
_action = [QGVAR(turnOn_Container),
    LLSTRING(turnOn_Container),
    QPATHTOF(ui\icon_refuel_interact.paa),
    {[_player, _target, true] call FUNC(turnOn)},
    {[_player, _target, true] call FUNC(canTurnOn)},
    {},
    [],
    [0, 0, 0],
    REFUEL_ACTION_DISTANCE
] call EFUNC(interact_menu,createAction);
[_target, 0, ["ACE_MainActions", QGVAR(refuel)], _action] call EFUNC(interact_menu,addActionToObject);

// Add check fuel
_action = [QGVAR(checkFuel),
    LLSTRING(checkFuel),
    QPATHTOF(ui\icon_refuel_interact.paa),
    {[_player, _target] call FUNC(checkFuel)},
    {[_player, _target] call FUNC(canCheckFuel)},
    {},
    [],
    [0, 0, 0],
    REFUEL_ACTION_DISTANCE
] call EFUNC(interact_menu,createAction);
[_target, 0, ["ACE_MainActions", QGVAR(refuel)], _action] call EFUNC(interact_menu,addActionToObject);

// Add turnOff
_action = [QGVAR(TurnOff),
    LLSTRING(turnOff),
    QPATHTOF(ui\icon_refuel_interact.paa),
    {[_player, _target] call FUNC(turnOff)},
    {[_player, _target] call FUNC(canTurnOff)},
    {},
    [],
    [0, 0, 0],
    REFUEL_ACTION_DISTANCE
] call EFUNC(interact_menu,createAction);
[_target, 0, ["ACE_MainActions", QGVAR(refuel)], _action] call EFUNC(interact_menu,addActionToObject);

// Add disconnect
_action = [QGVAR(disconnect),
    LLSTRING(disconnectFuelCanister),
    QPATHTOF(ui\icon_refuel_interact.paa),
    {
        [_player, _target, false] call FUNC(disconnect);
        [_player, _target] call FUNC(takeNozzle);
    },
    {[_player, _target] call FUNC(canDisconnect)},
    {},
    [],
    [0, 0, 0],
    REFUEL_ACTION_DISTANCE
] call EFUNC(interact_menu,createAction);
[_target, 0, ["ACE_MainActions", QGVAR(refuel)], _action] call EFUNC(interact_menu,addActionToObject);
