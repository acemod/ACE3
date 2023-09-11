#include "script_component.hpp"
/*
 * Author: PabstMirror, Whigital
 * Check if there is a handler blocking detonation
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Max range (-1 to ignore) <NUMBER>
 * 2: Explosive <OBJECT>
 * 3: Fuse time <NUMBER>
 * 4: Trigger Item Classname <STRING>
 *
 * Return Value:
 * Detonation Allowed <BOOL>
 *
 * Example:
 * [player, -1, Explosive, 1, "ACE_Cellphone"] call ACE_Explosives_fnc_checkDetonateHandlers;
 *
 * Public: No
 */

params ["_unit", "_range", "_explosive", "_fuseTime", ["_triggerClassname", "#unknown", [""]]];
TRACE_5("checkDetonateHandlers",_unit,_range,_explosive,_fuseTime,_triggerClassname);

private _detonationAllowed = true;

{
    // Pass [Unit<OBJECT>, MaxRange <NUMBER>, Explosive <OBJECT>, FuzeTime <NUMBER>, TriggerItem <STRING>]
    private _handlerResult = [_unit, _range, _explosive, _fuseTime, _triggerClassname] call _x;

    if (_handlerResult isEqualTo false) then {
        TRACE_1("Handler Blocking",_forEachIndex);
        _detonationAllowed = false;
        break;
    };
} forEach GVAR(detonationHandlers);

_detonationAllowed
