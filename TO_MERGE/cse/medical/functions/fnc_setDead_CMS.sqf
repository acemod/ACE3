/**
 * fn_setDead_CMS.sqf
 * @Descr: Set a unit dead from within CMS.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: void
 * @PublicAPI: true
 */

private ["_unit"];
_unit = _this select 0;

if (!alive _unit) exitwith{};
if (!local _unit) exitwith {};

[_unit, QGVAR(amountOfPain),0,true] call EFUNC(common,setDefinedVariable);
[_unit, QGVAR(heartRate),0,true] call EFUNC(common,setDefinedVariable);
[_unit, QGVAR(bloodPressure), [0,0],true] call EFUNC(common,setDefinedVariable);
[_unit, QGVAR(airway), 3, true] call EFUNC(common,setDefinedVariable);

[_unit] call EFUNC(common,setDead); // calling framework function