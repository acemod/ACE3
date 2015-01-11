/*
	Name: AGM_Interaction_fnc_openSelectMenu

	Author: Garth de Wet (LH)

	Description:
		Opens the select menu UI and sets up the UI

	Parameters:
		0: ARRAY - items
			ARRAY
				0 = Text
				1 = statement to execute
				2 = condition before execute
				3 = showDisabled
				4 = priority
				5 = icon
				6 = extra variables. Passed to the code.
		1: Code - select action
		2: Code - Cancel Action
	Returns:
		Nothing

	Example:
*/
if (!(profileNamespace getVariable ["AGM_Interaction_FlowMenu", false])) then {
	AGM_Interaction_SelectAccept = _this select 1;
	AGM_Interaction_SelectCancel = _this select 2;
	buttonSetAction [8855, "call AGM_Interaction_SelectCancel;"]; // cancel
	buttonSetAction [8860, "(call compile (lbData [8866, lbCurSel 8866])) call AGM_Interaction_SelectAccept;"]; // accept
	lbSetCurSel [8866, 0];
}else{
	_customActions = _this select 0;
	_count = count _customActions;
	if (_count == 0) exitWith {};
	_customActions call AGM_Interaction_fnc_sortOptionsByPriority;
	for "_i" from 0 to _count -1 do {
		_action = _customActions select _i;
		_action set [1, (_this select 1)];
	};
	AGM_Interaction_Buttons = _customActions;
	[(_this select 2), true, true, false, AGM_player] call AGM_Interaction_fnc_initialiseInteraction;
};
