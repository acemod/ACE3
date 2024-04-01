#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: PabstMirror
 * Handles mouse clicks on search button to toggle live results
 *
 * Arguments:
 * 0: Search button (left or right) <CONTROL>
 * 1: Mouse Button <NUMBER>
 * 2: Not used
 * 3: Not used
 * 4: Not used
 * 5: Ctrl Button <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_ctrl", "_mouseButton", "", "", "", "_keyCtrl"];

if ((!_keyCtrl)) exitWith {}; // Ignore if not CTRL + Click

GVAR(liveUpdateSearch) = !GVAR(liveUpdateSearch);

private _display = ctrlParent _ctrl;
private _color = if (GVAR(liveUpdateSearch)) then { [0,1,0,0.5] } else { [0,0,0,0.5] };
(_display displayCtrl IDC_leftSearchbarButton) ctrlSetBackgroundColor _color;
(_display displayCtrl IDC_rightSearchbarButton) ctrlSetBackgroundColor _color;
