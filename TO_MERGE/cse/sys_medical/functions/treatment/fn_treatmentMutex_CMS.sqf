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
	[_this, "cse_fnc_treatmentMutex_CMS", _client, false] spawn BIS_fnc_MP;
};
if (isnil "CSE_PERFORMING_TREATMENT_CMS_MUTEX") then {
	CSE_PERFORMING_TREATMENT_CMS_MUTEX = false;
};
if (count _this > 1) exitwith {
	_action = _this select 1;
	if (_action == "release" || _action == "RELEASE") then {
		["RELEASING TREATMENT MUTEX"] call cse_fnc_debug;
		CSE_PERFORMING_TREATMENT_CMS_MUTEX = false;
	} else {
		waituntil {!CSE_PERFORMING_TREATMENT_CMS_MUTEX};
		CSE_PERFORMING_TREATMENT_CMS_MUTEX = true;
		["SETTING TREATMENT MUTEX 2"] call cse_fnc_debug;
	};
};
waituntil {!CSE_PERFORMING_TREATMENT_CMS_MUTEX};
CSE_PERFORMING_TREATMENT_CMS_MUTEX = true;
["SETTING TREATMENT MUTEX 1"] call cse_fnc_debug;