#include "script_component.hpp"
/*
 * Author: Glowbal
 * Use magazine
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: magazine <STRING>
 *
 * Return Value:
 * if magazine has been used. <BOOL>
 *
 * Example:
 * [bob, "magazine"] call ace_common_fnc_useMagazine
 *
 * Public: Yes
 */

params ["_unit", "_magazine", ["_vehicleUsage", false]];

private _return = false;

if !(_vehicleUsage) then {
    if (_magazine != "") then {
        _unit removeMagazine _magazine;
        _return = true;
    };

    [format ["fnc_useMagazine: %1 | %2", _this, _return]] call FUNC(debug);
//} else {
    // @todo implement shared magazine functionality
};

_return
