#include "script_component.hpp"
/*
 * Author: Cyruz
 * Add delete interaction to dead static weapons
 *
 * Arguments:
 * 0: Weapon <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [weapon] call ace_csw_fnc_staticWeaponKilled
 *
 * Public: No
 */

params ["_veh"];

private _deleteStatic = [QGVAR(deleteStatic), localize ELSTRING(arsenal,buttonDeleteText), "", {deleteVehicle _target}, {true}] call EFUNC(interact_menu,createAction);
[_veh, 0, ["ACE_MainActions"], _deleteStatic] call EFUNC(interact_menu,addActionToObject);
