/**
 * fn_hasMedicalEnabled_CMS.sqf
 * @Descr: Check if unit has CMS enabled.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: BOOL
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_unit", "_medicalEnabled"];
_unit = _this select 0;

_medicalEnabled = _unit getvariable QGVAR(enableMedical);
if (isnil "_medicalEnabled") then {
	(((GVAR(setting_enableForUnits) == 0 && (isPlayer _unit || (_unit getvariable [QEGVAR(common,isDeadPlayer), false])))) || (GVAR(setting_enableForUnits) == 1));
} else {
	_medicalEnabled;
};
