#include "script_component.hpp"

BEGIN_COUNTER(shootRay);
private ["_pos", "_vec", "_distance", "_resultPos", "_fidelity", "_lastPos", "_i", "_nextPos"];
scopeName "main";
_pos = _this select 0;
_vec = _this select 1;
TRACE_2("ray origin:", _pos, _vec);
_distance = 0;
_resultPos = nil;
_fidelity = [1000,100,10,1,0.1];
_lastPos = +_pos;
{
    scopeName "mainSearch";
    for "_i" from 1 to 10 do {
        _nextPos = _lastPos vectorAdd (_vec vectorMultiply _x);
        if(terrainIntersectASL [_lastPos, _nextPos] || {lineIntersects [_lastPos, _nextPos]}) then {
            _resultPos = _lastPos;
            breakTo "mainSearch";
        } else {
            _distance = _distance + _x;
            _lastPos = _nextPos;
        };
    };
} forEach _fidelity;

TRACE_2("ray result:", _resultPos, _distance);

#ifdef DEBUG_MODE_FULL
if !(isNil "_resultPos") then {
    //drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1, 0, 0, 1], ASLtoAGL _resultPos, 0.75, 0.75, 0, "", 0.5, 0.025, "TahomaB"];
} else {
};
#endif

END_COUNTER(shootRay);
[_resultPos, _distance];
