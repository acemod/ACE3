/*
 * Author: Glowbal
 * Called when a unit switched locality
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Is local <BOOL>
 *
 * ReturnValue:
 * None
 *
 * Public: No
 */


#include "script_component.hpp"

private["_unit", "_local"];
_unit = _this select 0;
_local = _this  select 1;
if (_local) then {
    if (_unit getvariable[QGVAR(addedToUnitLoop),false]) then {
        [_unit, true] call FUNC(addToInjuredCollection);
    };
};
