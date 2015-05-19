#include "script_component.hpp"
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

_unit = _this select 0;
_backpack = ((_this select 1) select 6);

if ((vehicle _unit) isKindOf "ParachuteBase" || (backpack _unit == "")) then {
    _unit addbackpack (_unit getVariable[QGVAR(backpackClass),""]);
} else {
    if (getText(configfile >> "CfgVehicles" >> _backpack >> "ParachuteClass") in ["NonSteerable_Parachute_F","B_Parachute_02_F","O_Parachute_02_F","I_Parachute_02_F","Steerable_Parachute_F"]) then {
        _unit setvariable[QGVAR(backpackClass),_backpack];
    };
};