
private ["_args", "_entries"];
_args =  _this;
CSE_SYS_GESTURES_ALLOW_AI_CONTROL = false;
{
	if (_x select 0 == "allowAIControl") then {
		CSE_SYS_GESTURES_ALLOW_AI_CONTROL = (_x select 1);
	};
}foreach _args;
waituntil {!isnil "cse_gui"};

cse_displayGestureActions_GroupMenu_GESTURES = {
	[ _this select 3,
		[
			[localize "STR_CSE_GESTURE_FREEZE_SHORT", "cse\cse_sys_gestures\data\icons\icon_hand.paa", {closeDialog 0; [player, "gestureFreeze"] call cse_fnc_playGesture}, true, localize "STR_CSE_GESTURE_FREEZE_TOOLTIP"],
			[localize "STR_CSE_GESTURE_FOLLOW_SHORT", "cse\cse_sys_gestures\data\icons\icon_hand.paa", {closeDialog 0; [player, "gestureFollow"] call cse_fnc_playGesture}, true, localize "STR_CSE_GESTURE_FOLLOW_TOOLTIP"],
			[localize "STR_CSE_GESTURE_CEASEFIRE_SHORT", "cse\cse_sys_gestures\data\icons\icon_hand.paa", {closeDialog 0; [player, "gestureCeaseFire"] call cse_fnc_playGesture}, true, localize "STR_CSE_GESTURE_CEASEFIRE_TOOLTIP"],
			[localize "STR_CSE_GESTURE_COVER_SHORT", "cse\cse_sys_gestures\data\icons\icon_hand.paa", {closeDialog 0; [player, "gestureCover"] call cse_fnc_playGesture}, true, localize "STR_CSE_GESTURE_COVER_TOOLTIP"],
			[localize "STR_CSE_GESTURE_GO_SHORT", "cse\cse_sys_gestures\data\icons\icon_hand.paa", {closeDialog 0; [player, "gestureGo"] call cse_fnc_playGesture}, true, localize "STR_CSE_GESTURE_GO_TOOLTIP"],
			[localize "STR_CSE_GESTURE_POINT_SHORT", "cse\cse_sys_gestures\data\icons\icon_hand.paa", {closeDialog 0; [player, "gesturePoint"] call cse_fnc_playGesture}, true, localize "STR_CSE_GESTURE_POINT_TOOLTIP"]
		],
		_this select 1, CSE_SELECTED_RADIAL_OPTION_N_GUI, true
	] call cse_fnc_openRadialSecondRing_GUI;
};

_entries = [
	[localize "STR_CSE_GESTURE_GESTUREACTION_SHORT", {([player] call cse_fnc_canInteract)}, "cse\cse_sys_gestures\data\icons\icon_hand.paa", cse_displayGestureActions_GroupMenu_GESTURES, localize "STR_CSE_GESTURE_GESTUREACTION_TOOLTIP"]
];

["ActionMenu","group_actions", _entries ] call cse_fnc_addMultipleEntriesToRadialCategory_F;


_playCondition = {
	(((_this select 0) getvariable ["cse_playGesture_GRP", ""]) != "");
};

_playOnDraw = {
	_var = (_this select 0) getvariable ["cse_playGesture_GRP", ""];

	switch (_gesture) do {
		case ("gestureCeaseFire"): {

		};
		case ("gestureCover"): {

		};
		case ("gestureFreeze"): {

		};
		case ("gestureFollow"): {

		};
		case ("gestureGo"):	{

		};
		case ("gesturePoint"): {

		};
	};

	["cse\cse_sys_gestures\data\icons\icon_hand.paa", [1,1,1,1]];
};

if (["cse_sys_tags"] call cse_fnc_isModLoaded_f) then {
	[_playCondition, _playOnDraw, 1] call cse_fnc_registerIconSet_TAGS;
};