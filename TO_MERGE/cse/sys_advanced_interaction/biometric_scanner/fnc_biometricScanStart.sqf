/*
	NAME: fnc_biometricScanner
	USAGE: opens the biometric Scanner dialog and starts up all functionality needed
	AUTHOR: Glowbal
	ARGUMENTS: OBJECT unit, OBJECT target , of type man
	RETURN: void
*/


	private ["_caller", "_cursor", "_interactionDialog", "_button1", "_button2", "_button3", "_textDisplays", "_infoDisplays", "_editableColums", "_positionCenter"];
	_caller = _this select 0;
	_cursor = _this select 1;
	CSE_biometricScannerTarget = _cursor;
ctrlSetText [100,"HIIDE - Scanning"];
	call cse_fnc_clearScreenBiometricScanner;

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



	_button1 ctrlSetEventHandler ["ButtonClick", format["[player,CSE_biometricScannerTarget] spawn cse_fnc_hiideMainMenu"]];

	// LOGIN FUNCTIONALITY
	_button1 ctrlSetText "Cancel";
	_button2 ctrlSetText "";
	_button3 ctrlSetText "";

	_positionCenter = [0.35,0.54];
	{
		_x ctrlSetPosition _positionCenter;
		_positionCenter = [_positionCenter select 0, (_positionCenter select 1) + 0.05];
	}foreach _textDisplays;
	(_interactionDialog displayCtrl 111) ctrlSetText "Scanning Database";
	(_interactionDialog displayCtrl 112) ctrlSetText "Please Wait";

	(_interactionDialog displayCtrl 111) ctrlCommit 0.0001;
	(_interactionDialog displayCtrl 112) ctrlCommit 0.0001;

	sleep 2 + random(10);
	if (!dialog) exitwith{};

	[player,CSE_biometricScannerTarget] call cse_fnc_biometricScannerInfo;