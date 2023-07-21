#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Brett Mayson
 * Refreshes the arsenal to show external changes
 *
 * Return Value:
 * None
 *
 * Public: No
*/

private _display = findDisplay IDD_ace_arsenal;

call FUNC(updateCurrentItemsList);

call FUNC(updateUniqueItemsList);

[_display, _display displayCtrl GVAR(currentLeftPanel)] call FUNC(fillLeftPanel);
