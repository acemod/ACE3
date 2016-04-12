/*
   * Author: joko // Jonas
   * Add the Reserve Parachute to Units or Save Backpack if is a Parachute in Unit
   *
   * Arguments:
   * None
   *
   * Return Value:
   * 0: Unit
   * 1: getAllGear-Array
   *
   * Example:
   * None
   *
   * Public: No
   */
#include "script_component.hpp"

params ["_unit", "_gear"];
private _backpack = _gear select 6;

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
