#include "script_component.hpp"
/*
 * Author: Alganthe
 * Replace the 3DEN "edit loadout" menu action
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 *
 * Public: No
*/

private _entity = (uinamespace getvariable ["bis_fnc_3DENEntityMenu_data",[]]) param [1, objnull];
[_entity, _entity, true] call FUNC(openBox);
