//fnc_doSpall.sqf
#include "script_component.hpp"
// ACE_player sideChat "WAAAAAAAAAAAAAAAAAAAAA";    

private ["_hitData", "_initialData", "_hpData", "_object", "_foundObjects", "_index", "_foundObjecsts", "_roundType", "_round", "_caliber", "_explosive", "_idh", "_alive", "_exit", "_vm", "_velocity", "_oldVelocity", "_curVelocity", "_diff", "_polar", "_unitDir", "_spallPos", "_pos1", "_i", "_pos2", "_blah", "_data", "_spallPolar", "_warn", "_c", "_m", "_k", "_gC", "_fragPower", "_fragTypes", "_spread", "_spallCount", "_elev", "_dir", "_vel", "_spallFragVect", "_fragType", "_fragment", "_pos"];

_hitData = _this select 0;
_initialData = GVAR(spallHPData) select (_hitData select 0);
_hpData = (_hitData select 1) select (_this select 1);


_object = _hpData select 0;
_object removeEventHandler ["hitPart", _initialData select 0];
_foundObjects = _initialData select 7;
_index = _foundObjects find _object;
if(_index != -1) then {
    _foundObjecsts set[_index, nil];
};

_roundType = (_initialData select 2);
_round = (_initialData select 3);
_object = (_initialData select 1);

_caliber = getNumber(configFile >> "CfgAmmo" >> _roundType >> "caliber");
_explosive = getNumber(configFile >> "CfgAmmo" >> _roundType >> "explosive");
_idh = getNumber(configFile >> "CfgAmmo" >> _roundType >> "indirectHitRange");

_alive = true;
if(!alive _round && (_initialData select 6) == 1) then {
    _alive = false;
};

if(_alive || {_caliber >= 2.5} || {(_explosive > 0 && {_idh >= 1})}) then {
    // ACE_player sideChat format["BBBB"];
    _exit = false;
    _vm = 1;
    _velocity = _initialData select 5;

    _oldVelocity = vectorMagnitude _velocity;
    _curVelocity = vectorMagnitude (velocity _round);

    if(alive _round) then {
        _diff = _velocity vectorDiff (velocity _round);
        _polar = _diff call CBA_fnc_vect2polar;
        // ACE_player sideChat format["polar: %1", _polar];
        if((abs(_polar select 1) > 45 || abs(_polar select 2) > 45)) then {
            if(_caliber < 2.5) then {
                // ACE_player sideChat format["exit!"];
                _exit = true;
            } else {
                _vm = 1-(_curVelocity/_oldVelocity);
            };
        };
    };
    if(!_exit) then {
        _unitDir = vectorNormalized _velocity;
        _pos = _hpData select 3;
        _spallPos = nil;
        for "_i" from 0 to 100 do {
            _pos1 = _pos vectorAdd (_unitDir vectorMultiply (0.01 * _i));
            _pos2 = _pos vectorAdd (_unitDir vectorMultiply (0.01 * (_i + 1)));
            // _blah = [_object, "FIRE"] intersect [_object worldToModel (ASLtoATL _pos1), _object worldToModel (ASLtoATL _pos2)];
            // diag_log text format["b: %1", _blah];

            // _data = [nil, nil, nil, 1, [[ASLtoATL _pos1, 1], [ASLtoATL _pos2, 1]]];
            // NOU_TRACES set[(count NOU_TRACES), _data];

            if(!lineIntersects [_pos1, _pos2]) exitWith {
                // ACE_player sideChat format["FOUND!"];
                _spallPos = _pos2;
            };
        };
        if(!isNil "_spallPos") then {
            _spallPolar = _velocity call CBA_fnc_vect2polar;

            if(_explosive > 0) then {
                // ACE_player sideChat format["EXPLOSIVE!"];
                _warn = false;
                _c = getNumber(configFile >> "CfgAmmo" >> _roundType >> "ACE_frag_CHARGE");
                if(_c == 0) then { _c = 1; _warn = true;};
                _m = getNumber(configFile >> "CfgAmmo" >> _roundType >> "ACE_frag_METAL");
                if(_m == 0) then { _m = 2; _warn = true;};
                _k = getNumber(configFile >> "CfgAmmo" >> _roundType >> "ACE_frag_GURNEY_K");
                if(_k == 0) then { _k = 1/2; _warn = true;};
                _gC = getNumber(configFile >> "CfgAmmo" >> _roundType >> "ACE_frag_GURNEY_C");
                if(_gC == 0) then { _gC = 2440; _warn = true;};

                if(_warn) then {
                    diag_log text format["Ammo class %1 lacks proper explosive properties definitions for frag!", _roundType]; //TODO: turn this off when we get closer to release
                };

                _fragPower = (((_m/_c)+_k)^-(1/2))*_gC;
                _spallPolar set[0, _fragPower*0.66];
            };

            _fragTypes = [
                "ACE_frag_spall_small", "ACE_frag_spall_small", "ACE_frag_spall_small",
                "ACE_frag_spall_small","ACE_frag_spall_medium","ACE_frag_spall_medium","ACE_frag_spall_medium",
                "ACE_frag_spall_medium", "ACE_frag_spall_large", "ACE_frag_spall_large", "ACE_frag_spall_huge",
                "ACE_frag_spall_huge"

            ];

            // diag_log text format["SPALL POWER: %1", _spallPolar select 0];
            _spread = 15+(random 25);
            _spallCount = 5+(random 10);
            for "_i" from 1 to _spallCount do {
                _elev = ((_spallPolar select 2)-_spread)+(random (_spread*2));
                _dir = ((_spallPolar select 1)-_spread)+(random (_spread*2));
                if(abs _elev > 90) then {
                    _dir = _dir + 180;
                };
                _dir = _dir % 360;
                _vel = (_spallPolar select 0)*0.33*_vm;
                _vel = (_vel-(_vel*0.25))+(random (_vel*0.5));

                _spallFragVect = [_vel, _dir, _elev] call CBA_fnc_polar2vect;
                _fragType = round (random ((count _fragTypes)-1));
                _fragment = (_fragTypes select _fragType) createVehicleLocal [0,0,10000];
                _fragment setPosASL _spallPos;
                _fragment setVelocity _spallFragVect;

                if(GVAR(traceFrags)) then {
                    [ACE_player, _fragment, [1,0.5,0,1]] call FUNC(addTrack);
                };
            };
            _spread = 5+(random 5);
            _spallCount = 3+(random 5);
            for "_i" from 1 to _spallCount do {
                _elev = ((_spallPolar select 2)-_spread)+(random (_spread*2));
                _dir = ((_spallPolar select 1)-_spread)+(random (_spread*2));
                if(abs _elev > 90) then {
                    _dir = _dir + 180;
                };
                _dir = _dir % 360;
                _vel = (_spallPolar select 0)*0.55*_vm;
                _vel = (_vel-(_vel*0.25))+(random (_vel*0.5));

                _spallFragVect = [_vel, _dir, _elev] call CBA_fnc_polar2vect;
                _fragType = round (random ((count _fragTypes)-1));
                _fragment = (_fragTypes select _fragType) createVehicleLocal [0,0,10000];
                _fragment setPosASL _spallPos;
                _fragment setVelocity _spallFragVect;

                if(GVAR(traceFrags)) then {
                    [ACE_player, _fragment, [1,0,0,1]] call FUNC(addTrack);
                };
            };
        };
    };
};
