/**
 * fn_playerStartConverationWith_AIM.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_target", "_caller", "_civilian", "_array","_position","_textFromCiv"];
_target = _this select 0;
_caller = _this select 1;

[_this] call cse_fnc_debug;
disableSerialization;
CSE_AIM_DIALOG_INTERACTION_TARGET_AIM = _target;
createDialog "cse_dialog_menu_aim";
[_target] spawn cse_fnc_fillDialogWithConversationLines_AIM;

if (count (_target getvariable ["cse_profile_information_aim",[]]) == 0) then {
	//[_target] call cse_fnc_generateProfileInformation_AIM;
	[[_target], "cse_fnc_generateProfileInformation_AIM", false, false] call BIS_fnc_MP;
};

lbadd [400, localize "STR_CSE_DIALOG_MEET_AND_GREET" ];
lbadd [400, localize "STR_CSE_DIALOG_ASK_ABOUT_OCCUPATION" ];
lbadd [400, localize "STR_CSE_DIALOG_ASK_ABOUT_STANCE" ];
lbadd [400, localize "STR_CSE_DIALOG_ASK_ABOUT_HOME" ];
lbadd [400, localize "STR_CSE_DIALOG_ASK_ABOUT_CULTURE" ];
lbadd [400, localize "STR_CSE_DIALOG_ASK_ABOUT_DOB" ];
lbadd [400, localize "STR_CSE_DIALOG_ASK_ABOUT_INTEL" ];
lbadd [400, localize "STR_CSE_DIALOG_ASK_ABOUT_ENEMY" ];
// lbadd [400, localize "STR_CSE_DIALOG_GIVE_MONEY" ];
// lbadd [400, localize "STR_CSE_DIALOG_GIVE_AID_PACKAGE" ];
// lbadd [400, localize "STR_CSE_DIALOG_OFFER_MEDICAL_AID" ];
lbSetCurSel [400, 0];

ctrlSetText[12, "Name: "+ ([_target] call cse_fnc_getName)];

[_target] spawn {
	_target = _this select 0;
	[[_target,"Stop"],"cse_fnc_dialogMovementOrder_AIM",_target, false] spawn BIS_fnc_MP;
	waituntil {!dialog};
	[[_target,"Move"],"cse_fnc_dialogMovementOrder_AIM",_target, false] spawn BIS_fnc_MP;
};