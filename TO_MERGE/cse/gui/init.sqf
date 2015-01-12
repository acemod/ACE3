CSE_ALLOW_ON_MOUSE_OVER_OPEN_RADIALMENU = false;
CSE_ICON_PATH = "cse\cse_gui\radialmenu\data\icons\";

if (!isDedicated) then {
	call cse_fnc_gui_displayEventHandler;
	[format["GUI - REGISTERING INTERACTION MENUS"],3] call cse_fnc_debug;
	#include "init_action_ui.sqf"	// radis menu + action keybindings

	if ((((["CombinedInteractionMenu","menu",[0,0,0,0]] call cse_fnc_getKeyBindingFromProfile_F) select 0) != 0) && (((["radius_menu","menu",[0,0,0,0]] call cse_fnc_getKeyBindingFromProfile_F) select 0) == 0)) then {
		["radius_menu", (["CombinedInteractionMenu","menu",[0,0,0,0]] call cse_fnc_getKeyBindingFromProfile_F)] call cse_fnc_updateMenuKeyBinding_f;
		["CombinedInteractionMenu", [0,0,0,0]] call cse_fnc_updateMenuKeyBinding_f;
	};
};
cse_gui = true;

[format["GUI - INIT COMPLETE"],3] call cse_fnc_debug;


["cse_gui_radialMenu_AllowOnMouseOver", ["Enable", "Disable"], (["cse_gui_radialMenu_AllowOnMouseOver", 0] call cse_fnc_getClientSideOptionFromProfile_F), {
	CSE_ALLOW_ON_MOUSE_OVER_OPEN_RADIALMENU = (_this select 1) == 0;
}] call cse_fnc_addClientSideOptions_f;

["cse_gui_radialMenu_AllowOnMouseOver","option","Radial Menu (Hover)","Open the radial menu category when you hover your mouse over the button."] call cse_fnc_settingsDefineDetails_F;


cse_fnc_interactWithVehicle_Crew_Condition = {
private ["_return"];
	_return = false;
	if (((_this select 0) distance (_this select 1) < 10)) then {
		if (((_this select 1) isKindOf "Car") || ((_this select 1) isKindOf "Air") || ((_this select 1) isKindOf "Tank")) then {
			if (count (crew (_this select 1)) > 0) then {
				_return = true;
			};
		};
	};
	_return
};