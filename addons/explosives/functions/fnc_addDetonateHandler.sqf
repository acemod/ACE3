/*
 * Author: PabstMirror
 * Add a explosive detonation handler.
 * Should be called on all machines.
 * Code needs to return BOOL: true(allowed) / false(blocked)
 * See https://ace3mod.com/wiki/framework/explosives-framework.html for an example.
 *
 * Arguments:
 * 0: Code <CODE>
 *  - Passed [Unit<OBJECT>, MaxRange <NUMBER>, Explosive <OBJECT>, FuzeTime <NUMBER>, TriggerItem <STRING>]
 *
 * Return Value:
 * None
 *
 * Example:
 * [{false}] call ace_explosives_fnc_addDetonateHandler;
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [["_code", {true}, [{}]]];

GVAR(detonationHandlers) pushBack _code;
