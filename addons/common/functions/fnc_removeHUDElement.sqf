#include "script_component.hpp"
/*
 * Author: GhostIsSpooky
 * Removes a HUD element from the HUD helper
 *
 * Arguments:
 * 0: Control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_ctrl] call ace_common_fnc_removeHUDElement
 *
 * Public: Yes
 */
params [["_ctrl", controlNull, [controlNull]]];
if (isNull _ctrl) exitWith {};

private _id = ctrlClassName _ctrl;

uiNamespace setVariable [_id, nil];
ctrlDelete _ctrl;
GVAR(hudHelperHash) deleteAt _id;
