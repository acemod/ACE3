/**
 * fnc_addToInjuredCollection.sqf
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
if !(local _unit) exitwith{
    [[_unit], QUOTE(FUNC(addToInjuredCollection)), _unit] call EFUNC(common,execRemoteFnc);
};

if !(_unit getvariable[QGVAR(addedToUnitLoop),false]) then{
    _unit setvariable [QGVAR(addedToUnitLoop),true, true];
};

if ([_unit] call FUNC(hasMedicalEnabled)) then {
    if (isnil QGVAR(injuredUnitCollection)) then {
        GVAR(injuredUnitCollection) = [];
    };
    if (_unit in GVAR(injuredUnitCollection)) exitwith {};
    GVAR(injuredUnitCollection) pushback _unit;
} else {
    systemChat format["has no medical system enabled: %1",_unit];
};
