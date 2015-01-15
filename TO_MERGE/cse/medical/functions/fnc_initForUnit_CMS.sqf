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
if (!local _unit) exitwith {};
if !(_unit isKindOf "CAManBase") exitwith{};

_unit addEventhandler["handleDamage", {
	if ((missionNamespace getvariable[QGVAR(setting_AdvancedLevel), 0]) > 0) then {
		call FUNC(handleDamage_CMS);
	} else {
		// TODO call BASIC MEDICAL SYSTEM
		// call FUNC(handleDamage_Basic);
	};
}];

_unit addEventHandler["handleHeal", FUNC(handleHeal_CMS)];
