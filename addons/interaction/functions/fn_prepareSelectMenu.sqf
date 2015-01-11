/*
	Name: AGM_Interaction_fnc_prepareSelectMenu
	
	Author: Garth de Wet (LH)
	
	Description:
		Prepares the select menu for use.
	
	Parameters: 
		0: TEXT - Header text
		1: TEXT - Approve button text
	
	Returns:
		ARRAY/NUMBER - container object for use with AddSelectableItem.
	
	Example:
		["Select Explosive", "Place"] call AGM_Interaction_fnc_prepareSelectMenu;
*/
private ["_buttonAction", "_header", "_buttonText", "_cancelButton"];
closeDialog 0;
if (!(profileNamespace getVariable ["AGM_Interaction_FlowMenu", false])) exitWith {
	_header = _this select 0;
	_buttonText = _this select 1;
	if (isNil "_buttonText" or {_buttonText == ""}) then {
		_buttonText = localize "STR_AGM_Interaction_MakeSelection";
	};
	createDialog "RscAGM_SelectAnItem";
	ctrlSetText [8860, _buttonText];
	ctrlSetText [8870, _header];

	lbClear 8866;

	8866
};
[]
