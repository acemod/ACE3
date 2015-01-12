/**
 * fn_reduceLevels_FR.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_absSpeed", "_camelbak_state","_decentWater","_decentFood", "_unit"];
_unit = _this select 0;

_drinkStatus = _unit getvariable ["cse_drink_status_fr", 100];
_foodStatus = _unit getvariable ["cse_food_status_fr", 100];

_absSpeed = abs(speed _unit);

_decentWater = CSE_DESCENT_RATE_WATER_FR;
_decentFood = CSE_DESCENT_RATE_FOOD_FR;

// TODO add in weight calculation and effect
// If _unit is inside a vehicle, adjust waterlevels
if (vehicle _unit == _unit) then {
	if (_absSpeed > 1) then {
		_decentWater = _decentWater + (_absSpeed / 400);
		_decentFood = _decentFood + (_absSpeed / 1200);
	};
};
if ([_unit] call cse_fnc_hasCamelbak_FR) then {
	_camelbak_state = (uniformContainer _unit) getvariable ["cse_camelbak_status_fr", [(uniformContainer _unit)] call cse_fnc_getInitialContent_Camelbak_FR];
	if (_camelbak_state > 0) then {
		(uniformContainer _unit) setvariable ["cse_camelbak_status_fr", _camelbak_state - _decentWater];
	} else {
		_unit setvariable ["cse_drink_status_fr", _drinkStatus - _decentWater];
	};
} else {
	_unit setvariable ["cse_drink_status_fr", _drinkStatus - _decentWater];
};
_unit setvariable ["cse_food_status_fr", _foodStatus - _decentFood];