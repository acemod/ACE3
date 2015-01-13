/**
 * fn_gui_keyPressed.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_menu","_condition","_target","_type","_allAvailableMainButtons","_selectedMainMenuButton","_menuName","_carriedObj", "_allMenuEntries"];
_menu = _this select 0;
_condition = _this select 1;
_type = _this select 2;
if (isDedicated) exitwith{};
if (! call _condition) exitwith {};

//if (cursortarget iskindof "MAN") then {
//};
CMS_GUI_LATEST_SUBMENU = [];
_allAvailableMainButtons = 10;
_selectedMainMenuButton = 150;
_menuName = "";
if (isnil "_type") then {
	_type = 0;
};


_target = switch (_type) do {
	case 2: {if (isNull cursortarget) then {player} else{cursortarget};};
	case 1: {cursortarget};
	case 0: {player};
	default {player};
};
if ((_target distance player) > 10 && {(_type == 2)}) then {
	_target = player;
};
if (_target == player) then {
	_menuName = "Your Person";
	if (_type == 2) then {
		_menu = "SelfInteraction";
	};
	_targetName = [_target] call cse_fnc_getName;

} else {
	_carriedObj = [player] call cse_fnc_getCarriedObj;
	if (!isNull _carriedObj) then {
		_target = _carriedObj;
	};

	_menuName = switch (true) do {
		case (_target isKindOf "CaManBase"): {([_target] call cse_fnc_getName)};
		case ((_target isKindOf "All")): {(getText(configFile >> "Cfgvehicles" >> typeof _target >> "displayName"))};
		default {"Object"};
	};
	if (_type == 2) then {
		_menu = "InteractionMenu";
	};
};

//_allMenuEntries = [_menu] call cse_fnc_gui_getMenuEntries;
if (!([_menu,_target] call cse_fnc_gui_hasOptionAvailable) && _type == 2 && (_menu != "SelfInteraction")) then {
	//_allMenuEntries = ["SelfInteraction"] call cse_fnc_gui_getMenuEntries;
	_menu = "SelfInteraction";
	_menuName = "Your Person";
	_target = player;
	_targetName = [_target] call cse_fnc_getName;
};
if (!([_menu,_target] call cse_fnc_gui_hasOptionAvailable)) exitwith {};
//if (count _allMenuEntries <1) exitwith { [format["GUI - FAILED TO OPEN MENU: NO ENTRIES PASSED CONDITION TEST"],2] call cse_fnc_debug; };


CSE_interactionTarget = _target;
//[format["GUI - MENU OPENING %1",_menu],3] call cse_fnc_debug;
[player,_target] call cse_fnc_registerInteractingWith;
if (isnil "cse_use_white_menu") then {
	createDialog "cse_interactionGUI";
} else {
	createDialog "cse_interactionGUI_w";
};
setMousePosition [0.45, 0.55];

disableSerialization;
_interactionDialog = uiNamespace getvariable "cse_interactionGUI";

//_position = [0.46,0.5];
_position = [safezoneX + (safezoneW / 1.9), safezoneY  + (safezoneH / 1.9) ];
//_position = [0.4 * safezoneW + safezoneX, 0.55 * safezoneH + safezoneY];

ctrlSetFocus (_interactionDialog displayCtrl 210) ;
(_interactionDialog displayCtrl 111) ctrlSetText _menuName;
(_interactionDialog displayCtrl 111) ctrlSetPosition [_position select 0,(_position select 1) - 0.040];
//(_interactionDialog displayCtrl 111) ctrlSetBackgroundColor [0, 0, 0.6, 0.75];
//(_interactionDialog displayCtrl 111) ctrlSetBackgroundColor [(profilenamespace getvariable ['IGUI_BCG_RGB_R',0]),(profilenamespace getvariable ['IGUI_BCG_RGB_G',1]),(profilenamespace getvariable ['IGUI_BCG_RGB_B',1]), 0.75];
(_interactionDialog displayCtrl 111) ctrlSetBackgroundColor [(profilenamespace getvariable ['GUI_BCG_RGB_R',0]),(profilenamespace getvariable ['GUI_BCG_RGB_G',1]),(profilenamespace getvariable ['GUI_BCG_RGB_B',1]), 0.75];
(_interactionDialog displayCtrl 111) ctrlCommit 0;

_allMenuEntries = [_menu] call cse_fnc_gui_getMenuEntries;
{
	private ["_entry"];
	_entry = (_interactionDialog displayCtrl _selectedMainMenuButton);
	_entry ctrlSetText ((_x select 1));
	_entry ctrlSetPosition _position;
	_entry ctrlSetEventHandler ["ButtonClick", format["[] call cse_fnc_gui_hideSubMenuButtons; [player,CSE_interactionTarget,%2] spawn %1",(_x select 3),_selectedMainMenuButton]];
	_entry ctrlCommit 0;

	// updating new information
	_position = [(_position select 0), (_position select 1) + 0.040];
	_selectedMainMenuButton = _selectedMainMenuButton + 1;
	if (_selectedMainMenuButton >= 164 + _allAvailableMainButtons) exitwith{};
}foreach _allMenuEntries;

[] spawn {
	waituntil {!dialog};
	[player,CSE_interactionTarget] call cse_fnc_unregisterInteractingWith;
	//[format["GUI - MENU CLOSED"]] call cse_fnc_debug;
};

// ICONS SUPPORT

// cse\cse_gui\data\icon_tags.paa

_IDC_OF_ICON_OPTION = 400;
(_interactionDialog displayCtrl _IDC_OF_ICON_OPTION) ctrlSetText "cse\cse_gui\data\icon_settings.paa";
(_interactionDialog displayCtrl (_IDC_OF_ICON_OPTION + 100)) ctrlSetEventHandler ["ButtonClick", "
	CloseDialog 0; createDialog 'cse_settingsMenu';
"];
(_interactionDialog displayCtrl (_IDC_OF_ICON_OPTION + 100)) ctrlSetTooltip "Open the Settings Menu";
_IDC_OF_ICON_OPTION = _IDC_OF_ICON_OPTION + 1;


if (["cse_sys_tags"] call cse_fnc_isModuleEnabled_F) then {
	(_interactionDialog displayCtrl _IDC_OF_ICON_OPTION) ctrlSetText "cse\cse_gui\data\icon_tags.paa";
	(_interactionDialog displayCtrl (_IDC_OF_ICON_OPTION + 100)) ctrlSetEventHandler ["ButtonClick", "
		if (isnil 'CSE_DRAW_TAG_ICONS_TAGS') then {
			CSE_DRAW_TAG_ICONS_TAGS = false;
		};
		CSE_DRAW_TAG_ICONS_TAGS = !CSE_DRAW_TAG_ICONS_TAGS;
		if (CSE_DRAW_TAG_ICONS_TAGS) then {
			hintSilent 'Enabled Tags';
		} else {
			hintSilent 'Disabled Tags';
		};
	"];

	(_interactionDialog displayCtrl (_IDC_OF_ICON_OPTION + 100)) ctrlSetTooltip "Toggle CSE Tag System ON/OFF";
	_IDC_OF_ICON_OPTION = _IDC_OF_ICON_OPTION + 1;
};

if (isnil "CSE_DEBUG_ALLOW_RESET_MODE_ENABLED") then {
	CSE_DEBUG_ALLOW_RESET_MODE_ENABLED = false;
};
if (CSE_DEBUG_ALLOW_RESET_MODE_ENABLED) then {
	(_interactionDialog displayCtrl _IDC_OF_ICON_OPTION) ctrlSetText "cse\cse_gui\data\icon_reset_small.paa";
	(_interactionDialog displayCtrl (_IDC_OF_ICON_OPTION + 100)) ctrlSetEventHandler ["ButtonClick", "
		[CSE_interactionTarget] spawn cse_fnc_resetAllDefaults;
	"];

	(_interactionDialog displayCtrl (_IDC_OF_ICON_OPTION + 100)) ctrlSetTooltip "Full CSE reset off target";
	_IDC_OF_ICON_OPTION = _IDC_OF_ICON_OPTION + 1;
};

while {(_IDC_OF_ICON_OPTION < 403)} do {
	ctrlEnable[_IDC_OF_ICON_OPTION+100,false];
	_IDC_OF_ICON_OPTION = _IDC_OF_ICON_OPTION + 1;
};

/*
if (["cse_sys_medical"] call cse_fnc_isModuleEnabled_F) then {
	if (CSE_interactionTarget isKindOf "CAManBase") then {
		[] spawn {
			while {(dialog)} do {
				_status = [CSE_interactionTarget] call cse_fnc_getTriageStatus_CMS;
				[[CSE_interactionTarget] call cse_fnc_getName,["Triage status: "+ (_status select 0)],0] call cse_fnc_gui_displayInformation;
				sleep 0.1;
			};
			["",[""],0] call cse_fnc_gui_displayInformation;
		};
	};
};*/