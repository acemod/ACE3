/**
 * fn_monitorPlayerIEDs_IEDS.sqf
 * @Descr: Checks player placed pressure plate IEDs
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


private ["_activated"];
if !(isnil "CSE_MONITORING_PLAYER_IEDS") exitwith {};
CSE_MONITORING_PLAYER_IEDS = true;
sleep 1;
if (isnil "CSE_PLAYER_PLACED_PRESSURE_IEDS_IEDS") then {
	CSE_PLAYER_PLACED_PRESSURE_IEDS_IEDS = [];
};

[format["CSE_MONITORING_PLAYER_IEDS"]] call cse_fnc_debug;
_code = '
	{
		_activated = false;
		if ([_X] call cse_fnc_checkPressurePlateActivated_IEDS) then {
			_activated = true;
			[_x] call cse_fnc_onIEDActivated_IEDS;
		};
		if (_activated || isNull _x) exitwith {
			CSE_PLAYER_PLACED_PRESSURE_IEDS_IEDS deleteAt _foreachIndex;
		};
		false;
	}count CSE_PLAYER_PLACED_PRESSURE_IEDS_IEDS;
';


cse_sys_ieds_monitorPlayerIEDs_Trigger = createTrigger["EmptyDetector", [0,0,0]];
cse_sys_ieds_monitorPlayerIEDs_Trigger setTriggerActivation ["NONE", "PRESENT", true];
cse_sys_ieds_monitorPlayerIEDs_Trigger setTriggerTimeout [0, 0, 0, false];
cse_sys_ieds_monitorPlayerIEDs_Trigger setTriggerStatements[_code, "", ""];

