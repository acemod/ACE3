/**
 * fnc_initalizeModule.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

if (!hasInterface) exitwith {}; // No need for this module on HC or dedicated server.

private ["_logic"];
_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if (!isNull _logic) then {
	[_logic, QGVAR(EnableForAI), "forAI" ] call EFUNC(common,readBooleanParameterFromModule);
};