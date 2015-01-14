/**
 * fn_treatmentMutex_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: [client OBJECT, action STRING ("release" releases the mutex if it has been set. "set" for setting the mutex)]
 * @Return: void
 * @PublicAPI: false
 */

private ["_client","_action"];
_client = _this select 0;

if (!local _client) exitwith {
	[_this, QUOTE(FUNC(treatmentMutex_CMS)), _client, false] spawn BIS_fnc_MP;
};
if (isnil QGVAR(PerformingTreatmentMutex)) then {
	GVAR(PerformingTreatmentMutex) = false;
};
if (count _this > 1) exitwith {
	_action = _this select 1;
	if (_action == "release" || _action == "RELEASE") then {
		["RELEASING TREATMENT MUTEX"] call EFUNC(common,debug);
		GVAR(PerformingTreatmentMutex) = false;
	} else {
		waituntil {!GVAR(PerformingTreatmentMutex)};
		GVAR(PerformingTreatmentMutex) = true;
		["SETTING TREATMENT MUTEX 2"] call EFUNC(common,debug);
	};
};
waituntil {!GVAR(PerformingTreatmentMutex)};
GVAR(PerformingTreatmentMutex) = true;
["SETTING TREATMENT MUTEX 1"] call EFUNC(common,debug);