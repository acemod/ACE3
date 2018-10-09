#include "script_component.hpp"
/*
 * Author: Glowbal
 * Check if item can be loaded into other Object.
 *
 * Arguments:
 * 0: Item <OBJECT or STRING>
 * 1: Holder Object (Vehicle) <OBJECT>
 * 2: Ignore interaction distance and stability checks <BOOL>
 *
 * Return Value:
 * Can load in <BOOL>
 *
 * Example:
 * [item, holder] call ace_cargo_fnc_canLoadItemIn
 *
 * Public: No
 */

params [["_item", "", [objNull,""]], "_vehicle", ["_ignoreInteraction", false]];

if ((!_ignoreInteraction) && {speed _vehicle > 1 || {((getPos _vehicle) select 2) > 3}}) exitWith {TRACE_1("vehicle not stable",_vehicle); false};

if (_item isEqualType objNull && {{alive _x && {getText (configFile >> "CfgVehicles" >> typeOf _x >> "simulation") != "UAVPilot"}} count crew _item > 0}) exitWith {
    TRACE_1("item is occupied",_item);
    false
};

private _itemSize = [_item] call FUNC(getSizeItem);
private _validItem = false;
if (_item  isEqualType "") then {
    _validItem =
        isClass (configFile >> "CfgVehicles" >> _item) &&
        {getNumber (configFile >> "CfgVehicles" >> _item >> QGVAR(canLoad)) == 1};
} else {
    _validItem =
        (alive _item) &&
        {_ignoreInteraction || {([_item, _vehicle] call EFUNC(interaction,getInteractionDistance)) < MAX_LOAD_DISTANCE}};
};

_validItem &&
{_itemSize > 0} &&
{alive _vehicle} &&
{_itemSize <= ([_vehicle] call FUNC(getCargoSpaceLeft))} &&
{locked _vehicle < 2}
