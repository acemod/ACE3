#define ACTION_MENU "ActionMenu"


[ACTION_MENU, "Action Menu", {[player] call cse_fnc_isAwake && vehicle player == cameraOn}, 2, "", {}, false] call cse_fnc_createRadialInteraction_F;
cse_fnc_openActionMenu_GUI = {

	["ActionMenu"] call cse_fnc_openRadialInteractionMenu_F;
	if ([player] call cse_fnc_canInteract && {animationState player == 'deadState' || animationState player == 'unconscious'} && {(vehicle player == player)}) then {
	 	[player, 'amovppnemstpsnonwnondnon'] call cse_fnc_broadcastAnim;
	};
};

["radius_menu", (["radius_menu","menu",[0,0,0,0]] call cse_fnc_getKeyBindingFromProfile_F), cse_fnc_openActionMenu_GUI, 800] call cse_fnc_addKeyBindingForMenu_F;
["radius_menu","menu","Open Action Menu","Opens the CSE Radial Action Menu"] call cse_fnc_settingsDefineDetails_F;


cse_fnc_playerCanInteractWithPerson = {
	private ["_person","_modify"];
	_person = _this select 0;
	_modify = _this select 1;
	_return = false;
	if (_person isKindOf "CAManBase") then {
		_return = switch (_modify) do {
			case 0: {([_person] call cse_fnc_isAwake)};
			case 1: {true};
			default {false};
		};
	};
	_return
};

// CATEGORIES
[ACTION_MENU,"interaction", "Interact", {["ActionMenu", "interaction", _this select 1] call cse_fnc_categoryHasActionsAvailable_F}, CSE_ICON_PATH + "icon_interact.paa", 0, "Interact with"] call cse_fnc_createCategoryRadialMenu_F;
[ACTION_MENU,"equipment", "Equipment", {["ActionMenu", "equipment", _this select 1] call cse_fnc_categoryHasActionsAvailable_F}, CSE_ICON_PATH + "icon_backpack_radio.paa", 1, "Equipment & Gear"] call cse_fnc_createCategoryRadialMenu_F;
[ACTION_MENU,"medical_menu", "Medical", {["ActionMenu", "medical_menu", _this select 1] call cse_fnc_categoryHasActionsAvailable_F}, CSE_ICON_PATH + "icon_examine_patient.paa", 2, "Medical Interaction"] call cse_fnc_createCategoryRadialMenu_F;
[ACTION_MENU,"group_actions", "Group", {["ActionMenu", "group_actions", _this select 1] call cse_fnc_categoryHasActionsAvailable_F}, CSE_ICON_PATH + "icon_group.paa", 3, "Your Group"] call cse_fnc_createCategoryRadialMenu_F;
[ACTION_MENU,"survival", "Survival", {["ActionMenu", "survival", _this select 1] call cse_fnc_categoryHasActionsAvailable_F}, CSE_ICON_PATH + "icon_survival.paa", 4, "Survival actions"] call cse_fnc_createCategoryRadialMenu_F;

if ([] call cse_fnc_isLoaded_ALiVE_Mod) then {
	[ACTION_MENU,"alive_actions", "ALiVE", {["ActionMenu", "alive_actions", _this select 1] call cse_fnc_categoryHasActionsAvailable_F}, CSE_ICON_PATH + "icon_alive_mod.paa", 5, "ALiVE actions"] call cse_fnc_createCategoryRadialMenu_F;
};

[ACTION_MENU,"custom_actions", "Custom", {["ActionMenu", "custom_actions", _this select 1] call cse_fnc_categoryHasActionsAvailable_F}, CSE_ICON_PATH + "icon_lines_horizontal_s.paa", 6, "Custom actions"] call cse_fnc_createCategoryRadialMenu_F;

// Entries
[ACTION_MENU,"custom_actions", [["Curator", {getAssignedCuratorLogic player in allCurators}, CSE_ICON_PATH + "icon_curator.paa", {closeDialog 0; openCuratorInterface; }, "Open Curator Interface"]] ] call cse_fnc_addMultipleEntriesToRadialCategory_F;




/*
["myID_1", true, CSE_ICON_PATH + "icon_group.paa", [1,1,1,1]] call cse_fnc_gui_displayIcon;
["myID_2", true, CSE_ICON_PATH + "icon_backpack_radio.paa", [1,1,1,1]] call cse_fnc_gui_displayIcon;
["myID_3", true, CSE_ICON_PATH + "icon_interact.paa", [1,1,1,1]] call cse_fnc_gui_displayIcon;
["myID_4", true, CSE_ICON_PATH + "icon_survival.paa", [1,1,1,1]] call cse_fnc_gui_displayIcon;


["myID_1", false, CSE_ICON_PATH + "icon_group.paa", [1,1,1,1]] call cse_fnc_gui_displayIcon;
["myID_2", false, CSE_ICON_PATH + "icon_backpack_radio.paa", [1,1,1,1]] call cse_fnc_gui_displayIcon;
["myID_3", false, CSE_ICON_PATH + "icon_interact.paa", [1,1,1,1]] call cse_fnc_gui_displayIcon;
["myID_4", false, CSE_ICON_PATH + "icon_survival.paa", [1,1,1,1]] call cse_fnc_gui_displayIcon;

*/