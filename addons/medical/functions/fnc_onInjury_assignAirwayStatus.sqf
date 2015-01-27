/**
 * fn_assignAirwayStatus.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_unit", "_amountOfDamage", "_typeOfInjury", "_bodyPartn","_airwayItem","_airwayStatus","_selection", "_airwayIncrease"];
_unit = _this select 0;
_amountOfDamage = _this select 1;
_typeOfInjury = _this select 2;
_bodyPartn = _this select 3;

// only the head
if (_bodyPartn != 0) exitwith {};

if (_amountOfDamage > 0.4) then {
    if (random(1) >= 0.8) then {
        _unit setvariable [QGVAR(airwayCollapsed), true, true];
    };
};