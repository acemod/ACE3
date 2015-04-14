// by commy2
#include "script_component.hpp"

private "_dlgVector";

disableSerialization;
_dlgVector = GETUVAR(ACE_dlgVector,displayNull);

private ["_distance", "_digits"];

_distance = call FUNC(getDistance);

_digits = [_distance] call FUNC(convertToTexturesDistance);

(_dlgVector displayCtrl 1311) ctrlSetText (_digits select 0);
(_dlgVector displayCtrl 1312) ctrlSetText (_digits select 1);
(_dlgVector displayCtrl 1313) ctrlSetText (_digits select 2);
(_dlgVector displayCtrl 1314) ctrlSetText (_digits select 3);

[GVAR(illuminate)] call FUNC(illuminate);
