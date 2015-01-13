/*
	NAME: fnc_biometricScanner
	USAGE: opens the biometric Scanner dialog and starts up all functionality needed
	AUTHOR: Glowbal
	ARGUMENTS: OBJECT unit, OBJECT target , of type man
	RETURN: void
*/


	private ["_caller","_cursor"];
	_caller = _this select 0;
	_cursor = _this select 1;

	call cse_fnc_clearScreenBiometricScanner;

		ctrlSetText [100,"HIIDE - Details"];


	disableSerialization;
	_interactionDialog = uiNamespace getvariable "cse_biometricScanner";

	_button1 = (_interactionDialog displayCtrl 151);
	_button2 = (_interactionDialog displayCtrl 152);
	_button3 = (_interactionDialog displayCtrl 153);

	// adjusting positions:
	_textDisplays = [(_interactionDialog displayCtrl 111),(_interactionDialog displayCtrl 112)];
	_infoDisplays = [(_interactionDialog displayCtrl 121),(_interactionDialog displayCtrl 122),(_interactionDialog displayCtrl 123),
					(_interactionDialog displayCtrl 124),(_interactionDialog displayCtrl 125)];
	_editableColums = [(_interactionDialog displayCtrl 701),(_interactionDialog displayCtrl 702),(_interactionDialog displayCtrl 703),
					(_interactionDialog displayCtrl 704),(_interactionDialog displayCtrl 705)];



	_button1 ctrlSetEventHandler ["ButtonClick", format["[player,CSE_biometricScannerTarget] spawn cse_fnc_hiideMainMenu"]]; // logout
	_button3 ctrlSetEventHandler ["ButtonClick", format["[player,CSE_biometricScannerTarget] spawn cse_fnc_saveSettingsBiometric"]]; // scan something

	// LOGIN FUNCTIONALITY
	_button1 ctrlSetText "Cancel";
	_button2 ctrlSetText "";
	_button3 ctrlSetText "Save";

	_counter = 0;
	_leftText = ["Name","DOB","Known Info","Additional"];
	_positionCenter = [0.3,0.54];
	{
		if (_counter < count _leftText) then {
			_x ctrlSetPosition _positionCenter;
			_positionCenter = [_positionCenter select 0, (_positionCenter select 1) + 0.05];
			_x ctrlCommit 0.0001;
			_x ctrlSetText (_leftText select _counter);
		};
		_counter = _counter + 1;
	}foreach _infoDisplays;

	_text = _cursor getvariable "cse_biometricScannerInfo";
	if (!isnil ("_text")) then {
		ctrlSetText [701, _text select 0];
		ctrlSetText [702,_text select 1];
		ctrlSetText [703,_text select 2];
		ctrlSetText [704,_text select 3];
		ctrlSetText [705,_text select 4];
		ctrlSetText [101,"Entry in database found"];
	} else {
		ctrlSetText [101,"No Entry in database found - Please fill in details"];
	};

	_counter = 0;
	_positionCenter = [0.42,0.58];
	{
		if (_counter < count _leftText) then {
			_x ctrlSetPosition _positionCenter;
			_positionCenter = [_positionCenter select 0, (_positionCenter select 1) + 0.05];
			_x ctrlCommit 0.0001;
		};
		_counter = _counter + 1;
	}foreach _editableColums;
