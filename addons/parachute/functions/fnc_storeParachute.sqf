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
private ["_unit","_backpack"];
_unit = _this select 0;
_backpack = (_this select 1) select 6 ;
if ((vehicle _unit) isKindOf "ParachuteBase") then {
    _unit addBackpack (_unit getVariable[QGVAR(backpackClass),"ACE_NonSteerableParachute"]);
} else {
    if (getText(configFile >> "CfgVehicles" >> _backpack >> "ace_reserveParachute") != "") then {
        _unit setVariable[QGVAR(backpackClass),getText(configFile >> "CfgVehicles" >> _backpack >> "ace_reserveParachute")];
    };
};