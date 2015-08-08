/*
 * Author: Glowbal
 *
 * ?
 *
 * Arguments:
 * ?
 *
 * Return Value:
 * ?
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit", "_item"];

private ["_return", "_vehicleUsage"];

_vehicleUsage = param[2, false, [false]];

_return = false;
if (!_vehicleUsage) then {
    if (_item != "") then {
        if (_item in (items _unit)) then {
            _unit removeItem _item;
            _return = true;
        } else {
            if (_item in (assignedItems _unit)) then {
                _unit unassignItem _item;
                _unit removeItem _item;
                _return = true;
            };
        };
    };
};
// @TODO implement shared item functionality for with vehicles.

_return
