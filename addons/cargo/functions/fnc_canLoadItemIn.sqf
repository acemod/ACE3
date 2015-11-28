/*
 * Author: Glowbal
 * Check if item can be loaded into other Object.
 *
 * Arguments:
 * 0: Item <OBJECT or STRING>
 * 1: Holder Object (Vehicle) <OBJECT>
 *
 * Return value:
 * Can load in <BOOL>
 *
 * Example:
 * [item, holder] call ace_cargo_fnc_canLoadItemIn
 *
 * Public: No
 */
#include "script_component.hpp"

params [["_item", "", [objNull,""]], "_vehicle"];

if (speed _vehicle > 1 || (((getPos _vehicle) select 2) > 3)) exitWith {false};

private ["_itemSize", "_validItem"];
_itemSize = [_item] call FUNC(getSizeItem);

if (_item  isEqualType "") then {
    _validItem =
        isClass (configFile >> "CfgVehicles" >> _item) &&
        {getNumber (configFile >> "CfgVehicles" >> _item >> QGVAR(canLoad)) == 1};
} else {
    _validItem =
        (alive _item) &&
        {(_item distance _vehicle) <= MAX_LOAD_DISTANCE};
};

_validItem &&
{_itemSize > 0} &&
{alive _vehicle} &&
{_itemSize <= ([_vehicle] call FUNC(getCargoSpaceLeft))}
