/*
	Name: ACE_Goggles_fnc_Init
	
	Author: Garth de Wet (LH)
	
	Description:
	Sets up the glasses mod for usage. Initialises variables and event handlers.
	Shouldn't be called by a user/modder ever. Done by the engine.
	
	Parameters: 
	Nothing
	
	Returns:
	Nothing
	
	Example:
	call ACE_Goggles_fnc_Init;
*/
if (!hasInterface) exitWith {};
#include "\ACE_Goggles\script.sqf"

if isNil("ACE_Goggles_UsePP") then {
	ACE_Goggles_UsePP = true;
};

ACE_Goggles_PostProcess = ppEffectCreate ["ColorCorrections", 1995];
ACE_Goggles_PostProcessEyes = ppEffectCreate ["ColorCorrections", 1992];
ACE_Goggles_PostProcessEyes ppEffectAdjust[1, 1, 0, [0,0,0,0], [0,0,0,1],[1,1,1,0]];
ACE_Goggles_PostProcessEyes ppEffectCommit 0;
ACE_Goggles_PostProcessEyes ppEffectEnable false;
ACE_Goggles_EffectsActive = false;
ACE_Goggles_Effects = GLASSESDEFAULT;
ACE_Goggles_Current = "None";
ACE_Goggles_EyesDamageScript = 0 spawn {};
ACE_Goggles_FrameEvent = [false, [false,20]];
ACE_Goggles_PostProcessEyes_Enabled = false;
ACE_Goggles_DustHandler = 0 spawn {};
ACE_Goggles_RainDrops = objNull;

ACE_Goggles_fnc_CheckGlasses = {
	if (ACE_Goggles_Current != (goggles player)) then {
		ACE_Goggles_Current = (goggles player);
		["GlassesChanged",[ACE_Goggles_Current]] call CBA_fnc_localEvent;
	};
};

player addEventHandler ["Explosion", {
	if (alive player) then {
		call ACE_Goggles_fnc_ApplyDirtEffect;
		if (GETBROKEN) exitWith {};
		if (((_this select 1) call ACE_Goggles_fnc_GetExplosionIndex) < getNumber(ConfigFile >> "CfgGlasses" >> ACE_Goggles_Current >> "ACE_Resistance")) exitWith {};
		if !(player call ACE_Goggles_fnc_isGogglesVisible) exitWith {["GlassesCracked",[player]] call CBA_fnc_localEvent;};
		ACE_Goggles_Effects set [BROKEN, true];
		if (getText(ConfigFile >> "CfgGlasses" >> ACE_Goggles_Current >> "ACE_OverlayCracked") != "" && {cameraOn == player}) then {
			if (call ACE_Goggles_fnc_ExternalCamera) exitWith {};
			if (isNull(GLASSDISPLAY)) then {
				150 cutRsc["RscACE_Goggles", "PLAIN",1, false];
			};
			(GLASSDISPLAY displayCtrl 10650) ctrlSetText getText(ConfigFile >> "CfgGlasses" >> ACE_Goggles_Current >> "ACE_OverlayCracked");
		};
		["GlassesCracked",[player]] call CBA_fnc_localEvent;
	};
}];
player addEventHandler ["Killed",{
	[] spawn {
		sleep 2;
		ACE_Goggles_PostProcessEyes ppEffectEnable false;
		ACE_Goggles_Effects = GLASSESDEFAULT;
		call ACE_Goggles_fnc_RemoveGlassesEffect;
		ACE_Goggles_EffectsActive=false;
		player setVariable ["ACE_EyesDamaged", false];
		terminate ACE_Goggles_EyesDamageScript;
		terminate ACE_Goggles_MainLoop;
		terminate ACE_Goggles_DustHandler;
		ACE_Goggles_MainLoop = [] spawn ACE_Goggles_fnc_CheckGoggles;
	};
}];
player addEventHandler ["Fired",{[_this select 0, _this select 1] call ACE_Goggles_fnc_DustHandler;}];
player AddEventHandler ["Take",{call ACE_Goggles_fnc_CheckGlasses;}];
player AddEventHandler ["Put", {call ACE_Goggles_fnc_CheckGlasses;}];

["GlassesChanged",{
	ACE_Goggles_Effects = GLASSESDEFAULT;
	
	if (call ACE_Goggles_fnc_ExternalCamera) exitWith {call ACE_Goggles_fnc_RemoveGlassesEffect};
	
	if (player call ACE_Goggles_fnc_isGogglesVisible) then {
		(_this select 0) call ACE_Goggles_fnc_ApplyGlassesEffect;
	} else {
		call ACE_Goggles_fnc_RemoveGlassesEffect;
	};
}] call CBA_fnc_addEventHandler;
["GlassesCracked",{
	if (_this select 0 != player) exitWith {};
	player setVariable ["ACE_EyesDamaged", true];
	if !(scriptDone ACE_Goggles_EyesDamageScript) then {
		terminate ACE_Goggles_EyesDamageScript;
	};
	ACE_Goggles_PostProcessEyes ppEffectAdjust[1, 1, 0, [0,0,0,0], [0.5,0.5,0.5,0.5],[1,1,1,0]];
	ACE_Goggles_PostProcessEyes ppEffectCommit 0;
	ACE_Goggles_PostProcessEyes ppEffectEnable true;
	ACE_Goggles_EyesDamageScript = [] spawn {
		sleep 25;
		ACE_Goggles_PostProcessEyes ppEffectAdjust[1, 1, 0, [0,0,0,0], [1,1,1,1],[1,1,1,0]];
		ACE_Goggles_PostProcessEyes ppEffectCommit 5;
		sleep 5;
		ACE_Goggles_PostProcessEyes ppEffectEnable false;
		player setVariable ["ACE_EyesDamaged", false];
	};
}] call CBA_fnc_addEventHandler;
ACE_Goggles_MainLoop = [] spawn ACE_Goggles_fnc_CheckGoggles;
