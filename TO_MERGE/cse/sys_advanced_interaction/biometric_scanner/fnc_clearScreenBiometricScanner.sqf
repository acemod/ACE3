
/**
 * fnc_clearScreenBiometricScanner.sqf
 * @Descr: Clears the screen on the biometric scanner of all ctrl objects
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return: nil
 * @PublicAPI: false
 */


private ["_interactionDialog","_button1","_button2","_button3","_textDisplays","_infoDisplays","_editableColums"];

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

_position = [100.0,100.0];
{
	_x ctrlsetText "";
	_x ctrlSetPosition _position;
	_x ctrlCommit 0;
}foreach _textDisplays;
{
	_x ctrlSetPosition _position;
	_x ctrlsetText "";
	_x ctrlCommit 0;

}foreach _infoDisplays;
{
	_x ctrlsetText "";
	_x ctrlSetPosition _position;
	_x ctrlCommit 0;
}foreach _editableColums;

_button1 ctrlRemoveAllEventHandlers "ButtonClick";
_button2 ctrlRemoveAllEventHandlers "ButtonClick";
_button3 ctrlRemoveAllEventHandlers "ButtonClick";
_button1 ctrlSetText "";
_button2 ctrlSetText "";
_button3 ctrlSetText "";
ctrlSetText [101,""];