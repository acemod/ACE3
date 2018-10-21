#include "script_component.hpp"
/*
 * Author: commy2
 *
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_vector_fnc_showAzimuth
 *
 * Public: No
 */

disableSerialization;
private _dlgVector = GETUVAR(ACE_dlgVector,displayNull);

private _direction = call FUNC(getDirection);

private _digits = _direction call FUNC(convertToTexturesDegree);

(_dlgVector displayCtrl 1315) ctrlSetText (_digits select 0);
(_dlgVector displayCtrl 1316) ctrlSetText (_digits select 1);
(_dlgVector displayCtrl 1317) ctrlSetText (_digits select 2);
(_dlgVector displayCtrl 1318) ctrlSetText (_digits select 3);

[GVAR(illuminate)] call FUNC(illuminate);
