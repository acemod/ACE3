#include "script_component.hpp"
/*
* Author: PabstMirror
* Condition for showing the RDF interface
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

params ["_player"];

((backpack _player) == QGVAR(backpack))
&& {alive _player}
