/*
 * Author: KoffeinFlummi
 * Replaces vanilla items with ACE ones.
 *
 * Arguments:
 * 0: The unit <OBJECT>
 *
 * ReturnValue:
 * nil
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_unit"];
_unit = _this select 0;

while {({_x == "FirstAidKit"} count items _unit) > 0} do {
    _unit removeItem "FirstAidKit";
    if (GVAR(level) >= 2) then {
        // TODO
    } else {
        _unit addItem QGVAR(fieldDressing);
        _unit addItem QGVAR(fieldDressing);
        _unit addItem QGVAR(morphine);
    };
};

while {({_x == "Medikit"} count items _unit) > 0} do {
    _unit removeItem "Medikit";
    if (GVAR(level) >= 2) then {
        // TODO
    } else {
        _unit addItemToBackpack QGVAR(epinephrine);
        _unit addItemToBackpack QGVAR(epinephrine);
        _unit addItemToBackpack QGVAR(epinephrine);
        _unit addItemToBackpack QGVAR(epinephrine);
        _unit addItemToBackpack QGVAR(bloodIV);
        _unit addItemToBackpack QGVAR(bloodIV);
    };
};
