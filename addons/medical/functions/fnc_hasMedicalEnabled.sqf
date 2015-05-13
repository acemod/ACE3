/**
 * fn_hasMedicalEnabled.sqf
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
if (isnil "_medicalEnabled") exitwith {
    (((GVAR(enableFor) == 0 && (isPlayer _unit || (_unit getvariable [QEGVAR(common,isDeadPlayer), false])))) || (GVAR(enableFor) == 1));
};

_medicalEnabled;
