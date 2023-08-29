#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Brett Mayson, johnb43
 * Refreshes the arsenal to show external changes.
 *
 * Arguments:
 * 0: Update current and unique items lists <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_arsenal_fnc_refresh
 *
 * Public: Yes
*/
params [["_updateItems", true, [true]]];

if (_updateItems) then {
    // Update current item list
    call FUNC(updateCurrentItemsList);

    // This takes care of unique inventory items (arsenal doesn't have it whitelisted)
    call FUNC(updateUniqueItemsList);
};

// Don't refresh left panel if in loadout tab
if (!isNull findDisplay IDD_loadouts_display) exitWith {};

private _display = findDisplay IDD_ace_arsenal;

[_display, _display displayCtrl GVAR(currentLeftPanel)] call FUNC(fillLeftPanel);
