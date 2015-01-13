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

if (!(isPlayer _healer) && CSE_ALLOW_AI_FULL_HEAL_CMS && !([_unit] call EFUNC(common,isUnconscious))) then {
	[_unit, QGVAR(openWounds),[[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]] call EFUNC(common,setDefinedVariable);
	[_unit, QGVAR(bandagedWounds),[[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]] call EFUNC(common,setDefinedVariable);

	if (_unit != _healer) then {
		[_unit,"STR_ACE_CMS_BANDAGED","STR_ACE_CMS_IS_BANDAGING_YOU", 0, [[_healer] call EFUNC(common,getName)]] call EFUNC(common,sendDisplayMessageTo);
	};
	[_unit,"treatment",format["%1 has patched up the patient",[_healer] call EFUNC(common,getName)]] call FUNC(addActivityToLog_CMS);
};

true;