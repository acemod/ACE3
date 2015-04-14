/*

by commy2

Shows or hides the vectors center square thingy.

*/
#include "script_component.hpp"

((GETUVAR(ACE_dlgVector,displayNull)) displayCtrl 1301) ctrlSetText (["", QUOTE(PATHTOF(rsc\vector_center.paa))] select (_this select 0));

[GVAR(illuminate)] call FUNC(illuminate);
