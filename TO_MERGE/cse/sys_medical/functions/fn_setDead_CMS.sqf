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

[_unit, "cse_pain",0,true] call cse_fnc_setVariable;
[_unit, "cse_heartRate",0,true] call cse_fnc_setVariable;
[_unit, "cse_bloodPressure", [0,0],true] call cse_fnc_setVariable;
[_unit, "cse_airway", 3, true] call cse_fnc_setVariable;

[_unit] call cse_fnc_setDead; // calling framework function