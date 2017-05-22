/*
 * Author: Arcanum
 * Check if a unit is AI
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * ReturnValue:
 * Is AI <BOOL>
 *
 * Example:
 * [player] call ace_medical_fnc_isAI
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_unit"];
private _return = 0;

if (isPlayer _unit) then {
  _return=0;
else {
  _return=1;
};
_return
