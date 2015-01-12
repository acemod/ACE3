/**
 * fn_removeSelectMenu_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#define START_IDC 		260
#define NUMBER_OF_IC	9


private ["_deviceName","_display"];
_deviceName = _this select 0;
_display = uiNamespace getvariable _deviceName;

for [{_i=START_IDC},{_i < START_IDC + NUMBER_OF_IC},{_i=_i+1}] do {
	(_display displayCtrl _i) ctrlSetPosition [0,0,0,0];
	(_display displayCtrl _i) ctrlCommit 0;
};
