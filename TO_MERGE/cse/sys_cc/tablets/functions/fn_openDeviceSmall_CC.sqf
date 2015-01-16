/**
 * fn_openDeviceSmall_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

_this spawn {
if (isnil 'CSE_CC_BFT_LOOP_CC') then {
	CSE_CC_BFT_LOOP_CC = false;
};
waituntil {!CSE_CC_BFT_LOOP_CC};


	_deviceName = "cse_view_small";
	CSE_CURRENT_DEVICE_NAME_CC = _deviceName;
	CSE_SMALL_SCREEN_DISPLAY_CC = true;
	("CSE_BFT_SMALL_LAYER" call BIS_fnc_rscLayer) cutRsc [_deviceName,"PLAIN",0];
	[_deviceName] spawn cse_fnc_displayBFT_CC;
	//[_deviceName,"top"] call cse_fnc_setNavBar_CC;
	[_deviceName,"main","full"] call cse_fnc_setMap_CC;

	disableSerialization;
	_display = uiNamespace getvariable _deviceName;
	_ctrl = (_display displayCtrl 10);
	_ctrl ctrlSetBackgroundColor [1, 1, 1, 0];
	_ctrl ctrlCommit 0;
	while {(!dialog && alive player)} do {
		_pos = getPos player;
		_pos set [1, (_pos select 1) + 300];
		_pos set [0, (_pos select 0) - 350];
		_ctrl ctrlMapAnimAdd [0, 0.3, _pos];
		ctrlMapAnimCommit _ctrl;
	};
	("CSE_BFT_SMALL_LAYER" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
	CSE_SMALL_SCREEN_DISPLAY_CC = false;
};