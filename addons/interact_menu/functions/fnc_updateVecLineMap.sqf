#include "script_component.hpp";

if((count GVAR(vecLineMap)) == 0 || ((count GVAR(menuDepthPath)) > 0 && (getPosASL player) distance GVAR(lastPos) > 0.01)) then {
    GVAR(lastPos) = getPosASL player;
    _cursorVec = [_cursorPos2, _cursorPos1] call BIS_fnc_vectorFromXtoY;
    _p1 = [0,0,0];
    _p2 = +_cursorVec;
    _p = (_cursorVec call CBA_fnc_vect2polar);
    _v = [(_p select 0), (_p select 1), (_p select 2)+90] call CBA_fnc_polar2vect;
    _cp = [_cursorVec, _v] call BIS_fnc_crossProduct;

    GVAR(vecLineMap) = [_cp, _p1, _p2] call FUNC(rotateVectLineGetMap);
};