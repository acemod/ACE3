/*
 * Author: Jonpas
 * Request a rebalance.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [object] call ace_headless_handleInitPost;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_object"];

TRACE_1("InitPost",_object);

// Delay until settings are initialized (for checking if HC trasnferring is enabled)
if (!EGVAR(common,settingsInitFinished)) exitWith {
    EGVAR(common,runAtSettingsInitialized) pushBack [FUNC(handleInitPost), _this];
};

// Exit if HC transferring disabled or object not a unit (including unit inside vehicle) or is player
if (!GVAR(Enabled) || {!(_object in allUnits)} || {isPlayer _object}) exitWith {};

// Rebalance
[false] call FUNC(rebalance);
