/**
 * fn_updateFieldRations_FR.sqf
 * @Descr: Updates the hydration and hunger levels for given unit and if the unit is the player, it will also give a call to the UI icons from Field Rations.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT (The unit that will have the levels updated)]
 * @Return: void
 * @PublicAPI: false
 */

private ["_unit", "_drinkStatus","_foodStatus","_camelbakStatus", "_animState", "_aniMStateChars", "_animP"];
_unit = _this select 0;
[_unit] call cse_fnc_reduceLevels_FR;
_drinkStatus = _unit getvariable ["cse_drink_status_fr", 100];
_foodStatus = _unit getvariable ["cse_food_status_fr", 100];
_camelbakStatus = _unit getvariable ["cse_camelbak_status_fr", 0];
//[format["drink: %1 Food: %2 Camelbak: %3 - %4", _drinkStatus, _foodStatus, _camelbakStatus, _unit]] call cse_fnc_debug;

[] call cse_fnc_updateUIStatus_FR;
if (_drinkStatus < 25 || _foodStatus < 25) then {
	if (speed _unit > 12 && vehicle _unit == _unit) then {
		_unit playMove "amovppnemstpsraswrfldnon";
	};
};

if (_drinkStatus < 30 || _foodStatus < 30) then {
	CSE_SHOW_UI_ICONS_FR = true;
} else {
	CSE_SHOW_UI_ICONS_FR = false;
};

if (_drinkStatus < 20 || _foodStatus < 20) then {
	if (random(1) > 0.8) then {
		[_unit] call cse_fnc_setUnconsciousState;
	};
};

_animState = animationState _unit;
_animStateChars = toArray _animState;
_animP = toString [_animStateChars select 5,_animStateChars select 6,_aniMStateChars select 7];


if (_drinkStatus < 7 || _foodStatus < 7) then {
	if (speed _unit > 1 && vehicle _unit == _unit && (_animP != "pne")) then {
		_unit playMove "amovppnemstpsraswrfldnon";
	};
};

if (_drinkStatus < 1 || _foodStatus < 1) then {
	if (random(1) > 0.2) then {
		[_unit] call cse_fnc_setDead;
	};
};