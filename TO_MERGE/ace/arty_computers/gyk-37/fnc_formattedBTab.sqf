#include "script_component.hpp"
// ARTY_generateFormattedBTab.sqf
//
// Generates a formatted ballistic table in SQF and copies to clipboard -- For use by designers & config makers.

private ["_magazine", "_elevMin", "_elevMax", "_elevStep", "_heightMin", "_heightMax", "_heightStep", "_mv", "_airFriction", "_proxy", "_ammo", "_btab", "_rangeMin", "_rangeMax"];

_magazine = _this select 0;
_elevMin = _this select 1;
_elevMax = _this select 2;
_elevStep = _this select 3;
_heightMin = _this select 4;
_heightMax = _this select 5;
_heightStep = _this select 6;

hint "4...";
_ammo = getText(configFile >> "CfgMagazines" >> _magazine >> "ammo");
_proxy = getText(configFile >> "CfgAmmo" >> _ammo >> "ARTY_ReplaceWithAmmo");
_mv = getNumber(configFile >> "CfgMagazines" >> _magazine >> "initSpeed");


// Normal artillery shell calculation
_ammo = getText(configFile >> "CfgMagazines" >> _magazine >> "ammo");
_airFriction = getNumber(configFile >> "CfgAmmo" >> _ammo >> "airFriction");
hint "2...";
PREP(calcBallistics);
_btab = [_magazine, _elevMin, _elevMax, _elevStep, _heightMin, _heightMax, _heightStep] call FUNC(calcBallistics);

_btab = _btab select 0;

hint "1...";
 
// Calculate min and max range based on median offset.
_mo = floor(((_heightMax - _heightMin) / _heightStep)*0.5);
_rangeMin = 999999;
_rangeMax = -1;
for [{_i=0;},{_i < count(_btab)},{_i=_i+1;}] do
{
    _slice = (_btab select _i) select 2;
    if (count _slice >= (_mo+1)) then
    {
        _range = (_slice select _mo) select 0;
        if (_range < _rangeMin) then {_rangeMin = _range;};
        if (_range > _rangeMax) then {_rangeMax = _range;};
    };
};

// Generate SQF
_sqf = "";
_sqf = _sqf + format ["// ARTY+ACE Module ballistics table.%1// Magazine: %2%1// Ammo: %3%1// AirFriction: %4%1%1%private [""_btab"", ""_minRange"", ""_maxRange"", ""_minHeight"", ""_maxHeight"", ""_hstep""];%1%1", ToString [10], _magazine, _ammo, _airFriction];
_sqf = _sqf + format ["_btab = [%1", ToString[10]];
for [{_i=0;},{_i < count(_btab);},{_i=_i+1;}] do
{
    _tail = ",";
    if (_i == (count(_btab) - 1)) then
    {
        _tail = "";
    };
    _sqf =_sqf + format ["     %1%2%3", (_btab select _i), _tail, ToString [10] ];
};
_sqf = _sqf + format ["];%1%1",ToString [10]];
_sqf = _sqf + format ["_minHeight = %1;%2", _heightMin, ToString[10]];
_sqf = _sqf + format ["_maxHeight = %1;%2", _heightMax, ToString[10]];
_sqf = _sqf + format ["_hstep = %1;%2", _heightStep, ToString[10]];
_sqf = _sqf + format ["_minRange = %1;%2", _rangeMin, ToString[10]];
_sqf = _sqf + format ["_maxRange = %1;%2", _rangeMax, ToString[10]];

_sqf = _sqf + format ["[_btab, _minRange, _maxRange, _minHeight, _maxHeight, _hstep]%1",ToString[10]];

hint "0";

copyToClipboard _sqf;
GVAR(FORMATTEDBTAB) = _sqf;
