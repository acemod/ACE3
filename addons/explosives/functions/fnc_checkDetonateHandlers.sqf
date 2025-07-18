#include "..\script_component.hpp"
/*
 * Author: PabstMirror, Whigital
 * Checks if there is a handler blocking detonation.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Max range (-1 to ignore) <NUMBER>
 * 2: Explosive <OBJECT>
 * 3: Fuse time <NUMBER>
 * 4: Trigger Item Classname <STRING> (default: "#unknown")
 *
 * Return Value:
 * Detonation Allowed <BOOL>
 *
 * Example:
 * [player, -1, cursorObject, 1, "ACE_Cellphone"] call ace_explosives_fnc_checkDetonateHandlers
 *
 * Public: No
 */

params ["_unit", "_range", "_explosive", "_fuseTime", ["_triggerClassname", "#unknown", [""]]];
TRACE_5("checkDetonateHandlers",_unit,_range,_explosive,_fuseTime,_triggerClassname);

private _detonationAllowed = true;

{
    // Pass [Unit <OBJECT>, MaxRange <NUMBER>, Explosive <OBJECT>, FuseTime <NUMBER>, TriggerItem <STRING>]
    private _handlerResult = [_unit, _range, _explosive, _fuseTime, _triggerClassname] call _x;

    // Handle nil and other types than bool as false
    if (isNil "_handlerResult" || {!(_handlerResult isEqualType false)}) then {
        ERROR_1("Handler [%1] bad condition return",_forEachIndex);

        _handlerResult = false;
    };

    if (!_handlerResult) exitWith {
        TRACE_1("Handler Blocking",_forEachIndex);

        _detonationAllowed = false;
    };
} forEach GVAR(detonationHandlers);

_detonationAllowed // return
