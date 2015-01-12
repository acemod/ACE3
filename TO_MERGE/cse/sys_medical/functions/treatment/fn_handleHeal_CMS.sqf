/**
 * fn_handleHeal_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit",'_healer'];
_unit = _this select 0;
_healer = _this select 1;

if (!(isPlayer _healer) && CSE_ALLOW_AI_FULL_HEAL_CMS && !([_unit] call cse_Fnc_isUnconscious)) then {
	[_unit, "cse_openWounds",[[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]] call cse_fnc_setVariable;
	[_unit, "cse_bandagedWounds",[[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]] call cse_fnc_setVariable;

	if (_unit != _healer) then {
		[_unit,"STR_CSE_CMS_BANDAGED","STR_CSE_CMS_IS_BANDAGING_YOU", 0, [[_healer] call cse_fnc_getName]] call cse_fnc_sendDisplayMessageTo;
	};
	[_unit,"treatment",format["%1 has patched up the patient",[_healer] call cse_fnc_getName]] call cse_fnc_addActivityToLog_CMS;
};

true;