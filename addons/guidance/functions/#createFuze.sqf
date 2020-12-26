#include "script_component.hpp"

params ["_object", "_type"];

//params ["_object", "_armed", "_types"]

//armAlt arms when BELOW, armHeight arms when ABOVE
//_armed params ["_armStatus", "_armTime", "_armDist", "_armAlt", "_armHeight"];
private _armStatus = false;

private _cfg = configFile >> QGVAR(FuzeTypes) >> _type;
private _armTime = getNumber (_cfg >> "armTime"); 
private _armDist = getNumber (_cfg >> "armDist"); 
private _armAlt = getNumber (_cfg >> "armAlt"); 
private _armHeight = getNumber (_cfg >> "armHeight"); 

private _clock = getArray (_cfg >> "clock");
private _dist = getArray (_cfg >> "distance");
private _proximity = getArray (_cfg >> "proximity");
private _delay = getArray (_cfg >> "delay");
private _altitude = getArray (_cfg >> "altitude");

private _seekerVars = getArray (_cfg >> "seeker");

if(isNil "_armTime") then {
    _armTime = 0;    
};
if(isNil "_armDist") then {
    _armDist = 15;
};
if(isNil "_armAlt") then {
    _armAlt = 0;
};
if(isNil "_armHeight") then {
    _armHeight = 0;
};

if(isNil "_clock") then {
    _clock = [0, time];    
};
if(isNil "_dist") then {
    _dist = [0, []];
};
if(isNil "_proximity") then {
    _proximity = [0];
};
if(isNil "_delay") then {
    _delay = [0];
};
if(isNil "_altitude") then {
    _altitude = [0, false];
};

/*
private _seeker = [];
if(!isNil _seekerVars) then {
    _seeker = [_object, _seekerType]; 
};
*/

_clock set [1, time];
_dist set [1, _object modelToWorldVisualWorld [0, 0, 0]];

_types params ["_clock", "_distance", "_proximity", "_delay", "_altitude", "_seeker"];
_clock params ["_duration", "_startTime"];
_dist params ["_distance", "_startPos"];
_proximity params ["_proxDistance"];
_delay params ["_delayTime"];
_altitude params ["_burstHeight", "_above"];





