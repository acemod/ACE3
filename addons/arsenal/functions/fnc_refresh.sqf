#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Brett Mayson, johnb43
 * Refreshes the arsenal to show external changes.
 *
 * Return Value:
 * None
 *
 * Public: No
*/

// Update current item list
call FUNC(updateCurrentItemsList);

// This takes care of unique inventory items (arsenal doesn't have it whitelisted)
call FUNC(updateUniqueItemsList);

// Don't refresh left panel if in loadout tab
if (!isNull findDisplay IDD_loadouts_display) exitWith {};

private _display = findDisplay IDD_ace_arsenal;

[_display, _display displayCtrl GVAR(currentLeftPanel)] call FUNC(fillLeftPanel);
