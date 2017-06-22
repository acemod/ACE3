/*
 * Author: PabstMirror
 * Handles locality switch, runs a respawn check and then reapplies all effect events.
 *
 * Arguments:
 * 0: vehicle that it will be attached to (player or vehicle) <OBJECT>
 * 1: isLocal <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, true] call ace_common_fnc_statusEffect_localEH
 *
 * Public: No
 */
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_object", "_isLocal"];
TRACE_2("params",_object,_isLocal);

//Only run this after the settings are initialized
//Need to wait for all EH to be installed (local event will happen between pre and post init)
if !(GVAR(settingsInitFinished)) exitWith {
    TRACE_1("pushing to runAtSettingsInitialized", _this);
    GVAR(runAtSettingsInitialized) pushBack [FUNC(statusEffect_localEH), _this];
};

if (!_isLocal) exitWith {TRACE_1("object no longer local", _this)};
if (isNull _object) exitWith {TRACE_1("object null", _this)};

 //Reset any variables because of respawn
[_object, false] call FUNC(statusEffect_resetVariables);

//Send all Variables to client
[_object, ""] call FUNC(statusEffect_sendEffects);
