// by commy2

private ["_object", "_actions", "_dlgInteractionDialog", "_ctrlInteractionDialog", "_index", "_ctrlInteractionDialogIcon"];

_object = AGM_Interaction_Target;
_actions = AGM_Interaction_Buttons;


disableSerialization;
_dlgInteractionDialog = uiNamespace getVariable "AGM_Interaction_Dialog";

/*
for "_a" from 0 to (_count - 1) do {
	_action = AGM_Interaction_Buttons select _a;

	_ctrlInteractionDialog = _dlgInteractionDialog displayCtrl (10 + _a);
	_ctrlInteractionDialog ctrlShow true;
	_ctrlInteractionDialog ctrlSetText (_action select 0);
	_ctrlInteractionDialog ctrlEnable (call (_action select 2));
};
*/

_ctrlInteractionDialog = _dlgInteractionDialog displayCtrl 3;

AGM_Interaction_MainButton = "(findDisplay 1713999) closeDisplay 1;";

if (_object isKindOf "Man") then {
	_ctrlInteractionDialog ctrlSetText (if (alive _object) then {name _object} else {_object getVariable ["AGM_Name", "Unknown"]});
} else {
	_ctrlInteractionDialog ctrlSetText (getText (configFile >> "CfgVehicles" >> typeOf _object >> "displayName"));
};

for "_index" from 0 to 9 do {
	_ctrlInteractionDialog = _dlgInteractionDialog displayCtrl (10 + _index);
	_ctrlInteractionDialog ctrlShow true;

	_ctrlInteractionDialogIcon = _dlgInteractionDialog displayCtrl (20 + _index);

	if (_index < _count) then {
		_action = AGM_Interaction_Buttons select _index;
		_ctrlInteractionDialog ctrlSetText (_action select 0);
		_ctrlInteractionDialog ctrlEnable (call (_action select 2));

		_ctrlInteractionDialogIcon ctrlSetText (_action select 5);
	} else {
		_ctrlInteractionDialog ctrlSetText "";
		_ctrlInteractionDialog ctrlEnable false;

		_ctrlInteractionDialogIcon ctrlSetText "";
	};
};
