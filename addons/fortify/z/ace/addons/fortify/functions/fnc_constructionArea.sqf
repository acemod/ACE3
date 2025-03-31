#include "script_component.hpp"
/*
 * Author: Dextro
 * Checks whether unit is in construction area
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 
 * Return Value:
 * In Area <BOOL>
 *
 * Example:
 * [_unit] call ace_fortify_fnc_constructionArea
 *
 * Public: Yes
 */

// Paramter Init
params ["_unit"];
private _return = false;

if ((count (_unit nearObjects ['ACE_Construction_Base',GVAR(fortBaseRange)])) > 0) then {
	_return = true;
};

_return