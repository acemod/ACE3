/*
 * Author: commy2
 * Shows or hides the vectors center square thingy.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_vector_fnc_showCenter
 *
 * Public: No
 */

#include "script_component.hpp"

((GETUVAR(ACE_dlgVector,displayNull)) displayCtrl 1301) ctrlSetText (["", QPATHTOF(rsc\vector_center.paa)] select (_this select 0));

[GVAR(illuminate)] call FUNC(illuminate);
