/**
 * fn_getActivityLog_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private["_unit"];
_unit = _this select 0;
_log = [_unit,QGVAR(activityLog)] call EFUNC(common,getDefinedVariable);

if (isnil "_log") then {
	_log = [];
};
if (typeName _log != typeName []) then {
	_log = [];
};
_log
