#include "script_component.hpp"
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

((GETUVAR(ACE_dlgVector,displayNull)) displayCtrl IDC_CENTER) ctrlSetText (["", QPATHTOF(rsc\vector_center.paa)] select (_this select 0));

[GVAR(illuminate)] call FUNC(illuminate);
