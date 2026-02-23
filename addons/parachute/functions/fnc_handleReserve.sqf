#include "..\script_component.hpp"
/*
 * Author: joko, Jonas, kymckay
 * Cache reserve parachute on player unit when their inventory changes and add it when they open their parachute
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_parachute_fnc_handleReserve
 *
 * Public: No
 */

params ["_unit"];
private _backpack = backpackContainer _unit;

if (
    isNull _backpack &&
    {(vehicle _unit) isKindOf "ParachuteBase"} &&
    {GETVAR(_unit,GVAR(hasReserve),false)}
) then {
    // Case where unit has just opened parachute and reserve should be added
    _unit addBackpackGlobal GETVAR(_unit,GVAR(backpackClass),"ACE_NonSteerableReserveParachute");
    SETVAR(vehicle _unit,GVAR(canCut),true); // Mark the parachute cuttable since reserve is present
} else {
    // Case where inventory has changed otherwise (including when reserve is added)
    private _backpackCfg = configOf _backpack;
    private _hasReserve = getNumber (_backpackCfg >> "ace_hasReserveParachute") == 1;

    // Cache reserve parachute state and class when backpack changes
    SETVAR(_unit,GVAR(hasReserve),_hasReserve);
    if (_hasReserve) then {
        SETVAR(_unit,GVAR(backpackClass),getText (_backpackCfg >> "ace_reserveParachute"));
    } else {
        SETVAR(_unit,GVAR(backpackClass),"");
    };
};
