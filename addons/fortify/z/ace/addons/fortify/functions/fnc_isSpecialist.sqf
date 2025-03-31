#include "script_component.hpp"
/*
 * Author: Kingsley
 * Checks whether the given player is a Specialist.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * is Specialist <BOOL>
 *
 * Example:
 * [player] call ace_fortify_fnc_isSpecialist
 *
 * Public: Yes
 */


params ["_player"];
private _return = false;

// Check for Construction Tool
if ("ACE_ConstructionTool" in (items _player)) then {
	_return = true;
};
// Return
_return
