/*
 * Author: Glowbal
 * Enabled the vitals loop for a unit.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: the last known ID <NUMBER>
 * 2: Origin object <OBJECT>
 *
 * ReturnValue:
 * <NIL>
 *
 * Public: Yes
 */

#include "script_component.hpp"
private ["_unit", "_lastId", "_openWounds"];
_unit = _this select 0;
_lastId = _this select 1;
_originOfrequest = _this select 2;

if (local _unit) then {
    _openWounds = _unit getvariable [QGVAR(openWounds), []];
    {
        ["medical_propagateWound", [_originOfrequest], [_unit, _x]] call EFUNC(common,targetEvent);
    }foreach _openWounds;
};
