/*
	NAME: fnc_biometricScannerLoginScreen
	USAGE: checks if the username and password have been typed correctly
	AUTHOR: Glowbal
	ARGUMENTS: OBJECT unit, OBJECT target , of type man
	RETURN: void
*/

call cse_fnc_clearScreenBiometricScanner;
ctrlSetText [100,"HIIDE - Login"];
disableSerialization;
_interactionDialog = uiNamespace getvariable "cse_biometricScanner";
_button1 = (_interactionDialog displayCtrl 151);
_button2 = (_interactionDialog displayCtrl 152);
_button3 = (_interactionDialog displayCtrl 153);

_button1 ctrlSetEventHandler ["ButtonClick", "closedialog 21314"];
_button2 ctrlSetEventHandler ["ButtonClick", format["[player,CSE_biometricScannerTarget] spawn cse_fnc_hiideMainMenu"]];
_button3 ctrlSetEventHandler ["ButtonClick", format["[player,CSE_biometricScannerTarget] spawn cse_fnc_biometricScannerLogin"]];

// LOGIN FUNCTIONALITY
_button1 ctrlSetText "Cancel";
_button2 ctrlSetText "Iris Login";
_button3 ctrlSetText "Login";


(_interactionDialog displayCtrl 121) ctrlSetPosition [0.3,0.54];
(_interactionDialog displayCtrl 121) ctrlCommit 0.0001;
(_interactionDialog displayCtrl 121) ctrlSetText "Username";

(_interactionDialog displayCtrl 122) ctrlSetposition [0.3,0.59];
(_interactionDialog displayCtrl 122) ctrlCommit 0.0001;
(_interactionDialog displayCtrl 122) ctrlSetText "Password";

(_interactionDialog displayCtrl 701) ctrlSetposition [0.42,0.58];
(_interactionDialog displayCtrl 701) ctrlCommit 0.0001;

(_interactionDialog displayCtrl 702) ctrlSetposition [0.42,0.63];
(_interactionDialog displayCtrl 702) ctrlCommit 0.0001;