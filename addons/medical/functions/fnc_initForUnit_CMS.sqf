/**
 * fn_initForUnit_CMS.sqf
 * @Descr: Deprecated. Is no longer used, as we dropped init eventhandler methods.
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_unit","_handler"];
_unit = _this select 0;

systemChat format["Initalizing CMS for %1", _this];
diag_log format["Initalizing CMS for %1", _this];

if (!local _unit) exitwith {};
if !(_unit isKindOf "CAManBase") exitwith{};

_unit addEventhandler["handleDamage", {
	if ((missionNamespace getvariable[QGVAR(setting_AdvancedLevel), 0]) >= 0) then {
		call FUNC(handleDamage);
	};
}];

_unit addEventHandler["handleHeal", {
	if ((missionNamespace getvariable[QGVAR(setting_AdvancedLevel), 0]) >= 0) then {
		call FUNC(handleHeal_CMS)
	};
}];

systemChat format["Finished Initalizing CMS for %1", _this];
diag_log format["Finished Initalizing CMS for %1", _this];
