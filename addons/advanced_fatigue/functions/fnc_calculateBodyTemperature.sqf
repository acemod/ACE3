/*
* Author: Pasrules
* Calculates body temperature in degC, normal = 37
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
    private _humidity = humidity;
    private _barometricPressure = _playerAltitude call EFUNC(weather,calculateBarometricPressure);
    private _airDensity = [_temperature, _barometricPressure, _humidity] call EFUNC(weather,calculateAirDensity);
    private _windSpeed = [eyePos ACE_player, false, false, false] call EFUNC(weather,calculateWindSpeed);
    private _windFactor = linearConversion [0, 20, _windSpeed, 0, 1, true];

    //Average male [kg, cm, degC]
    private _male = [87,177,37];
    private _bodyWeight = _male select 0;
    private _bodyHeight = _male select 1;
    private _normalTemp = _male select 2;
    private _skin = 0.5; //skin conductance factor
    private _capacity = _skin / (_bodyWeight * 4.18); //specific heat capacity of the body
    private _surfaceArea = sqrt (_bodyWeight * _bodyHeight / 3600); //BodySA = SQRT(kg*cm/3600)
	

    //Environment
    private _sun = 120 * (1 - overcast);
    private _air = (_temperature - _normalTemp) * 2.718 ^ _windFactor * _airDensity;
    private _environment = (_sun + _air) * _surfaceArea;

    //Heating, BMR - basal metabolic rate, muscles produce 80% waste heat
    private _BMR = (10 * _bodyWeight + 6.25 * _bodyHeight + 5 * 21 + 5) * 0.048; //Mifflin St Jeor Equation to watts
    private _speed = vectorMagnitude velocity player;
    if ((getPos player select 2) > 10) then { //check if falling
        _speed = 3;
    };
    private _metabolicCosts = [player, _speed] call FUNC(getMetabolicCosts);
    private _metabolicCosts = linearConversion [0, 1200, _metabolicCosts, 0, 1.4, true];
    private _metabolism = _BMR * (1 + _metabolicCosts);
    private _wasteHeat = (150 * _metabolicCosts * 4); //male output * cost * 4 
    private _shiver = [_bodyTemp] call FUNC(calculateBodyShiver);
    private _heat = (_metabolism + _shiver + _wasteHeat);

    //Cooling
    private _sweat = [_bodyTemp] call FUNC(calculateBodySweat);
    private _wet = _sweat + rain;
    if (_wet > 1) then { //check saturated
        _wet = 1;
    };

    private _cooling = (100 - _humidity) * 2.718 ^ (_wet + _windFactor) * _surfaceArea / _airDensity; //2.718 is Euler constant

    //Calculate body temperature
    private _watt = (_bodyWeight) * 4.18; //energy to heat body 1degC in 1 second
    _bodyTemp = _bodyTemp + (_environment + _heat - _cooling) * _capacity / _watt;

};

_bodyTemp;