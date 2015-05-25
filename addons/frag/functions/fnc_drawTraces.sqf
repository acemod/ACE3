#include "script_component.hpp"

private ["_color", "_index", "_lastPos", "_lastSpd", "_max", "_positions", "_startSpeed"];

{
    _positions = _x select 4;
    _color = _x select 5;
    _index = 0;
    _max = count _positions;
    _startSpeed = 0.01 max ((_positions select 0) select 1);
    _lastSpd = [];
    _lastPos = [];
    while {_index < _max} do {
        _data1 = _positions select _index;
        _data2 = nil;
        if(_index + ACE_TRACE_DRAW_INC >= _max) then {
            _data2 = _positions select (_max - 1);
        } else {
            _data2 = _positions select (_index + ACE_TRACE_DRAW_INC);
        };
        
        _pos1 = _data1 select 0;
        _pos2 = _data2 select 0;
        _index = _index + ACE_TRACE_DRAW_INC;
        
        
        drawLine3D [_pos1, _pos2, _color];
        _lastPos = _pos2;
        _lastSpd = _data1 select 1;
    };
    // drawIcon3D ["", [1,0,0,1], _lastPos, 0, 0, 0, format["%1m/s", _lastSpd], 1, 0.05, "PuristaMedium"];
} forEach GVAR(traces);
