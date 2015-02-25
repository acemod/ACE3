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

[_logic, QGVAR(ENABLE_REVIVE), "enableFor" ] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(REVIVE_TIMER_MAX), "timer" ] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(REVIVE_NUMBER_MAX), "amountOf" ] call EFUNC(common,readSettingFromModule);

[
    {(((_this select 0) getvariable[QGVAR(ENABLE_REVIVE_SETDEAD),0]) > 0)}
] call FUNC(registerUnconsciousCondition);
