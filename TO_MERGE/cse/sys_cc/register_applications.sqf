/*
registerApplications.sqf
Usage: Registers applications for the Command and Control Module
Author: Glowbal

Arguments: array []
Returns: Void

Affects: Clients
Executes: All Localities
*/

_r = profilenamespace getvariable ['Map_BLUFOR_R',0];
_g = profilenamespace getvariable ['Map_BLUFOR_G',0.8];
_b = profilenamespace getvariable ['Map_BLUFOR_B',1];
_a = profilenamespace getvariable ['Map_BLUFOR_A',0.8];
CSE_SIDE_WEST_COLOR = [_r,_g,_b,_a];

CSE_SIDE_EAST_COLOR =
	[
		profilenamespace getvariable ['Map_OPFOR_R',0.5],
		profilenamespace getvariable ['Map_OPFOR_G',0],
		profilenamespace getvariable ['Map_OPFOR_B',0],
		profilenamespace getvariable ['Map_OPFOR_A',0.8]
	];

_r = profilenamespace getvariable ['Map_Independent_R',0];
_g = profilenamespace getvariable ['Map_Independent_G',1];
_b = profilenamespace getvariable ['Map_Independent_B',1];
_a = profilenamespace getvariable ['Map_OPFOR_A',0.8];
CSE_SIDE_IND_COLOR = [_r,_g,_b,_a];

if (isDedicated) exitwith {};

	["home","","",1,[["Show BFT Icon","button","private '_var'; _var = [player] call cse_fnc_getTrackerInformation_CC; _var set [2, true]; player setvariable ['cse_bft_info_cc', _var, true]; ",0], ["Hide BFT Icon","button","private '_var'; _var = [player] call cse_fnc_getTrackerInformation_CC; _var set [2, false]; player setvariable ['cse_bft_info_cc', _var, true]; ",0]],[WEST,EAST,INDEPENDENT],"[_this select 0] call cse_fnc_openScreen_home_CC;", ["All"]]call cse_fnc_registerApp_CC;

	_sideBarCC_APP = [["Blue Force Tracking","label","",0],
		["Toggle Intel Layer","button","if (isnil 'CSE_TOGGLE_INTEL_LAYER_CC') then { CSE_TOGGLE_INTEL_LAYER_CC = true; } else { CSE_TOGGLE_INTEL_LAYER_CC = !CSE_TOGGLE_INTEL_LAYER_CC; };",0],
		["Toggle Route Layer","button","if (isnil 'CSE_TOGGLE_ROUTE_LAYER_CC') then { CSE_TOGGLE_ROUTE_LAYER_CC = true; } else { CSE_TOGGLE_ROUTE_LAYER_CC = !CSE_TOGGLE_ROUTE_LAYER_CC; };",0],
		["Toggle Callsigns","button","if (isnil 'CSE_TOGGLE_CALLSIGNS_CC') then { CSE_TOGGLE_CALLSIGNS_CC = true; } else { CSE_TOGGLE_CALLSIGNS_CC = !CSE_TOGGLE_CALLSIGNS_CC; };",0]
	];
	["cc_app","C2","cse\cse_sys_cc\data\icons\map-icon.paa",0,_sideBarCC_APP,[WEST,EAST,INDEPENDENT],"[_this select 0,WEST] call cse_fnc_openScreen_cc_app_CC;", ["All"]] call cse_fnc_registerApp_CC;

	CSE_TOGGLE_CALLSIGNS_CC = true;
	CSE_TOGGLE_ROUTE_LAYER_CC = true;
	CSE_TOGGLE_INTEL_LAYER_CC = true;

[] spawn {
	waituntil {
		CSE_TRACKER_ICONS = [] call cse_fnc_displayBFTSymbols_CC;
		uisleep 5;
		false;
	};
};


if (CSE_ALLOW_LIVE_FEEDS_CC) then {
	_sideBarCC_APP = [["Live Feed","label","",0],
		["Disconnect","button","[call cse_fnc_getCurrentDeviceName_CC, CSE_PREVIOUS_APPLICATION_CC] call cse_fnc_openScreen_CC; [call cse_fnc_getCurrentDeviceName_CC,'main', 'hidden'] call cse_fnc_setPiP_CC; ",0]
	];
	["LiveFeed_Viewing","","", 1,_sideBarCC_APP,[WEST,EAST,INDEPENDENT],"if (!isNull CSE_LIVEFEED_TARGET_CC) then { if (CSE_LIVEFEED_TARGET_CC in allUnitsUAV) exitwith {}; if ([CSE_LIVEFEED_TARGET_CC, call cse_fnc_getCurrentDeviceName_CC] call cse_fnc_canViewFeed_CC) then {[_this select 0] call cse_fnc_openScreen_liveFeed_CC;} else {[_this select 0, 'LiveFeed_app'] call cse_fnc_openScreen_CC;}; };", ["All"]] call cse_fnc_registerApp_CC;


	_sideBarCC_APP = [["Live Feed","label","",0],
		["Disconnect","button","[call cse_fnc_getCurrentDeviceName_CC, CSE_PREVIOUS_APPLICATION_CC] call cse_fnc_openScreen_CC; [call cse_fnc_getCurrentDeviceName_CC,'main', 'hidden'] call cse_fnc_setPiP_CC; ",0],
		["Take Control","button","if (!isNull CSE_LIVEFEED_TARGET_CC) then { if !(CSE_LIVEFEED_TARGET_CC in allUnitsUAV) exitwith {}; if ([CSE_LIVEFEED_TARGET_CC, call cse_fnc_getCurrentDeviceName_CC] call cse_fnc_canViewFeed_CC) then {[CSE_LIVEFEED_TARGET_CC] call cse_fnc_takeControlUAV_CC; }; };",0]
	];
	["LiveFeed_Viewing_UAV","","", 1, _sideBarCC_APP,[WEST,EAST,INDEPENDENT],"if (!isNull CSE_LIVEFEED_TARGET_CC) then { if !(CSE_LIVEFEED_TARGET_CC in allUnitsUAV) exitwith {}; if ([CSE_LIVEFEED_TARGET_CC, call cse_fnc_getCurrentDeviceName_CC] call cse_fnc_canViewFeed_CC) then {[_this select 0] call cse_fnc_openScreen_liveFeed_CC;} else {[_this select 0, 'LiveFeed_app'] call cse_fnc_openScreen_CC;};};", ["All"]] call cse_fnc_registerApp_CC;


	["LiveFeed_app","TACNET","cse\cse_sys_cc\data\icons\icon_livefeed_app.paa", 0,[],[WEST,EAST,INDEPENDENT],"[_this select 0] call cse_fnc_openScreen_liveFeed_app_CC;", ["All"]] call cse_fnc_registerApp_CC;

};