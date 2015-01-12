/**
 * fn_monitorIEDs_IEDS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_activated"];
if !(isnil "CSE_MONITORING_IEDS") exitwith {};
CSE_MONITORING_IEDS = true;
sleep 1;
if (isnil "CSE_MASTER_IED_COLLECTION") then {
	CSE_MASTER_IED_COLLECTION = [];
};
_code = '
	{
		_activated = false;
		if !([_x] call cse_fnc_checkIEDActivated_IEDS) then {
			{
				if ([_x] call cse_fnc_checkIEDActivated_IEDS) exitwith { _activated = true;};
			}foreach (_x getvariable ["cse_iedCollection", []]);
		} else {
			_activated = true;
		};
		if (_activated) exitwith {
			CSE_MASTER_IED_COLLECTION deleteAt _foreachIndex;
		};
		false;
	}count CSE_MASTER_IED_COLLECTION;

	false;';

cse_sys_ieds_monitorIEDs_Trigger = createTrigger["EmptyDetector", [0,0,0]];
cse_sys_ieds_monitorIEDs_Trigger setTriggerActivation ["NONE", "PRESENT", true];
cse_sys_ieds_monitorIEDs_Trigger setTriggerTimeout [0, 0, 0, false];
cse_sys_ieds_monitorIEDs_Trigger setTriggerStatements[_code, "", ""];

