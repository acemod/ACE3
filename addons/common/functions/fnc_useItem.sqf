/**
 * fn_useItem.sqf
 * @Descr:
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_return"];
PARAMS_2(_unit,_item);
_vehicleUsage = [_this, 2, false, [false]] call BIS_fnc_Param;

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
// TODO implement shared item functionality for with vehicles.

_return;