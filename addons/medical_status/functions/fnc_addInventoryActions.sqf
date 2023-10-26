#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim, johnb43
 * Adds inventory and open backpack actions to uncon units.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorTarget] call ace_medical_status_fnc_addInventoryActions
 *
 * Public: No
 */

if (!hasInterface) exitWith {};

params ["_unit"];

// Gear Action - For Unconscious Units
private _id = _unit addAction ["", {
    params ["_target", "_caller"];

    _caller action ["Gear", _target];
}, nil, 5.1, true, true, "gear", toString {
    (_target isNotEqualTo ACE_player) &&
    {(lifeState _target) isEqualTo "INCAPACITATED"}
}, 2];

_unit setUserActionText [_id, localize "STR_ACTION_GEAR", "<img image='\A3\ui_f\data\igui\cfg\actions\gear_ca.paa' size='2.5' shadow=2 />"];

// Open Bag Action - For Dead Units
_unit addAction ["OpenBag", {
    params ["_target", "_caller"];

    _caller action ["OpenBag", _target];
}, nil, 5.2, true, true, "", toString {
    private _backpackContainer = backpackContainer _target;
    private _backpackConfig = configOf _backpackContainer;

    (_target isNotEqualTo ACE_player) &&
    {!((lifeState _target) in ["HEALTHY", "INJURED", "INCAPACITATED"])} &&
    {!isNull _backpackContainer} &&
    {!lockedInventory _backpackContainer} &&
    {maxLoad _backpackContainer > 0} &&
    {getNumber (_backpackConfig >> "disableInventory") != 1} &&
    {_target setUserActionText [_actionId, format [localize "STR_ACTION_OPEN_BAG", getText (_backpackConfig >> "displayName")]]; true}
}, 2];
