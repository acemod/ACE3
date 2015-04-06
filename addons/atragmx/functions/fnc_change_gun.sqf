#include "script_component.hpp"

if (_this < 0 || _this > (count GVAR(ATragMX_gunList)) - 1) exitWith {};

GVAR(ATragMX_workingMemory) set [GVAR(ATragMX_currentTarget), +(GVAR(ATragMX_gunList) select _this)];
GVAR(ATragMX_currentGun) set [GVAR(ATragMX_currentTarget), _this];

lbSetCurSel [6000, (GVAR(ATragMX_currentGun) select GVAR(ATragMX_currentTarget))];

if ((GVAR(ATragMX_scopeUnits) select (GVAR(ATragMX_currentScopeUnit) select GVAR(ATragMX_currentTarget))) != "Clicks") then
{
	GVAR(ATragMX_currentScopeUnit) set [GVAR(ATragMX_currentTarget), (GVAR(ATragMX_workingMemory) select GVAR(ATragMX_currentTarget)) select 6];
};

call compile preprocessFile ("\atragmx\fnc_update_gun.sqf");

GVAR(ATragMX_elevationOutput) set [GVAR(ATragMX_currentTarget), 0];
GVAR(ATragMX_windageOutput) set [GVAR(ATragMX_currentTarget), 0];
GVAR(ATragMX_leadOutput) set [GVAR(ATragMX_currentTarget), 0];
GVAR(ATragMX_tofOutput) set [GVAR(ATragMX_currentTarget), 0];
GVAR(ATragMX_velocityOutput) set [GVAR(ATragMX_currentTarget), 0];

call compile preprocessFile ("\atragmx\fnc_update_result.sqf");
