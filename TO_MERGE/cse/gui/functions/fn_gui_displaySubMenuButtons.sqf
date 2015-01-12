/**
 * fn_gui_displaySubMenuButtons.sqf
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
_rootButton = (_interactionDialog displayCtrl (_this select 1));
_allMenuEntries = _this select 2;

_headerNumber = 112;
_selectedMainMenuButton = 201;
_maxCtrlNumber = 215;
if ((_this select 1) > 200 && (_this select 1) < 300) then {
	_headerNumber = 113;
	_selectedMainMenuButton = 301;
	_maxCtrlNumber = 315;
};
_allAvailableMainButtons = 15;

//hint format ["ROOTBUTTON: %1",_rootButton];
_position = ctrlPosition _rootButton;
//_position = [(_position select 0) + 0.26, (_position select 1)];
_position = [(_position select 0) + 0.31, (_position select 1)];

CMS_GUI_LATEST_SUBMENU = _this;

	(_interactionDialog displayCtrl _headerNumber) ctrlSetText (_this select 0);
	(_interactionDialog displayCtrl _headerNumber) ctrlSetPosition [_position select 0,(_position select 1) - 0.040];
	//(_interactionDialog displayCtrl _headerNumber) ctrlSetBackgroundColor [0, 0, 0.6, 0.75];
	(_interactionDialog displayCtrl _headerNumber) ctrlSetBackgroundColor [(profilenamespace getvariable ['IGUI_BCG_RGB_R',0]),(profilenamespace getvariable ['IGUI_BCG_RGB_G',1]),(profilenamespace getvariable ['IGUI_BCG_RGB_B',1]), 0.75];
	(_interactionDialog displayCtrl _headerNumber) ctrlSetBackgroundColor [(profilenamespace getvariable ['GUI_BCG_RGB_R',0]),(profilenamespace getvariable ['GUI_BCG_RGB_G',1]),(profilenamespace getvariable ['GUI_BCG_RGB_B',1]), 0.75];
	(_interactionDialog displayCtrl _headerNumber) ctrlCommit 0;


CSE_UI_EFFECT = true; // temp enabled
	_placeEntry = {
				private ["_entry"];
				_entry = (_interactionDialog displayCtrl _selectedMainMenuButton);
				_entry ctrlSetText ( (_x select 0));
				_entry ctrlSetPosition _position;
				if (_selectedMainMenuButton < 300) then {
					_entry ctrlSetEventHandler ["ButtonClick", format["call cse_fnc_gui_hideSubSubMenuButtons;[player,CSE_interactionTarget,%2] call %1; call cse_fnc_gui_refreshLastSubMenu;",(_x select 2),_selectedMainMenuButton]];
				} else {
					_entry ctrlSetEventHandler ["ButtonClick", format["[player,CSE_interactionTarget,%2] call %1; call cse_fnc_gui_refreshLastSubMenu;",(_x select 2),_selectedMainMenuButton]];
				};
				if (isnil "CSE_UI_EFFECT") then {
					_entry ctrlCommit 0;
				} else {
					if (CSE_UI_EFFECT) then {
						_entry ctrlCommit 0.2;
					} else {
						_entry ctrlCommit 0;
					};
				};
				// updating new information
				_position = [(_position select 0), (_position select 1) + 0.040];
				_selectedMainMenuButton = _selectedMainMenuButton + 1;
	};

	_returningEntries = [];
		{
		if ((typeName (_x select 1)) == "CODE") then {
			if ([player,CSE_interactionTarget] call (_x select 1)) then {
				_returningEntries set[count _returningEntries,_x];
			};
		} else {
			if ((typeName (_x select 1)) == "BOOL") then {
				if (_x select 1) then {
					_returningEntries set[count _returningEntries,_x];
				};
			};
		};
	}foreach _allMenuEntries;


	// for effects
	{

			_entry = (_interactionDialog displayCtrl _selectedMainMenuButton);
			_entry ctrlSetPosition _position;
			_entry ctrlCommit 0;
			_selectedMainMenuButton = _selectedMainMenuButton + 1;

		if (_selectedMainMenuButton >= _maxCtrlNumber + _allAvailableMainButtons) exitwith{};
	}foreach _returningEntries;



	_selectedMainMenuButton = 201;
	if ((_this select 1) > 200 && (_this select 1) < 300) then {
		_headerNumber = 113;
		_selectedMainMenuButton = 301;
	};
	{
		call _placeEntry;
		if (_selectedMainMenuButton >= _maxCtrlNumber + _allAvailableMainButtons) exitwith{};
	}foreach _returningEntries;
