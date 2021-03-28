#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Handles the Respawn Event Handler to reset effects.
 *
 * Arguments:
 * 0: vehicle that it will be attached to (player or vehicle) <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, objNull] call ace_common_fnc_statusEffect_respawnEH
 *
 * Public: No
 */

params ["_object"];
TRACE_1("params",_object);

//Only run this after the settings are initialized
//Need to wait for all EH to be installed (local event will happen between pre and post init)
if !(GVAR(settingsInitFinished)) exitWith {
    TRACE_1("pushing to runAtSettingsInitialized", _this);
    GVAR(runAtSettingsInitialized) pushBack [FUNC(statusEffect_respawnEH), _this];
};

if (!local _object) exitWith {TRACE_1("object no longer local", _this)};
if (isNull _object) exitWith {TRACE_1("object null", _this)};

 //Reset any variables on "real" respawn
[_object, false] call FUNC(statusEffect_resetVariables);

//Send all Variables to client
[_object, ""] call FUNC(statusEffect_sendEffects);
