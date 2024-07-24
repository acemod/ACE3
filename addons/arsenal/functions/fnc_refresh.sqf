#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Brett Mayson, johnb43
 * Refreshes the arsenal to show external changes.
 *
 * Arguments:
 * 0: Update current and unique items lists <BOOL> (default: true)
 * 1: Update virtual items list <BOOL> (default: false)
 * 2: Use panel refresh animation <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_arsenal_fnc_refresh
 *
 * Public: Yes
*/
params [["_updateItems", true, [true]], ["_updateVirtualItems", false, [false]], ["_animate", false, [false]]];
TRACE_2("",_updateItems,_updateVirtualItems);

// Don't execute in scheduled environment
if (canSuspend) exitWith {
    [{_this call FUNC(refresh)}, _this] call CBA_fnc_directCall;
};

private _display = findDisplay IDD_ace_arsenal;

// Exit quietly if no display found
if (isNull _display) exitWith {};

if (_updateItems) then {
    // Update current item list
    call FUNC(updateCurrentItemsList);

    // This takes care of unique inventory items (arsenal doesn't have it whitelisted)
    if (!_updateVirtualItems) then {
        call FUNC(updateUniqueItemsList);
    };
};

private _virtualItems = GVAR(currentBox) getVariable QGVAR(virtualItems);

if (is3DEN) then {
    _virtualItems = uiNamespace getVariable QGVAR(configItems); // GVAR(currentBox) is nil in 3DEN
    _animate = true; // CBA frame functions are disabled during preInit
};

// Do not close an arsenal if it was opened with ignoring the existing content (see FUNC(openBox))
if (isNil "_virtualItems" && {isNil QGVAR(ignoredVirtualItems)}) exitWith {
    [LLSTRING(noVirtualItems), false, 5, 1] call EFUNC(common,displayText);
    // Delay a frame in case this is running on display open
    [{(findDisplay IDD_ace_arsenal) closeDisplay 0}] call CBA_fnc_execNextFrame;
};

if (_updateVirtualItems) then {
    GVAR(virtualItems) = +_virtualItems;
    call FUNC(updateVirtualItemsFlat);

    // Gotta update this regardless of condition to prevent desync
    call FUNC(updateUniqueItemsList);
};

// Don't refresh left panel if in loadout tab
if (!isNull findDisplay IDD_loadouts_display) exitWith {};

if (!_animate) then {
    GVAR(refreshing) = true;
    [{GVAR(refreshing) = false}, nil, 3] call CBA_fnc_execAfterNFrames;
};

[_display, _display displayCtrl GVAR(currentLeftPanel), _animate] call FUNC(fillLeftPanel);
