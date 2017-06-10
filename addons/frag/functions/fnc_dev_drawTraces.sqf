/*
 * Author: ACE-Team
 *
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_frag_fnc_drawTraces
 *
 * Public: No
 */

#include "script_component.hpp"

{
    _x params ["", "", "", "", "_positions", "_color"];
    private _index = 0;
    private _max = count _positions;
    // private _lastSpd = [];
    private _lastPos = [];
    while {_index < _max} do {
        _data1 = _positions select _index;
        _data2 = _positions select ([_index + ACE_TRACE_DRAW_INC, _max - 1] select (_index + ACE_TRACE_DRAW_INC >= _max));

        _pos1 = _data1 select 0;
        _pos2 = _data2 select 0;
        ADD(_index,ACE_TRACE_DRAW_INC);

        drawLine3D [_pos1, _pos2, _color];
        _lastPos = _pos2;
        // _lastSpd = _data1 select 1;
    };
    // drawIcon3D ["", [1,0,0,1], _lastPos, 0, 0, 0, format ["%1m/s", _lastSpd], 1, 0.05, "RobotoCondensed"];
} forEach GVAR(traces);
