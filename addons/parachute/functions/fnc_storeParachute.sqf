/*
 * Author: joko // Jonas
 * Add the Reserve Parachute to Units or Save Backpack if is a Parachute in Unit
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Unit <OBJECT>
 *
 * Example:
 * call ace_parachute_fnc_storeParachute
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit"];
private _backpack = backpack _unit;

if ((vehicle _unit) isKindOf "ParachuteBase" && {backpack _unit == ""} && {!(_unit getVariable [QGVAR(chuteIsCut),false])} && {_unit getVariable [QGVAR(hasReserve),false]}) then {
    _unit addBackpackGlobal (_unit getVariable[QGVAR(backpackClass),"ACE_NonSteerableParachute"]);
} else {
    if ((getNumber(configFile >> "CfgVehicles" >> _backpack >> "ace_hasReserveParachute")) == 1) then {
        _unit setVariable[QGVAR(backpackClass),getText(configFile >> "CfgVehicles" >> _backpack >> "ace_reserveParachute"),true];
    };
    if (!(_unit getVariable [QGVAR(chuteIsCut),false]) && {!(animationState _unit == 'para_pilot')}) then {
        _unit setVariable [QGVAR(hasReserve),[false,true] select (getNumber(configFile >> "CfgVehicles" >> _backpack >> "ace_hasReserveParachute")),true];
    };
};
