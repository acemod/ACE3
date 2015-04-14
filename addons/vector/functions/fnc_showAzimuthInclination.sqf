// by commy2
#include "script_component.hpp"

private "_dlgVector";

disableSerialization;
_dlgVector = GETUVAR(ACE_dlgVector,displayNull);

private ["_direction", "_digits"];

_direction = call FUNC(getDirection);

// azimuth
_digits = [_direction select 0] call FUNC(convertToTexturesDegree);

(_dlgVector displayCtrl 1315) ctrlSetText (_digits select 0);
(_dlgVector displayCtrl 1316) ctrlSetText (_digits select 1);
(_dlgVector displayCtrl 1317) ctrlSetText (_digits select 2);
(_dlgVector displayCtrl 1318) ctrlSetText (_digits select 3);

// inclination
_digits = [_direction select 1] call FUNC(convertToTexturesDegree);

(_dlgVector displayCtrl 1311) ctrlSetText (_digits select 0);
(_dlgVector displayCtrl 1312) ctrlSetText (_digits select 1);
(_dlgVector displayCtrl 1313) ctrlSetText (_digits select 2);
(_dlgVector displayCtrl 1314) ctrlSetText (_digits select 3);

[GVAR(illuminate)] call FUNC(illuminate);
