#include "script_component.hpp"
/*
 * Author: commy2
 * Shows or hides the 1-P text line.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_vector_fnc_showP1
 *
 * Public: No
 */

disableSerialization;
private _dlgVector = GETUVAR(ACE_dlgVector,displayNull);

if (_this select 0) then {
    (_dlgVector displayCtrl 1321) ctrlSetText QPATHTOF(rsc\vector_1.paa);
    (_dlgVector displayCtrl 1322) ctrlSetText QPATHTOF(rsc\vector_minus.paa);
    (_dlgVector displayCtrl 1323) ctrlSetText QPATHTOF(rsc\vector_p.paa);
    (_dlgVector displayCtrl 1324) ctrlSetText "";
} else {
    (_dlgVector displayCtrl 1321) ctrlSetText "";
    (_dlgVector displayCtrl 1322) ctrlSetText "";
    (_dlgVector displayCtrl 1323) ctrlSetText "";
    (_dlgVector displayCtrl 1324) ctrlSetText "";
};

[GVAR(illuminate)] call FUNC(illuminate);
