#include "script_component.hpp"
/*
* Author: PabstMirror
*
*
* Arguments:
* 0: vehicle that it will be attached to (player or vehicle) <OBJECT>
*
* Return Value:
* None
*
* Example:
* [player] call ace_radiodirectionfinder_fnc_displayCondition
*
* Public: No
*/

params ["_unit"];

(alive _unit)
&& {(backpack _unit) == QGVAR(backpack)}
