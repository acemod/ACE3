/**
 * fn_fillDialogWithConversationLines_AIM.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_display","_target","_list","_conversation"];
_target = [_this, 0, objNull, [objNull]] call BIS_fnc_Param;

disableSerialization;
_display = uiNamespace getvariable "cse_dialog_menu_aim";
_list = _display displayCtrl 200;

while {dialog} do {

	lbClear 200;
	_conversation = _target getvariable ["cse_dialog_recorded_conversation_aim",[]];
	{
		_list lbAdd format["%1:",(_x select 0)];
		_list lbAdd (_x select 1); // should localize here!
	}foreach _conversation;

	uisleep 0.1; // got to put this in a oneachframe EH instead!
};
