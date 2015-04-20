//#define DEBUG_MODE_FULL
#include "script_component.hpp"

EXPLODE_7_PVT(((_this select 1) select 0),_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);
private["_seekerProfilePos", "_i", "_launchParams", "_seekerType", "_seekerTypeName", "_seekerTypesCfg", "_testName", "_testProfile"];

_launchParams = ((_this select 1) select 1);
_seekerTypeName = _launchParams select 2;

TRACE_1("Seeker type", _seekerTypeName);

_seekerTypesCfg = ( configFile >> QGVAR(SeekerTypes) );

_seekerType = nil;
for [{_i=0}, {_i< (count _seekerTypesCfg) }, {_i=_i+1}] do {
    _testProfile = _seekerTypesCfg select _i;
    _testName = configName _testProfile;
    TRACE_3("", _testName, _testProfile, _seekerTypesCfg);
    
    if( _testName == _seekerTypeName) exitWith {
        _seekerType = _seekerTypesCfg select _i;
    };
};

_seekerProfilePos = [0,0,0];
if(!isNil "_seekerType") then {
    _seekerProfilePos = _this call (missionNamespace getVariable (getText (_seekerType >> "functionName")));
};

_seekerProfilePos;