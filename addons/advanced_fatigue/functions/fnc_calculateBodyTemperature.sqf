/*
* Author: Pasrules
* Calculates body temperature in degC, baseLine = 37
*
* Arguments:
* 0: bodyTemperature <NUMBER>
*
* Return Value:
* bodyTemperature <NUMBER>
*
*
* Example
* [37] call ace_advanced_fatigue_fnc_calculateBodyTemperature
*/

#include "script_component.hpp"
params ["_bodyTemp"];

if (["ACE_Weather"] call EFUNC(common,isModLoaded)) then {

    //Weather
    private _playerAltitude = (getPosASL ACE_player) select 2;
    private _temperature = _playerAltitude call EFUNC(weather,calculateTemperatureAtHeight);
    private _barometricPressure = _playerAltitude call EFUNC(weather,calculateBarometricPressure);
    private _airDensity = [_temperature, _barometricPressure, humidity] call EFUNC(weather,calculateAirDensity);
    private _windSpeed = [eyePos ACE_player, false, false, false] call EFUNC(weather,calculateWindSpeed);
    private _windFactor = linearConversion [0, 20, _windSpeed, 0, 1, true];

    //Body
    private _factors = [_bodyTemp] call FUNC(calculateBodyFactors);

    //Environment
    private _sun = 120 * (1 - overcast);
    private _air = (_temperature - MALE_TEMPERATURE) * E ^ _windFactor * _airDensity; //E is Euler number 2.718
    private _environment = (_sun + _air) * BODY_SURFACE_AREA;

    //Heating, muscles produce 80% waste heat
    private _speed = vectorMagnitude velocity ACE_player min 10;
    if ((vehicle ACE_player == ACE_player) || {getPos ACE_player select 2 > 10}) then { //check if in vehicle OR falling, lazy evaluation
        _speed = 0;
    };
    private _metabolicCosts = [ACE_player, _speed] call FUNC(getMetabolicCosts);
    private _metabolicFactor = linearConversion [0, 1200, _metabolicCosts, 0, 4, true];
    private _wasteHeat = (100 * _metabolicFactor * 4); // avg male output * activity * 4 parts waste (80%) 
    private _shiver = (_factors select 2);
    private _heat = (BASAL_METABOLIC_WATTAGE + _shiver + _wasteHeat);

    //Cooling
    private _sweat = _factors select 1;
    private _wet = (_sweat + rain) min 1;
    private _rainTemperature = linearConversion [0, 40, _temperature, 0, 27, true];
    private _coldRain = 10 * rain * 1000 * (MALE_TEMPERATURE - _rainTemperature) * WATER_CAPACITY / 3600; //wattage loss per gram of rain per second
    //Watts removed by evaporation per kilo of water per second per meter^2, 200 = MAGIC NUMBER FOR BALANCE *POOR THEORY SOMEWHERE*
    private _evaporation = _wet * (25 + 19 * _windSpeed) * (1 - humidity) / 3600 * EVAPORATION_WATER / 200;
    private _cooling = (_evaporation + _coldRain) * BODY_SURFACE_AREA;

    //Calculate body temperature
    _bodyTemp = _bodyTemp + (_environment + _heat - _cooling) * SKIN / MALE_CAPACITY;

};

_bodyTemp;
