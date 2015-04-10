#include "script_component.hpp"

private ["_missile", "_headingPitch", "_found", "_vectorTo", "_polarTo", "_dir", "_vertOk", "_horzOk", "_fov",
         "_closestDistance", "_pos1", "_pos2", "_disCheck", "_currentTarget", "_potentialTargets", "_offset", "_vector"];
_missile = _this select 0;
_laserCode = _this select 1;
_fov = if (count _this > 2) then {_this select 2} else {75};
_vector = if (count _this > 3) then {_this select 3} else {vectorDir _missile};
_offset = if (count _this > 4) then {_this select 4} else {[0,0,0]};

_headingPitch = _vector call CBA_fnc_vect2polar;    
_currentTarget = nil;
_found = false;

LOG("Searching lasers");
if(!(isNil "ACE_LASERS")) then {
    _potentialTargets = [];
    TRACE_1("", ACE_LASERS);
    
    {
        if(!(isNull _x)) then {
            _sensorPos = ATLtoASL(_missile modelToWorldVisual _offset);
            _vectorTo = [_sensorPos, ([_x] call FUNC(getPosASL))] call BIS_fnc_vectorFromXToY;
            _polarTo = _vectorTo call CBA_fnc_vect2polar;
            _dir = _polarTo select 1;
            _dir = _dir - (_headingPitch select 1);
            
            TRACE_4("Calc", _sensorPos, _vectorTo, _polarTo, _dir);
            
            if (_dir < 0) then {_dir = _dir + 360};
            if (_dir > 360) then {_dir = _dir - 360};
            _vertOk = false;
            _horzOk = false;
            if(_dir < _fov || {_dir > (360-_fov)}) then {
                _horzOk = true;
            };
            if(abs((abs(_polarTo select 2))-(abs(_headingPitch select 2))) < _fov) then {
                _vertOk = true;
            };
            
            TRACE_2("Results", _vertOk, _horzOk);
            
            if(_vertOk && {_horzOk}) then {
                // Does the laser currently have our current code, if we have one?
                _targetCode = _x getVariable ["ACE_LASERTARGET_CODE", ACE_DEFAULT_LASER_CODE];
                TRACE_1("Target in sight, checking code", _targetCode, _laserCode);
                if(_targetCode == _laserCode) then {
                    _potentialTargets set[(count _potentialTargets), _x];
                };
            };
        };
        
    } forEach ACE_LASERS;
    
    TRACE_1("", _potentialTargets);
    
    _closestDistance = 100000;
    {
        _pos1 = (getPosASL _missile);
        _pos2 = ([_x] call FUNC(getPosASL));
        _disCheck = _pos1 distance _pos2;
        // shouldn't this bail out when a valid target is found instead of iterating over all potential targets ?
        if(_disCheck < _closestDistance && {[_pos1, _pos2, _x, _missile] call FUNC(checkLos)}) then {
            _found = true;
            _currentTarget = _x;
            _closestDistance = _disCheck;
        };
    } forEach _potentialTargets;
};
[_found, _currentTarget]