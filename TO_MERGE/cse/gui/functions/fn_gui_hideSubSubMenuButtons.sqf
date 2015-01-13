/**
 * fn_gui_hideSubSubMenuButtons.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_rootButton","_allMenuEntries","_allAvailableMainButtons","_selectedMainMenuButton","_interactionDialog","_position","_placeEntry"];
disableSerialization;
_interactionDialog = uiNamespace getvariable "cse_interactionGUI";

_allAvailableMainButtons = 20;
_selectedMainMenuButton = 301;

//if (((ctrlPosition (_interactionDialog displayCtrl _selectedMainMenuButton))select 0) == (0.4 + 0.26)) then {

	_position = [100,100];
	(_interactionDialog displayCtrl 113) ctrlSetPosition [_position select 0,(_position select 1) - 0.045];
	(_interactionDialog displayCtrl 113) ctrlCommit 0;
		for [{_x=0},{_x < _allAvailableMainButtons},{_x=_x+1}] do
		{
			private ["_entry"];
			_entry = (_interactionDialog displayCtrl _selectedMainMenuButton);
			_entry ctrlSetPosition _position;
			_entry ctrlRemoveAllEventHandlers "ButtonClick";
			_entry ctrlCommit 0;
			_selectedMainMenuButton = _selectedMainMenuButton +1;
		};
//};