/*
 * Author: alganthe
 *
 *
 * Arguments:
 *
 *
 * Return Value:
 *
 *
 * Public:
 */
 #include "script_component.hpp"

params ["_unit",""];
(_unit getVariable [QGVAR(backpackProperties),nil]) params ["_backpackContent","_backpackClassname"];

if (!isNil "_backpackClassname") then {

    _holder = "WeaponHolderSimulated" createVehicle getPosWorld _unit;

    _holder addBackpackCargoGlobal [_backpackClassname,1];

    {
        _unit addItemToBackpack _x;
    } forEach _backpackContent;

    _unit setVariable [QGVAR(backpackProperties),nil];
};
