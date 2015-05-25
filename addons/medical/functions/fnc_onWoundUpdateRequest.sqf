/*
 * Author: Glowbal
 * Handles an wound update request.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Origin object <OBJECT>
 *
 * ReturnValue:
 * <NIL>
 *
 * Public: Yes
 */

#include "script_component.hpp"
private ["_unit", "_openWounds", "_originOfrequest"];
_unit = _this select 0;
_originOfrequest = _this select 1;

if (local _unit && !(local _originOfrequest)) then {
    _openWounds = _unit getvariable [QGVAR(openWounds), []];
    {
        ["medical_propagateWound", [_originOfrequest], [_unit, _x]] call EFUNC(common,targetEvent);
    }foreach _openWounds;
};
