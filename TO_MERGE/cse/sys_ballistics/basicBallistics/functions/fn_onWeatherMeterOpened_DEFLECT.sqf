/**
 * fn_onWeatherMeterOpened_DEFLECT.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

if (isnil "CSE_WEATHER_METER_CURRENT_SCREEN_DEFLECT") then {
	CSE_WEATHER_METER_CURRENT_SCREEN_DEFLECT = "WIND_VIEW";
};
if (isnil "CSE_WEATHER_METER_IS_OPEN_DEFLECT") then {
	CSE_WEATHER_METER_IS_OPEN_DEFLECT = false;
};

while { CSE_WEATHER_METER_IS_OPEN_DEFLECT } do {
	switch (CSE_WEATHER_METER_CURRENT_SCREEN_DEFLECT) do {
		case "WEATHER_VIEW":  {[] call cse_fnc_weatherMeterOpenWeatherView_DEFLECT;};
		case "WIND_VIEW": { [] call cse_fnc_weatherMeterOpenWindView_DEFLECT;};
		default {};
	};
	uisleep 1;

};