/**
 * fn_assignFractures.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_unit", "_selectionName", "_amountOfDamage", "_sourceOfDamage", "_typeOfDamage", "_bodyPartn"];
_unit = _this select 0;
_selectionName = _this select 1;
_amountOfDamage = _this select 2;
_sourceOfDamage = _this select 3;
_typeOfDamage = _this select 4;
_bodyPartn = [_selectionName] call FUNC(selectionNameToNumber);

// TODO implement internal injuries
