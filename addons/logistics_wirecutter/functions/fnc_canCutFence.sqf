/* fnc_canCutFence.sqf
*
* Author: PabstMirror
*
* Condition check if player is able to cut a fence.
* Checks for "ACE_wirecutter" item and if there is a nearby fence.
*
* Argument:
* 0: OBJECT - Unit to check condition for (player)
*
* Return value:
* BOOL
*/

#include "script_component.hpp"
PARAMS_1(_unit);

("ACE_wirecutter" in (items _unit)) && {!(isNull ([_unit] call FUNC(getNearestFence)))}
