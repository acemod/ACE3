#include "script_component.hpp"
/*
 * Author: Kingsley
 * Registers the given objects in the given side's player interaction menu.
 * Players on that side must have the pickaxe item in their inventory to access the menu.
 * Classnames must be in the format [<classname>, <cost>]
 * MUST BE CALLED ON SERVER!
 *
 * Arguments:
 * 0: Side <SIDE>
 * 1: Budget <NUMBER>
 * 2: Object Classnames <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [west, 5000, [["Land_BagFence_Long_F", 5], ["Land_BagBunker_Small_F", 50]]] call ace_fortify_fnc_registerObjects
 *
 * Public: Yes
 */

if (!isServer) exitWith {};

params [["_side", sideUnknown, [sideUnknown]], ["_budget", -1, [0]], ["_objects", [], [[]]]];
TRACE_3("registerObjects",_side,_budget,_objects);

if (_side isEqualTo sideUnknown) exitWith {ERROR_1("Bad Side %1",_this);};

_objects select {
    private _isValid = _x params [["_xClassname", "", [""]], ["_xCost", 0, [0]]];
    if (_isValid) then {
        _isValid = isClass (configFile >> "CfgVehicles" >> _xClassname);
        if (!_isValid) then {WARNING_1("Classname does not exist in CfgVehicles %1",_x);};
    } else {
        WARNING_1("Bad classname/cost input %1, should be [<STRING>,<NUMBER>]",_x);
    };
    _isValid
};

if (!isNil {missionNamespace getVariable format [QGVAR(Budget_%1), _side]}) then {
    INFO_1("Overwriting previous budget for side [%1]",_side);
};
if (!isNil {missionNamespace getVariable format [QGVAR(Objects_%1), _side]}) then {
    INFO_1("Overwriting previous objects for side [%1]",_side);
};

missionNamespace setVariable [format [QGVAR(Budget_%1), _side], _budget, true];
missionNamespace setVariable [format [QGVAR(Objects_%1), _side], _objects, true];
