/*

by commy2

Shows or hides the electronic reticle.

*/
#include "script_component.hpp"

((GETUVAR(ACE_dlgVector,displayNull)) displayCtrl 1302) ctrlSetText (["", QUOTE(PATHTOF(rsc\vector_crosshair.paa))] select (_this select 0));

[GVAR(illuminate)] call FUNC(illuminate);
