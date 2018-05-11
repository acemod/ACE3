/*
	File Name: fnc_updatePlayerHud.sqf
	Author: Jak Keen
*/

#include "script_component.hpp"

private ["_ui", "_ctrlStatusFood", "_ctrlStatusDrink", "_ctrlStatusCamelbak", "_yellow", "_alpha", "_foodGreen", "_foodRed", "_drinkGreen", "_drinkRed", "_camelGreen", "_camelRed"];

disableSerialization;
_ui = uiNamespace getVariable "ACE_FoodStats";

if (!isNil "_ui") exitWith {
    _ctrlStatusFood = _ui displayCtrl 11131;
    _ctrlStatusDrink = _ui displayCtrl 11132;
    _ctrlStatusCamelbak = _ui displayCtrl 11133;

    _yellow = 0;
    _alpha = 0.75;

    _foodGreen = GVAR(food) / 100;
    _foodRed = 1 - _foodGreen;

    _ctrlStatusFood ctrlSetTextColor [_foodRed, _foodGreen, _yellow, _alpha];

    _drinkGreen = GVAR(water) / 100;
    _drinkRed = 1 - _drinkGreen;

    _ctrlStatusDrink ctrlSetTextColor [_drinkRed, _drinkGreen, _yellow, _alpha];

    _camelGreen = GVAR(camelbak) / 100;
    _camelRed = 1 - _camelGreen;

    if([] call FUNC(hasCamelbak)) then {
        _alpha = 0.75;
    } else {
        _alpha = 0;
    };

    _ctrlStatusCamelbak ctrlSetTextColor [_camelRed, _camelGreen, _yellow, _alpha];
};