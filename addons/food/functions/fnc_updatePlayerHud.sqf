/*
	File Name: fnc_updatePlayerHud.sqf
	Author: Jak Keen
*/

#include "../script_component.hpp"

private ["_ui", "_ctrlStatusFood", "_ctrlStatusDrink", "_ctrlStatusCamelbak", "_drinkStatus", "_foodStatus", "_camelbakStatus", "_foodColour", "_drinkColour", "_camelbakColour"];

disableSerialization;
_ui = uiNamespace getVariable "ACE_FoodStats";

if (!isNil "_ui") then {
    _ctrlStatusFood = _ui displayCtrl 11131;
    _ctrlStatusDrink = _ui displayCtrl 11132;
    _ctrlStatusCamelbak = _ui displayCtrl 11133;

    _foodStatus = GVAR(food);
    _drinkStatus = GVAR(water);
    _camelbakStatus = GVAR(camelbak);

    if (_foodStatus <= 32) then {
        _foodColour = [1, 0, 0, 1];
    };

    if (_foodStatus >= 33) then {
        _foodColour = [1, 0.576, 0.059, 1];
    };

    if (_foodStatus >= 66) then {
        _foodColour = [0, 1, 0, 1];
    };

    _ctrlStatusFood ctrlSetTextColor _foodColour;

    if (_drinkStatus <= 32) then {
        _drinkColour = [1, 0, 0, 1];
    };

    if (_drinkStatus >= 33) then {
        _drinkColour = [1, 0.576, 0.059, 1];
    };

    if (_drinkStatus >= 66) then {
        _drinkColour = [0, 1, 0, 1];
    };

    _ctrlStatusDrink ctrlSetTextColor _drinkColour;

    if(_camelbakStatus == 0) then {
        _ctrlStatusCamelbak ctrlShow false;
    } else {
        _ctrlStatusCamelbak ctrlShow true;
    };

    if (_camelbakStatus <= 32) then {
        _camelbakColour = [1, 0, 0, 1];
    };

    if (_camelbakStatus >= 33) then {
        _camelbakColour = [1, 0.576, 0.059, 1];
    };

    if (_camelbakStatus >= 66) then {
        _camelbakColour = [0, 1, 0, 1];
    };

    _ctrlStatusCamelbak ctrlSetTextColor _camelbakColour;
};