/**
 * fn_removeOptionField_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#define START_LABEL_IDC 	 	40;
#define START_LB_IDC		 	50;
#define START_BUTTON_IDC		60;


private ["_deviceName","_pos","_return","_ctrl"];
_deviceName = _this select 0;
_pos = _this select 1;
_ctrl = [_deviceName,_pos] call cse_fnc_getOptionFieldOnPos_CC;
_ctrl ctrlSetPosition [0,0,0,0];
_ctrl ctrlCommit 0;

_ctrl