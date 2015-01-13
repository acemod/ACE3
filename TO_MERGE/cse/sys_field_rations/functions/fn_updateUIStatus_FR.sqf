/**
 * fn_updateUIStatus_FR.sqf
 * @Descr: Updates the UI icons for field rations, based on player stats.
 * @Author: Glowbal
 *
 * @Arguments: [skipCheck BOOL (Whatever or not checks for display should be skipped. True will force display)]
 * @Return:  void
 * @PublicAPI: true
 */

#define DEFAULT_ALPHA_LEVEL 0.4

private ["_unit","_PlayerStatusUI","_ctrlPlayerStatusDrink", "_ctrlPlayerStatusFood", "_ctrlCamelBakStatus", "_alphaCamelBak", "_drinkStatus","_foodStatus","_camelbakStatus", "_greenCamelBak", "_greenDrink", "_greenFood", "_yellowFood","_yellowDrink","_yellowCamelBak", "_redFood", "_redDrink", "_redCamelBak"];

_skipChecks = [_this, 0, false, [false]] call BIS_fnc_Param;

if !(hasInterface) exitwith {};
_unit = player;
disableSerialization;
_PlayerStatusUI = uiNamespace getVariable "CSE_sys_field_rations_PlayerStatusUI";
if (!isnil "_PlayerStatusUI") then {
	_ctrlPlayerStatusDrink = _PlayerStatusUI displayCtrl 11113;
	_ctrlPlayerStatusFood = _PlayerStatusUI displayCtrl 11112;
	_ctrlCamelBakStatus = _PlayerStatusUI displayCtrl 11114;

	_drinkStatus = _unit getvariable ["cse_drink_status_fr", 100];
	_foodStatus = _unit getvariable ["cse_food_status_fr", 100];
	_camelbakStatus = _unit getvariable ["cse_camelbak_status_fr", 0];

	if (CSE_SHOW_UI_ICONS_FR || CSE_SHOW_UI_ICONS_ONACTION_FR || CSE_SHOW_UI_ICONS_SETTING_FR || ((_drinkStatus < 30) || (_foodStatus < 30))) then {
		_alphaCamelBak = 0;
		if ([_unit] call cse_fnc_hasCamelbak_FR) then {
			_alphaCamelBak = DEFAULT_ALPHA_LEVEL;
		};

		_greenCamelBak = _camelbakStatus/100;
		_redCamelBak = 1.0 - _greenCamelBak;
		_yellowCamelBak = 0;
		_ctrlCamelBakStatus ctrlSetTextColor [_redCamelBak,_greenCamelBak,_yellowCamelBak, _alphaCamelBak];

		_greenFood = _foodStatus/100;
		_redFood = 1.0 - _greenFood;
		_yellowFood = 0;
		_ctrlPlayerStatusFood ctrlSetTextColor [_redFood,_greenFood,_yellowFood, DEFAULT_ALPHA_LEVEL];

		_greenDrink = _drinkStatus/100;
		_redDrink = 1.0 - _greenDrink;
		_yellowDrink = 0;
		_ctrlPlayerStatusDrink ctrlSetTextColor [_redDrink,_greenDrink,_yellowDrink, DEFAULT_ALPHA_LEVEL];
	} else {
		_ctrlCamelBakStatus ctrlSetTextColor [0, 0, 0, 0];
		_ctrlPlayerStatusFood ctrlSetTextColor [0, 0, 0, 0];
		_ctrlPlayerStatusDrink ctrlSetTextColor [0, 0, 0, 0];
	};
	if (!_skipChecks) then {
		if (CSE_SHOW_UI_ICONS_ONACTION_FR) then {
			CSE_SHOW_UI_ICONS_ONACTION_FR = false;
		};
	};
};