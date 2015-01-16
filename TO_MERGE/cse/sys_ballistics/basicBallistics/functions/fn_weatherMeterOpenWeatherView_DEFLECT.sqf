/**
 * fn_weatherMeterOpenWeatherView_DEFLECT.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_display","_backgroundCtrl","_categoryCtrl","_lineOneCtrl", "_lineTwoCtrl","_LineThreeCtrl", "_textLineOne","_textLineTwo"];

disableSerialization;
_display = uiNamespace getvariable "cse_weather_meter";

_backgroundCtrl = _display displayCtrl 1;
_categoryCtrl = _display displayCtrl 10;
_lineOneCtrl = _display displayCtrl 11;
_lineTwoCtrl = _display displayCtrl 12;
_LineThreeCtrl = _display displayCtrl 13;

_categoryCtrl ctrlSetText (localize "STR_CSE_WEATHER_METER_WEATHER_CATEGORY");

_textLineOne = format [ localize "STR_CSE_WEATHER_METER_WEATHER_HUMIDITY", floor (humidity * 100)];

_lineOneCtrl ctrlSetText _textLineOne;
_lineTwoCtrl ctrlSetText "";
_LineThreeCtrl ctrlSetText "";