#include "script_component.hpp"

params ["_pos1", "_pos2", "_designator", "_seeker"];

private _spacing = 100;
if((count _this) > 4) then {
    _spacing = _this select 4;
};

private _return = true;
private _vectorTo = [_pos2, _pos1] call BIS_fnc_vectorFromXToY;

private _x = (_vectorTo select 0)*0.25;
private _y = (_vectorTo select 1)*0.25;
private _z = (_vectorTo select 2)*0.25;

_pos2 = [(_pos2 select 0) + _x, (_pos2 select 1) + _y, (_pos2 select 2) + _z];

// player sideChat format["new los check"];
if(terrainIntersect [_pos2, _pos1]) then {
    _return = false;
} else {
    if(lineIntersects [_pos2, _pos1]) then {    // should take as arguments and add to this command objects to exclude - target and observer
        // player sideChat format["with: %1", lineIntersectsWith [_pos1, _pos2]];
        _return = false;
    };
};
_return;