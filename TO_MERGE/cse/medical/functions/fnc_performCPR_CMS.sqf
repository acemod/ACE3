/**
 * fn_performCPR_CMS.sqf
 * @Descr: Start the CPR action from CMS. Caller unit will attempt to restart the targets heart using CPR.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT (The unit that cPR will be performed upon), caller OBJECT (The unit that does the CPR action)]
 * @Return: void
 * @PublicAPI: true
 */


private ["_caller","_unit"];
_unit = _this select 0;
_caller = _this select 1;
if (isnil QGVAR(playerIsProvidingCPR)) then {
	GVAR(playerIsProvidingCPR) = false;
};

[_this] call EFUNC(common,debug);
if (call FUNC(isSetTreatmentMutex_CMS)) exitwith {GVAR(playerIsProvidingCPR) = false;};
[_caller] call FUNC(treatmentMutex_CMS);

if (GVAR(playerIsProvidingCPR)) exitwith {
	[_caller,"You are already providing CPR"] call EFUNC(common,sendHintTo);
	[_caller,"release"] call FUNC(treatmentMutex_CMS);
	GVAR(playerIsProvidingCPR) = false; // stop giving CPR
};

if (_unit == _caller) exitwith{[_caller,"You cannot give yourself CPR"] call EFUNC(common,sendHintTo); [_caller,"release"] call FUNC(treatmentMutex_CMS);};

	//_name = _unit getvariable ["cse_nameUnit",[_unit] call EFUNC(common,getName)];
[_caller,"You start providing CPR"] call EFUNC(common,sendHintTo);

[_this, QUOTE(FUNC(performCPRLocal_CMS)), _unit, false] spawn BIS_fnc_MP;
