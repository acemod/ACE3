#include "script_component.hpp"

private["_unit"];
_unit = _this select 0;
if (!local _unit) exitwith {};
[_unit, QGVAR(amountOfPain),0,true] call EFUNC(common,setDefinedVariable);
[_unit, QGVAR(heartRate),0,true] call EFUNC(common,setDefinedVariable);
[_unit, QGVAR(bloodPressure), [0,0],true] call EFUNC(common,setDefinedVariable);
if (_unit getvariable[QEGVAR(common,unconscious_non_captive),false]) then {
    _unit setCaptive false;
    _unit setvariable[QEGVAR(common,unconscious_non_captive),nil];
};