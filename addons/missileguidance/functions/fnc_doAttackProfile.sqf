//#define DEBUG_MODE_FULL
#include "script_component.hpp"

EXPLODE_7_PVT(((_this select 1) select 0),_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);
private["_testName", "_attackProfilePos", "_attackProfile", "_attackProfileName", "_attackProfilesCfg", "_i", "_launchParams", "_testame", "_testProfile"];
_launchParams = ((_this select 1) select 1);
_attackProfileName = _launchParams select 3;

TRACE_1("Attacking profile", _attackProfileName);

_attackProfilesCfg = ( configFile >> QGVAR(AttackProfiles) );

_attackProfile = nil;
for [{_i=0}, {_i< (count _attackProfilesCfg) }, {_i=_i+1}] do {
    _testProfile = _attackProfilesCfg select _i;
    _testName = configName _testProfile;
    TRACE_3("", _testName, _testProfile, _attackProfilesCfg);
    
    if( _testName == _attackProfileName) exitWith {
        _attackProfile = _attackProfilesCfg select _i;
    };
};

_attackProfilePos = [0,0,0];
if(!isNil "_attackProfile") then {
    _attackProfilePos = _this call (missionNamespace getVariable (getText (_attackProfile >> "functionName")));
};

_attackProfilePos;