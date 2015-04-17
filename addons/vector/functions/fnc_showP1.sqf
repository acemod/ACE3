/*

by commy2

Shows or hides the 1-P text line.

*/
#include "script_component.hpp"

private "_dlgVector";

disableSerialization;
_dlgVector = GETUVAR(ACE_dlgVector,displayNull);

if (_this select 0) then {
    (_dlgVector displayCtrl 1321) ctrlSetText QUOTE(PATHTOF(rsc\vector_1.paa));
    (_dlgVector displayCtrl 1322) ctrlSetText QUOTE(PATHTOF(rsc\vector_minus.paa));
    (_dlgVector displayCtrl 1323) ctrlSetText QUOTE(PATHTOF(rsc\vector_p.paa));
    (_dlgVector displayCtrl 1324) ctrlSetText "";
} else {
    (_dlgVector displayCtrl 1321) ctrlSetText "";
    (_dlgVector displayCtrl 1322) ctrlSetText "";
    (_dlgVector displayCtrl 1323) ctrlSetText "";
    (_dlgVector displayCtrl 1324) ctrlSetText "";
};

[GVAR(illuminate)] call FUNC(illuminate);
