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
    private _air = (_temperature - MALE_TEMPERATURE) * E ^ _windFactor * _airDensity;
    private _environment = (_sun + _air) * BODY_SURFACE_AREA;

    //Heating, muscles produce 80% waste heat
    private _speed = vectorMagnitude velocity player min 10;
    private _metabolicCosts = [player, _speed] call FUNC(getMetabolicCosts);
    private _metabolicCosts = linearConversion [0, 1200, _metabolicCosts, 0, 1.4, true];
    private _metabolism = BASAL_METABOLIC_WATTAGE * (1 + _metabolicCosts);
    private _wasteHeat = (150 * _metabolicCosts * 4); //male output * cost * 4 
    private _shiver = _factors select 2;
    private _heat = (_metabolism + _shiver + _wasteHeat);

    //Cooling
    private _sweat = _factors select 1;
    private _wet = (_sweat + rain) min 1;
    private _cooling = (100 - humidity) * E ^ (_wet + _windFactor) * BODY_SURFACE_AREA / _airDensity; //2.718 is Euler constant

    //Calculate body temperature
    private _watt = (MALE_WEIGHT) * WATER; //energy to heat body 1degC in 1 second
    _bodyTemp = _bodyTemp + (_environment + _heat - _cooling) * SKIN / _watt;

};

_bodyTemp;
