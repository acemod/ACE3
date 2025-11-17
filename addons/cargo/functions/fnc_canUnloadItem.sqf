#include "..\script_component.hpp"
/*
 * Author: Glowbal, ViperMaul
 * Checks if the item can be unloaded from another object.
 *
 * Arguments:
 * 0: Item to be unloaded <STRING or OBJECT>
 * 1: Holder object (vehicle) <OBJECT>
 * 2: Unit doing the unloading <OBJECT> (default: objNull)
 * 3: Ignore interaction distance and stability checks <BOOL> (default: false)
 * 4: Ignore finding a suitable position <BOOL> (default: false)
 *
 * Return Value:
 * Can be unloaded <BOOL>
 *
 * Example:
 * ["ACE_Wheel", cursorObject] call ace_cargo_fnc_canUnloadItem
 *
 * Public: No
 */

params ["_item", "_vehicle", ["_unloader", objNull], ["_ignoreInteraction", false], ["_ignoreFindPosition", false]];
TRACE_2("params",_item,_vehicle);

// Get config sensitive case name
if (_item isEqualType "") then {
    _item = _item call EFUNC(common,getConfigName);
};

if !(_item in (_vehicle getVariable [QGVAR(loaded), []])) exitWith {false};

private _validItem = if (_item isEqualType objNull) then {
    alive _item && isNull (isVehicleCargo _item);
} else {
    true
};

_validItem &&
{alive _vehicle} &&
{locked _vehicle < 2} &&
{_vehicle getVariable [QGVAR(hasCargo), getNumber (configOf _vehicle >> QGVAR(hasCargo)) == 1]} &&
{_item call FUNC(getSizeItem) >= 0} &&
{_ignoreInteraction || {([_unloader, _vehicle] call EFUNC(interaction,getInteractionDistance)) < MAX_LOAD_DISTANCE}} &&
{_ignoreFindPosition || {([_vehicle, _item, _unloader, MAX_LOAD_DISTANCE, !_ignoreInteraction] call EFUNC(common,findUnloadPosition)) isNotEqualTo []}}
