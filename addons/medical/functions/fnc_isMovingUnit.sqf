/**
 * fnc_isMovingUnit.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private "_unit";
_unit = _this select 0;

(!(isNull(_unit getvariable [QGVAR(carrying),objNull])) || !(isNull(_unit getvariable [QGVAR(dragging),objNull])))
