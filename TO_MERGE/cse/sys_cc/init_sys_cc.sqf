/**
 * init_sys_cc.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_args"];
_args =  _this;
CSE_CONTROL_UAV_RESTRICTED_CC = false;
CSE_AUTO_SHOW_UAV_TRACKERS_ON_BFT = false;
CSE_ALLOW_LIVE_FEEDS_CC = true;
CSE_ALLOW_VEHICLE_DISPLAYS_CC = true;
CSE_AUTO_ASSIGN_CALLSIGNS_CC = -1;
CSE_VIEW_ON_MAIN_MAP_SETTING_CC = false;
CSE_VIEW_ON_MAIN_MAP_ALLOWED_CC = false;

{
	if (_x select 0 == "uavRestriction") then {
		CSE_CONTROL_UAV_RESTRICTED_CC = (_x select 1);
	};
	if (_x select 0 == "showUAV") then {
		CSE_AUTO_SHOW_UAV_TRACKERS_ON_BFT = _x select 1;
	};
	if (_x select 0 == "allowFeeds") then {
		CSE_ALLOW_LIVE_FEEDS_CC = _x select 1;
	};
	if (_x select 0 == "allowVehicleDisplays") then {
		CSE_ALLOW_VEHICLE_DISPLAYS_CC = _x select 1;
	};
	if (_x select 0 == "autoAssignCallSigns") then {
		CSE_AUTO_ASSIGN_CALLSIGNS_CC = _x select 1;
	};
	if (_x select 0 == "allowDisplayOnMainMap") then {
		CSE_VIEW_ON_MAIN_MAP_ALLOWED_CC = _x select 1;
	};
}foreach _args;

[format["AIM - Command and Control initialisation started"],3] call cse_fnc_debug;
waituntil{!isnil "cse_gui"};
[format["CC - Command and Control Module initialised"],2] call cse_fnc_debug;


["cse_sys_cc_allowUseOfMainMap", ["Enable", "Disable"], (["cse_sys_cc_allowUseOfMainMap", 0] call cse_fnc_getClientSideOptionFromProfile_F), {
	CSE_VIEW_ON_MAIN_MAP_SETTING_CC = (_this select 1) == 0;
}] call cse_fnc_addClientSideOptions_f;

["cse_sys_cc_allowUseOfMainMap","option","Use main map (CC)","Use Command and Control on the main map when you have a CC device. Read only."] call cse_fnc_settingsDefineDetails_F;



["cse_m_tablet",[-0.03,0.06,1.014,0.827],1,WEST] call cse_fnc_registerDevice_CC;
["cse_m_pda",[0.2761,0.38,0.33,0.47],2,WEST] call cse_fnc_registerDevice_CC;

["cse_m_tablet_o",[-0.03,0.06,1.014,0.827],1,EAST] call cse_fnc_registerDevice_CC;
["cse_m_pda_o",[0.2761,0.38,0.33,0.47],2,EAST] call cse_fnc_registerDevice_CC;

["cse_m_tablet_g",[-0.03,0.06,1.014,0.827],1,independent] call cse_fnc_registerDevice_CC;
["cse_m_pda_g",[0.2761,0.38,0.33,0.47],2,independent] call cse_fnc_registerDevice_CC;

["cse_m_tablet_uk",[-0.03,0.06,1.014,0.827],1,WEST] call cse_fnc_registerDevice_CC;

cse_fnc_switchItem = {
	private ["_unit","_orig","_newI"];
	_unit = _this select 0;
	_orig = _this select 1;
	_newI = _this select 2;
	_unit removeItem _orig;
	_unit addItem _newI;
};

CSE_DISPLAY_CC_VIEW_FULL_SCREEN_CC = false;
[] call compile preprocessFile "cse\cse_sys_cc\register_applications.sqf";
[] call compile preprocessFile "cse\cse_sys_cc\init_server.sqf";

CSE_ICON_PATH = "cse\cse_gui\radialmenu\data\icons\";
CSE_LIVEFEED_TARGET_CC = ObjNull;
_entries = [
	["PDA (NATO)", {([player,"cse_m_pda"] call cse_fnc_hasItem_CC)}, CSE_ICON_PATH + "icon_pda.paa", {closeDialog 0; ["cse_m_pda"] call cse_fnc_openDevice_CC;}, "Open PDA (NATO)"],
	["Tablet (NATO)", {([player,"cse_m_tablet"] call cse_fnc_hasItem_CC)}, CSE_ICON_PATH + "icon_tablet.paa", {closeDialog 0; ["cse_m_tablet"] call cse_fnc_openDevice_CC;}, "Open Tablet (NATO)"],
	["Tablet (UK)", {([player,"cse_m_tablet_uk"] call cse_fnc_hasItem_CC)}, CSE_ICON_PATH + "icon_tablet_uk.paa", {closeDialog 0; ["cse_m_tablet_uk"] call cse_fnc_openDevice_CC;}, "Open Tablet (UK)"],
	["PDA (OPFOR)", {([player,"cse_m_pda_o"] call cse_fnc_hasItem_CC)}, CSE_ICON_PATH + "icon_pda.paa", {closeDialog 0; ["cse_m_pda_o"] call cse_fnc_openDevice_CC;}, "Open PDA (OPFOR)"],
	["Tablet (OPFOR)", {([player,"cse_m_tablet_o"] call cse_fnc_hasItem_CC)}, CSE_ICON_PATH + "icon_tablet.paa", {closeDialog 0; ["cse_m_tablet_o"] call cse_fnc_openDevice_CC;}, "Open Tablet (OPFOR)"],
	["PDA (IND)", {([player,"cse_m_pda_g"] call cse_fnc_hasItem_CC)}, CSE_ICON_PATH + "icon_pda.paa", {closeDialog 0; ["cse_m_pda_g"] call cse_fnc_openDevice_CC;}, "Open PDA (IND)"],
	["Tablet (IND)", {([player,"cse_m_tablet_g"] call cse_fnc_hasItem_CC)}, CSE_ICON_PATH + "icon_tablet.paa", {closeDialog 0; ["cse_m_tablet_g"] call cse_fnc_openDevice_CC;}, "Open Tablet (IND)"]
];
["ActionMenu","equipment", _entries ] call cse_fnc_addMultipleEntriesToRadialCategory_F;

cse_fnc_hasHelmetCameraItem_CC = {
	(([player,"cse_itemHelmetCamera_W"] call cse_fnc_hasItem_CC) || ([player,"cse_itemHelmetCamera_O"] call cse_fnc_hasItem_CC) || ([player,"cse_itemHelmetCamera_G"] call cse_fnc_hasItem_CC))
};

_entries = [
	["Enable Camera", {(([] call cse_fnc_hasHelmetCameraItem_CC) && !(player getvariable ["cse_hasCameraFeed_enabled_CC", false]))}, CSE_ICON_PATH + "icon_helmetCam_small.paa", {closeDialog 0; player setvariable ["cse_hasCameraFeed_enabled_CC", true, true];}, "Turn on your helmet camera"],
	["Disable Camera", {(([] call cse_fnc_hasHelmetCameraItem_CC) && (player getvariable ["cse_hasCameraFeed_enabled_CC", false]))}, CSE_ICON_PATH + "icon_helmetCam_small.paa", {closeDialog 0; player setvariable ["cse_hasCameraFeed_enabled_CC", false, true];}, "Turn off your helmet camera"]
];
["ActionMenu","equipment", _entries ] call cse_fnc_addMultipleEntriesToRadialCategory_F;


// Request players to access their BFT device(s)
_entries = [
	["PDA (NATO)", {([_this select 1,"cse_m_pda"] call cse_fnc_hasItem_CC) && (player != (_this select 1))}, CSE_ICON_PATH + "icon_pda.paa", {closeDialog 0; [player, _this select 1, "access_device", "%1 wants to access your BFT", "if !(_this select 2) exitwith {}; if ([_this select 1, 'cse_m_pda'] call cse_fnc_hasItem_CC) then { ['cse_m_pda'] call cse_fnc_openDevice_CC; };"] call cse_fnc_sendRequest_f;}, "Access PDA (NATO)"],

	["Tablet (NATO)", {([_this select 1,"cse_m_tablet"] call cse_fnc_hasItem_CC) && (player != (_this select 1))}, CSE_ICON_PATH + "icon_tablet.paa", {closeDialog 0; [player, _this select 1, "access_device", "%1 wants to access your BFT", "if !(_this select 2) exitwith {}; if ([_this select 1, 'cse_m_tablet'] call cse_fnc_hasItem_CC) then { ['cse_m_tablet'] call cse_fnc_openDevice_CC; };"] call cse_fnc_sendRequest_f;}, "Access Tablet (NATO)"],

	["Tablet (UK)", {([_this select 1,"cse_m_tablet_uk"] call cse_fnc_hasItem_CC) && (player != (_this select 1))}, CSE_ICON_PATH + "icon_tablet_uk.paa", {closeDialog 0; [player, _this select 1, "access_device", "%1 wants to access your BFT", "if !(_this select 2) exitwith {}; if ([_this select 1, 'cse_m_tablet_uk'] call cse_fnc_hasItem_CC) then { ['cse_m_tablet_uk'] call cse_fnc_openDevice_CC; };"] call cse_fnc_sendRequest_f;}, "Access Tablet (UK)"],

	["PDA (OPFOR)", {([_this select 1,"cse_m_pda_o"] call cse_fnc_hasItem_CC) && (player != (_this select 1))}, CSE_ICON_PATH + "icon_pda.paa", {closeDialog 0; [player, _this select 1, "access_device", "%1 wants to access your BFT", "if !(_this select 2) exitwith {}; if ([_this select 1, 'cse_m_pda_o'] call cse_fnc_hasItem_CC) then { ['cse_m_pda_o'] call cse_fnc_openDevice_CC; };"] call cse_fnc_sendRequest_f;}, "Access PDA (OPFOR)"],

	["Tablet (OPFOR)", {([_this select 1,"cse_m_tablet_o"] call cse_fnc_hasItem_CC) && (player != (_this select 1))}, CSE_ICON_PATH + "icon_tablet.paa", {closeDialog 0; [player, _this select 1, "access_device", "%1 wants to access your BFT", "if !(_this select 2) exitwith {}; if ([_this select 1, 'cse_m_tablet_o'] call cse_fnc_hasItem_CC) then { ['cse_m_tablet_o'] call cse_fnc_openDevice_CC; };"] call cse_fnc_sendRequest_f;}, "Access Tablet (OPFOR)"],

	["PDA (IND)", {([_this select 1,"cse_m_pda_g"] call cse_fnc_hasItem_CC) && (player != (_this select 1))}, CSE_ICON_PATH + "icon_pda.paa", {closeDialog 0; [player, _this select 1, "access_device", "%1 wants to access your BFT", "if !(_this select 2) exitwith {}; if ([_this select 1, 'cse_m_pda_g'] call cse_fnc_hasItem_CC) then { ['cse_m_pda_g'] call cse_fnc_openDevice_CC; };"] call cse_fnc_sendRequest_f;}, "Access PDA (IND)"],

	["Tablet (IND)", {([_this select 1,"cse_m_tablet_g"] call cse_fnc_hasItem_CC) && (player != (_this select 1))}, CSE_ICON_PATH + "icon_tablet.paa", {closeDialog 0; [player, _this select 1, "access_device", "%1 wants to access your BFT", "if !(_this select 2) exitwith {}; if ([_this select 1, 'cse_m_tablet_g'] call cse_fnc_hasItem_CC) then { ['cse_m_tablet_g'] call cse_fnc_openDevice_CC; };"] call cse_fnc_sendRequest_f;}, "Access Tablet (IND)"]
];
["ActionMenu","interaction", _entries] call cse_fnc_addMultipleEntriesToRadialCategory_F;


_entries = [
	["BFT Display", {[player, vehicle player] call cse_fnc_canUseOnBoard_BFT_Device_CC}, CSE_ICON_PATH + "icon_m_flight_display.paa", {closeDialog 0; [vehicle player] call cse_fnc_openFlight_Display_CC;}, "Use onboard BFT Display"]
];
["ActionMenu","interaction", _entries ] call cse_fnc_addMultipleEntriesToRadialCategory_F;


if (hasInterface) then {
 		// set the event handlers for the map
	 	{
			_x spawn {
				disableserialization;
				waituntil {!isnull (finddisplay _this displayctrl 51)};

				private "_control";
				_control = finddisplay _this displayctrl 51;
				_control ctrlAddEventHandler ["draw","
					if ([player] call cse_fnc_hasTrackerItem_CC && CSE_VIEW_ON_MAIN_MAP_SETTING_CC && CSE_VIEW_ON_MAIN_MAP_ALLOWED_CC) then {
						{[_x,(_this select 0)] call cse_fnc_drawBFTIcons_CC;}foreach CSE_TRACKER_ICONS;
						if (CSE_TOGGLE_INTEL_LAYER_CC) then {{[_x,(_this select 0)] call cse_fnc_drawBFTMarker_CC;}foreach CSE_INTEL_MARKER_COLLECTION_CC;};
						if (CSE_TOGGLE_ROUTE_LAYER_CC) then {{[_x,(_this select 0)] call cse_fnc_drawBFTMarker_CC;}foreach CSE_ROUTE_MARKER_COLLECTION_CC;};
					};
					"];
			};
		} foreach [getnumber (configfile >> "RscDisplayMainMap" >> "idd"), getnumber (configfile >> "RscDisplayGetReady" >> "idd"), getnumber (configfile >> "RscDisplayClientGetReady" >> "idd"), getnumber (configfile >> "RscDisplayServerGetReady" >> "idd")
		];
};