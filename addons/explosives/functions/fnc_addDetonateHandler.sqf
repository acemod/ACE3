#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Add a explosive detonation handler.
 * Should be called on all machines.
 * Code needs to return BOOL: true (allowed) / false (blocked)
 * See https://ace3.acemod.org/wiki/framework/explosives-framework.html for an example.
 *
 * Arguments:
 * 0: Code <CODE> (default: {true})
 *  - Passed [Unit <OBJECT>, MaxRange <NUMBER>, Explosive <OBJECT>, FuseTime <NUMBER>, TriggerItem <STRING>]
 *
 * Return Value:
 * None
 *
 * Example:
 * [{false}] call ace_explosives_fnc_addDetonateHandler
 *
 * Public: Yes
 */

params [["_code", {true}, [{}]]];

GVAR(detonationHandlers) pushBack _code;

nil
