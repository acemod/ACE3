/*
 * Author: PabstMirror
 * Once progressbar is done: Fence is cutdown
 *
 * Arguments:
 * 0: Fence Object <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [aFence] call ace_logistics_wirecutter_fnc_cutDownFenceCallback
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_fenceObject);

_fenceObject setdamage 1;
// [localize LSTRING(FenceCut)] call EFUNC(common,displayTextStructured);
[ACE_player, "AmovPknlMstpSrasWrflDnon", 1] call EFUNC(common,doAnimation);
