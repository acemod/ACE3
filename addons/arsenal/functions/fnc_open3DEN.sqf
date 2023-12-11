#include "..\script_component.hpp"
/*
 * Author: Alganthe
 * Replace the 3DEN "edit loadout" menu action.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
*/

private _entity = (uiNamespace getVariable ["BIS_fnc_3DENEntityMenu_data", []]) param [1, objNull];
[_entity, _entity, true] call FUNC(openBox);
