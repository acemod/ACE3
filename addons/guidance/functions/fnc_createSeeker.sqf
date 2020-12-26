#include "script_component.hpp"

params ["_object", "_weapon", "_magazine", "_seekerType"];


////
//["_object", "_weapon", "_magazine", "_seekerType", "_enabled", "_seekerDirection", "_seekerLookVector", "_seekerLookDirection", "_caged", "_slaves", "_tracking", "_launched", "_lastSeekerReturns", "_sensorArray", "_seekerEH", "_seekerMisc"];
//_lastSeekerReturns params ["_lastSeekerReturnVector", "_lastSeekerReturnPos", "_lastSeekerReturnDir", "_lastSeekerReturnRelPos"];

private _ammo = getText (configFile >> "CfgMagazines" >> _magazine >> "ammo");
private _ammoCfg = configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON);
private _seekerCfg = configFile >> QGVAR(SeekerTypes) >> _seekerType;




private _enabled = false;
private _seekerDirection = [0, 1, 0];
if(count (getArray (_ammoCfg >> "seekerDirection")) > 0) then {
    _seekerDirection = getArray (_ammoCfg >> "seekerDirection");
};

private _seekerLookVector = _object vectorModelToWorldVisual _seekerDirection;
private _seekerLookDirection = +_seekerDirection;
private _caged = true;
private _slaves = getArray (_seekerCfg >> "slaves");
private _tracking = false;
private _launched = false;

private _lastSeekerReturnVector = [0, 0, 0];
private _lastSeekerReturnPos = [0, 0, 0];
private _lastSeekerReturnDir = [0, 0, 0];
private _lastSeekerReturnRelPos = [0, 0, 0];

private _lastSeekerReturns = [_lastSeekerReturnVector, _lastSeekerReturnPos, _lastSeekerReturnDir, _lastSeekerReturnRelPos];

private _sensorArray = [];
private _seekerMisc = [];


//DETERMINE WHICH SENSORS TO MAKE;
//hint str _seekerTypes;
//returns types of sensors
private _sensorsToMake = getArray (_seekerCfg >> "sensors");

//CREATE SENSORS
{
    private _return = [_object,_weapon,_magazine,_seekerDirection, _x] call FUNC(createSensor);
    if(count _return > 0) then {
        _sensorArray pushBack _return;
    };
} forEach _sensorsToMake;

private _seekerParams = [_object, _weapon, _magazine, _seekerType, _enabled, _seekerDirection, _seekerLookVector, _seekerLookDirection, _caged, _slaves, _tracking, _launched, [_lastSeekerReturnVector, _lastSeekerReturnPos, _lastSeekerReturnDir, _lastSeekerReturnRelPos], _sensorArray, [], _seekerMisc];
//hint str _seekerParams;

if(count _sensorArray < 1) exitWith {[]};

GVAR(seekers) pushback _seekerParams;

_seekerParams
