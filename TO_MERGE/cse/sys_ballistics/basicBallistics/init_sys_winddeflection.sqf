CSE_WIND_DEFLECTION_EFFECT_AI_BB = false;
CSE_WIND_DEFLECTION_ALLOW_NON_LOCAL_BB = false;

private ["_args"];
_args = _this;

{
	if (_x select 0 == "forAI") then {
		CSE_WIND_DEFLECTION_EFFECT_AI_BB = _x select 1;
	};
	if (_x select 0 == "allowNonLocal") then {
		CSE_WIND_DEFLECTION_ALLOW_NON_LOCAL_BB = _x select 1;
	};

}foreach _args;

cse_basicBallistics_bulletDatabase = [];
cse_basicBallistics_bulletDatabaseLastFrame = [];
cse_basicBallistics_bulletDatabaseOccupiedIndices = [];
cse_basicBallistics_bulletDatabaseFreeIndices = [];

if (hasInterface) then {

	cse_fnc_checkWindDir_WIND = {
		private ["_windDir","_windSpeed"];

		if (vehicle player == player && [player] call cse_fnc_canInteract) then {
			if(windDir >= 340 && windDir <= 360 || windDir >= 0 && windDir <= 20) then {_windDir = "North";};
			if(windDir >= 20 && windDir <= 60) then {_windDir = "North East";};
			if(windDir >= 60 && windDir <= 110) then {_windDir = "East";};
			if(windDir >= 110 && windDir <= 160) then {_windDir = "South East";};
			if(windDir >= 160 && windDir <= 200) then {_windDir = "South";};
			if(windDir >= 200 && windDir <= 250) then {_windDir = "South West";};
			if(windDir >= 250 && windDir <= 290) then {_windDir = "West";};
			if(windDir >= 290 && windDir <= 340) then {_windDir = "North West";};
			hintSilent ("Wind Direction: "+ _windDir + "\nWind Strength: " + str floor(wind distance [0,0,0]) + "m/s");
			sleep 4;
			hintSilent "";
		};
	};

	//["check_wind_direction", (["check_wind_direction","action",[0,0,0,0]] call cse_fnc_getKeyBindingFromProfile_F), cse_fnc_checkWindDir_WIND] call cse_fnc_addKeyBindingForAction_F;
	//["check_wind_direction","action","Check Wind Direction","Displays a hint with the current wind direction and speed."] call cse_fnc_settingsDefineDetails_F;

	//["open_weather_meter", (["open_weather_meter","menu",[0,0,0,0]] call cse_fnc_getKeyBindingFromProfile_F), {if (([player,'cse_weather_meter'] call cse_fnc_hasMagazine)) then { createDialog "cse_weather_meter"; }; }, 65423] call cse_fnc_addKeyBindingForMenu_F;
	//["open_weather_meter","menu","Open the Weather Meter","When you have the weather meter in your inventory, pressing this key will open the menu, showing you the current weather information. "] call cse_fnc_settingsDefineDetails_F;

	waituntil{!isnil "cse_gui"};
	_entries = [
		["Weather Meter", {([player,'cse_weather_meter'] call cse_fnc_hasMagazine)}, "cse\cse_sys_ballistics\basicBallistics\data\icon_weather_meter.paa", { closeDialog 0; createDialog "cse_weather_meter"; }, "Use Weather Meter"]
	];
	["ActionMenu","equipment", _entries ] call cse_fnc_addMultipleEntriesToRadialCategory_F;
};
