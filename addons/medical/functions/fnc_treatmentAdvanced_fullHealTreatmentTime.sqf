/**
 * fn_healTreatmentTime.sqf
 * @Descr: N/A
 * @Author: Ruthberg
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_target", "_totalDamage"];
_target = _this;
_totalDamage = 0;

{
    _totalDamage = _totalDamage + _x;
} forEach (_target getVariable [QGVAR(bodyPartStatus), []]);

(10 max (_totalDamage * 10) min 120)
