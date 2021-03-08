#include "script_component.hpp"
/*
 * Author: Cyruz
 * Add a drag interaction for destroyed static weapons
 *
 * Arguments:
 * 0: Weapon <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [weapon] call ace_csw_fnc_staticWeaponDrag
 *
 * Public: No
 */

params ["_veh"];

private _dragStatement = [_veh, true, (_veh getVariable [QGVAR(dragPosition), [0,0,0]]), (_veh getVariable [QGVAR(dragDirection), 0]), true] call EFUNC(dragging,setDraggable);
private _dragAction = [QGVAR(dragAction), localize ELSTRING(dragging,drag), "", {_dragStatement}, {true}] call EFUNC(interact_menu,createAction);
[_veh, 0, ["ACE_MainActions"], _dragAction] call EFUNC(interact_menu,addActionToObject);
