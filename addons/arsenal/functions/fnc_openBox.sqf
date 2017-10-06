#include "script_component.hpp"
#include "..\defines.hpp"

params ["_mode", "_object"];

if (isNull _object) exitWith {};

if ( isNil (_object getVariable [QGVAR(virtualItems), nil])) exitWith {};

private _displayToUse = nil;
switch _mode do {
    case 0 : {
        _displayToUse = [findDisplay 46, findDIsplay 312] select {!(isnull findDisplay 312)};
        _displayToUse = [_displayToUse, findDisplay 313] select {is3DEN};
    };
    case 1 : {
        _displayToUse = [findDisplay 46, findDIsplay 312] select {!(isnull findDisplay 312)};
    };
    case 2 : {
        _displayToUse = [findDisplay 46, findDIsplay 312] select {!(isnull findDisplay 312)};
    };
    default {};
};

if (isNil "_displayToUse" && {isnull GVAR(camera)}) exitWith {
    hint "No display or arsenal already opened";
};

GVAR(mode) = _mode;
_displayToUse createDisplay QGVAR(display);
