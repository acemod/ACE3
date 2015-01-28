#include "script_component.hpp"

if (_this < 0 || _this > (count cse_ab_ATragMX_gunList) - 1) exitWith {};

cse_ab_ATragMX_workingMemory set [cse_ab_ATragMX_currentTarget, +(cse_ab_ATragMX_gunList select _this)];
cse_ab_ATragMX_currentGun set [cse_ab_ATragMX_currentTarget, _this];

lbSetCurSel [6000, (cse_ab_ATragMX_currentGun select cse_ab_ATragMX_currentTarget)];

if ((cse_ab_ATragMX_scopeUnits select (cse_ab_ATragMX_currentScopeUnit select cse_ab_ATragMX_currentTarget)) != "Clicks") then
{
	cse_ab_ATragMX_currentScopeUnit set [cse_ab_ATragMX_currentTarget, (cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) select 6];
};

call cse_ab_ATragMX_fnc_update_gun;

cse_ab_ATragMX_elevationOutput set [cse_ab_ATragMX_currentTarget, 0];
cse_ab_ATragMX_windageOutput set [cse_ab_ATragMX_currentTarget, 0];
cse_ab_ATragMX_leadOutput set [cse_ab_ATragMX_currentTarget, 0];
cse_ab_ATragMX_tofOutput set [cse_ab_ATragMX_currentTarget, 0];
cse_ab_ATragMX_velocityOutput set [cse_ab_ATragMX_currentTarget, 0];

call cse_ab_ATragMX_fnc_update_result;
