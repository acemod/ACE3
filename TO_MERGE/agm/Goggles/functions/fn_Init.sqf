/*
	Name: AGM_Goggles_fnc_Init
	
	Author: Garth de Wet (LH)
	
	Description:
	Sets up the glasses mod for usage. Initialises variables and event handlers.
	Shouldn't be called by a user/modder ever. Done by the engine.
	
	Parameters: 
	Nothing
	
	Returns:
	Nothing
	
	Example:
	call AGM_Goggles_fnc_Init;
*/
if (!hasInterface) exitWith {};
#include "\AGM_Goggles\script.sqf"

if isNil("AGM_Goggles_UsePP") then {
	AGM_Goggles_UsePP = true;
};

AGM_Goggles_PostProcess = ppEffectCreate ["ColorCorrections", 1995];
AGM_Goggles_PostProcessEyes = ppEffectCreate ["ColorCorrections", 1992];
AGM_Goggles_PostProcessEyes ppEffectAdjust[1, 1, 0, [0,0,0,0], [0,0,0,1],[1,1,1,0]];
AGM_Goggles_PostProcessEyes ppEffectCommit 0;
AGM_Goggles_PostProcessEyes ppEffectEnable false;
AGM_Goggles_EffectsActive = false;
AGM_Goggles_Effects = GLASSESDEFAULT;
AGM_Goggles_Current = "None";
AGM_Goggles_EyesDamageScript = 0 spawn {};
AGM_Goggles_FrameEvent = [false, [false,20]];
AGM_Goggles_PostProcessEyes_Enabled = false;
AGM_Goggles_DustHandler = 0 spawn {};
AGM_Goggles_RainDrops = objNull;

AGM_Goggles_fnc_CheckGlasses = {
	if (AGM_Goggles_Current != (goggles player)) then {
		AGM_Goggles_Current = (goggles player);
		["GlassesChanged",[AGM_Goggles_Current]] call CBA_fnc_localEvent;
	};
};

player addEventHandler ["Explosion", {
	if (alive player) then {
		call AGM_Goggles_fnc_ApplyDirtEffect;
		if (GETBROKEN) exitWith {};
		if (((_this select 1) call AGM_Goggles_fnc_GetExplosionIndex) < getNumber(ConfigFile >> "CfgGlasses" >> AGM_Goggles_Current >> "AGM_Resistance")) exitWith {};
		if !(player call AGM_Goggles_fnc_isGogglesVisible) exitWith {["GlassesCracked",[player]] call CBA_fnc_localEvent;};
		AGM_Goggles_Effects set [BROKEN, true];
		if (getText(ConfigFile >> "CfgGlasses" >> AGM_Goggles_Current >> "AGM_OverlayCracked") != "" && {cameraOn == player}) then {
			if (call AGM_Goggles_fnc_ExternalCamera) exitWith {};
			if (isNull(GLASSDISPLAY)) then {
				150 cutRsc["RscAGM_Goggles", "PLAIN",1, false];
			};
			(GLASSDISPLAY displayCtrl 10650) ctrlSetText getText(ConfigFile >> "CfgGlasses" >> AGM_Goggles_Current >> "AGM_OverlayCracked");
		};
		["GlassesCracked",[player]] call CBA_fnc_localEvent;
	};
}];
player addEventHandler ["Killed",{
	[] spawn {
		sleep 2;
		AGM_Goggles_PostProcessEyes ppEffectEnable false;
		AGM_Goggles_Effects = GLASSESDEFAULT;
		call AGM_Goggles_fnc_RemoveGlassesEffect;
		AGM_Goggles_EffectsActive=false;
		player setVariable ["AGM_EyesDamaged", false];
		terminate AGM_Goggles_EyesDamageScript;
		terminate AGM_Goggles_MainLoop;
		terminate AGM_Goggles_DustHandler;
		AGM_Goggles_MainLoop = [] spawn AGM_Goggles_fnc_CheckGoggles;
	};
}];
player addEventHandler ["Fired",{[_this select 0, _this select 1] call AGM_Goggles_fnc_DustHandler;}];
player AddEventHandler ["Take",{call AGM_Goggles_fnc_CheckGlasses;}];
player AddEventHandler ["Put", {call AGM_Goggles_fnc_CheckGlasses;}];

["GlassesChanged",{
	AGM_Goggles_Effects = GLASSESDEFAULT;
	
	if (call AGM_Goggles_fnc_ExternalCamera) exitWith {call AGM_Goggles_fnc_RemoveGlassesEffect};
	
	if (player call AGM_Goggles_fnc_isGogglesVisible) then {
		(_this select 0) call AGM_Goggles_fnc_ApplyGlassesEffect;
	} else {
		call AGM_Goggles_fnc_RemoveGlassesEffect;
	};
}] call CBA_fnc_addEventHandler;
["GlassesCracked",{
	if (_this select 0 != player) exitWith {};
	player setVariable ["AGM_EyesDamaged", true];
	if !(scriptDone AGM_Goggles_EyesDamageScript) then {
		terminate AGM_Goggles_EyesDamageScript;
	};
	AGM_Goggles_PostProcessEyes ppEffectAdjust[1, 1, 0, [0,0,0,0], [0.5,0.5,0.5,0.5],[1,1,1,0]];
	AGM_Goggles_PostProcessEyes ppEffectCommit 0;
	AGM_Goggles_PostProcessEyes ppEffectEnable true;
	AGM_Goggles_EyesDamageScript = [] spawn {
		sleep 25;
		AGM_Goggles_PostProcessEyes ppEffectAdjust[1, 1, 0, [0,0,0,0], [1,1,1,1],[1,1,1,0]];
		AGM_Goggles_PostProcessEyes ppEffectCommit 5;
		sleep 5;
		AGM_Goggles_PostProcessEyes ppEffectEnable false;
		player setVariable ["AGM_EyesDamaged", false];
	};
}] call CBA_fnc_addEventHandler;
AGM_Goggles_MainLoop = [] spawn AGM_Goggles_fnc_CheckGoggles;
