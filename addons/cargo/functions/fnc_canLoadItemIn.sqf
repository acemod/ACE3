#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Checks if the item can be loaded into another object.
 *
 * Arguments:
 * 0: Item to be loaded <STRING> or <OBJECT>
 * 1: Holder object (vehicle) <OBJECT>
 * 2: Ignore interaction distance and stability checks <BOOL> (default: false)
 *
 * Return Value:
 * Can be loaded <BOOL>
 *
 * Example:
 * ["ACE_Wheel", cursorObject] call ace_cargo_fnc_canLoadItemIn
 *
 * Public: No
 */

params ["_item", "_vehicle", ["_ignoreInteraction", false]];

// Check if vehicle is stable
if (!_ignoreInteraction && {speed _vehicle > 1 || {((getPos _vehicle) select 2) > 3}}) exitWith {
    TRACE_1("vehicle not stable",_vehicle);

    false // return
};

// If there is crew that isn't UAV crew, exit
if (_item isEqualType objNull && {(crew _item) findIf {alive _x && {!unitIsUAV _x}} != -1}) exitWith {
    TRACE_1("item is occupied",_item);

    false // return
};

private _itemSize = _item call FUNC(getSizeItem);

private _validItem = if (_item isEqualType "") then {
    private _config = configFile >> "CfgVehicles" >> _item;

    isClass _config &&
    {getNumber (_config >> QGVAR(canLoad)) == 1}
} else {
    alive _item &&
    {_item getVariable [QGVAR(canLoad), getNumber (configOf _item >> QGVAR(canLoad)) == 1]} &&
    {_ignoreInteraction || {([_item, _vehicle] call EFUNC(interaction,getInteractionDistance)) < MAX_LOAD_DISTANCE}} &&
    {!(_item getVariable [QEGVAR(cookoff,isCookingOff), false])} && // do not load items that are cooking off
    {isNull (_item getVariable [QEGVAR(refuel,nozzle), objNull])} && // objects which have a refueling nozzle connected to them cannot be loaded
    {isNull (_item getVariable [QEGVAR(refuel,ownedNozzle), objNull])} // fuel sources which have their nozzle out cannot be loaded
};

_validItem &&
{alive _vehicle} &&
{locked _vehicle < 2} &&
{_vehicle getVariable [QGVAR(hasCargo), getNumber (configOf _vehicle >> QGVAR(hasCargo)) == 1]} &&
{_itemSize >= 0} &&
{_itemSize <= (_vehicle call FUNC(getCargoSpaceLeft)) max 0}
