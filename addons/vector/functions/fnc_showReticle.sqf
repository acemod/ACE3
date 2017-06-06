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
 * Public: No
 */

#include "script_component.hpp"

((GETUVAR(ACE_dlgVector,displayNull)) displayCtrl 1302) ctrlSetText (["", QPATHTOF(rsc\vector_crosshair.paa)] select (_this select 0));

[GVAR(illuminate)] call FUNC(illuminate);
