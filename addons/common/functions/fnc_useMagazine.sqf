/*
 * Author: Glowbal
 *
 * Use magazine
 *
 * Argument:
 * 0: unit (OBJECT)
 * 1: magazine (STRING)
 *
 * Return value:
 * if magazine has been used. (BOOLEAN)
 *
 * Public: Yes
 */
#include "script_component.hpp"

private ["_return"];
params ["_unit", "_magazine", ["_vehicleUsage", false, [false]]];

if (!_vehicleUsage) then {
    if (_magazine != "") then {
        _unit removeMagazine _magazine;
        _return = true;
    } else {
        _return = false;
    };
    [format["fnc_useMagazine: %1 | %2",_this,_return]] call FUNC(debug);
_return
} else {
    // @TODO implement shared magazine functionality
};
