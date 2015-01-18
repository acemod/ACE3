/**
 * fn_moduleEnableBasicRevive.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_logic"];
_logic = _this select 0;

GVAR(Module) = true;

[_logic, QGVAR(ENABLE_REVIVE_F), "enableFor" ] call EFUNC(common,readNumericParameterFromModule);
[_logic, QGVAR(REVIVE_TIMER_MAX_F), "timer" ] call EFUNC(common,readNumericParameterFromModule);
[_logic, QGVAR(REVIVE_NUMBER_MAX_F), "amountOf" ] call EFUNC(common,readNumericParameterFromModule);

[
    {(((_this select 0) getvariable[QGVAR(ENABLE_REVIVE_SETDEAD_F),0]) > 0)}
] call FUNC(registerUnconsciousCondition);
