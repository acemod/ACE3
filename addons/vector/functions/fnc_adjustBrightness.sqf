// by commy2
#include "script_component.hpp"

private "_dlgVector";

disableSerialization;
_dlgVector = GETUVAR(ACE_dlgVector,displayNull);

private "_color";

_color = [[1,0,0,0.5], [1,0,0,1]] select (_this select 0);

(_dlgVector displayCtrl 1301) ctrlSetTextColor _color;
(_dlgVector displayCtrl 1302) ctrlSetTextColor _color;
(_dlgVector displayCtrl 1310) ctrlSetTextColor _color;
(_dlgVector displayCtrl 1311) ctrlSetTextColor _color;
(_dlgVector displayCtrl 1312) ctrlSetTextColor _color;
(_dlgVector displayCtrl 1313) ctrlSetTextColor _color;
(_dlgVector displayCtrl 1314) ctrlSetTextColor _color;
(_dlgVector displayCtrl 1315) ctrlSetTextColor _color;
(_dlgVector displayCtrl 1316) ctrlSetTextColor _color;
(_dlgVector displayCtrl 1317) ctrlSetTextColor _color;
(_dlgVector displayCtrl 1318) ctrlSetTextColor _color;
(_dlgVector displayCtrl 1319) ctrlSetTextColor _color;
(_dlgVector displayCtrl 1321) ctrlSetTextColor _color;
(_dlgVector displayCtrl 1322) ctrlSetTextColor _color;
(_dlgVector displayCtrl 1323) ctrlSetTextColor _color;
(_dlgVector displayCtrl 1324) ctrlSetTextColor _color;

GVAR(illuminate) = _this select 0;

_this call FUNC(illuminate);
