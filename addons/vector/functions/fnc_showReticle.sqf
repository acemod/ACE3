#include "script_component.hpp"
/*
 * Author: commy2
 * Shows or hides the electronic reticle.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_vector_fnc_showReticle
 *
 * Public: No
 */

((GETUVAR(ACE_dlgVector,displayNull)) displayCtrl 1302) ctrlSetText (["", QPATHTOF(rsc\vector_crosshair.paa)] select (_this select 0));

[GVAR(illuminate)] call FUNC(illuminate);
