#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43
 * Open arsenal.
 *
 * Arguments:
 * 0: Box <OBJECT>
 * 1: Unit to open the arsenal on <OBJECT>
 * 2: Ignore virtual items and fill arsenal <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [_box, player] call ace_arsenal_fnc_openBox
 *
 * Public: Yes
*/

params [["_object", objNull, [objNull]], ["_center", objNull, [objNull]], ["_mode", false, [false]]];

if (
    isNull _object ||
    {isNull _center} ||
    {!(_center isKindOf "CAManBase")} ||
    {!(isNull objectParent _center) && {!is3DEN}}
) exitWith {};

// If object has no arsenal and chosen option is to not ignore virtual items of object, exit
private _virtualItems = _object getVariable QGVAR(virtualItems);

if (isNil "_virtualItems" && {!_mode}) exitWith {
    [LLSTRING(noVirtualItems), false, 5, 1] call EFUNC(common,displayText);
};

// Don't execute in scheduled environment
if (canSuspend) exitWith {
    [FUNC(openBox), _this] call CBA_fnc_directCall;
};

private _displayToUse = findDisplay IDD_RSCDISPLAYCURATOR;
_displayToUse = [_displayToUse, findDisplay IDD_MISSION] select (isNull _displayToUse);
_displayToUse = [_displayToUse, findDisplay IDD_DISPLAY3DEN] select is3DEN;

// Check if the display is available and that there isn't already a camera for the arsenal
if (isNull _displayToUse || {!isNil QGVAR(camera)}) exitWith {
    [LLSTRING(CantOpenDisplay), false, 5, 1] call EFUNC(common,displayText);
};

GVAR(center) = _center;
GVAR(currentBox) = _object;

if (_mode) then {
    // Add all the items from the game that the arsenal has detected
    GVAR(virtualItems) = +(uiNamespace getVariable QGVAR(configItems));
    GVAR(virtualItemsFlat) = +(uiNamespace getVariable QGVAR(configItemsFlat));

    GVAR(ignoredVirtualItems) = true;
} else {
    // Add only specified items to the arsenal
    GVAR(virtualItems) = +_virtualItems;

    // Flatten out hashmaps for easy checking later
    call FUNC(updateVirtualItemsFlat);
};

if (is3DEN) then {
    _displayToUse createDisplay QGVAR(display);
} else {
    [{
        _this createDisplay QGVAR(display);
    }, _displayToUse] call CBA_fnc_execNextFrame;
};
