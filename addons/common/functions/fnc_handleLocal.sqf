/*
 * Author: PabstMirror
 * Called when a unit switched locality
 *
 * Arguments:
 * 0: XEH Object <OBJECT>
 * 1: Is local <BOOL>
 *
 * ReturnValue:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_object", "_local"];
TRACE_2("params",_object,_local);

if (_local) then {
    local _allowDamageArray = _object getVariable [QGVAR(allowDamage), []];
    if (!(_allowDamageArray isEqualTo [])) then {
        //If locality swiched and this unit has had setAllowDamage run, reApply the effects:
        [_object, "", -1] call FUNC(setAllowDamage);
    };
};
