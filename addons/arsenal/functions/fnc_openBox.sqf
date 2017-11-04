#include "script_component.hpp"
#include "..\defines.hpp"

params [["_object", objNull, [objNull]], ["_center", objNull, [objNull]], ["_mode", false, [false]]];

if (isNull _object || {isNull _center}) exitWith {};
if (isNil {_object getVariable [QGVAR(virtualItems), nil]} && {!_mode}) exitWith {};

private _displayToUse = [findDisplay 46, findDIsplay 312] select (!isNull findDisplay 312);
_displayToUse = [_displayToUse, findDisplay 313] select (is3DEN);

if (isNil "_displayToUse" || {!isnil QGVAR(camera)}) exitWith {
    hint "No display or arsenal already opened"; // TBR
};

GVAR(mode) = _mode;
GVAR(center) = _center;
if (_mode) then {

    GVAR(virtualItems) = uiNamespace getVariable QGVAR(configItems);
} else {
    GVAR(virtualItems) = +(_object getVariable [QGVAR(virtualItems), [
        [[], [], []], [[], [], [], []], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], []
    ]]);
};

_displayToUse createDisplay QGVAR(display);
