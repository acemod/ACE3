#include "script_component.hpp"
_params = _this select 0;
_tracerObj = _params select 0;
_index = _params select 1;

if(alive _tracerObj && (count GVAR(traces)) > 0) then {
    _data = GVAR(traces) select _index;
    _positions = _data select 4;
    _objVel = velocity _tracerObj;
    _objTVel = sqrt((_objVel select 0)^2 + (_objVel select 1)^2 + (_objVel select 2)^2);
    _positions set[(count _positions), [(getPos _tracerObj), _objTVel]];
} else {
    [(_this select 1)] call cba_fnc_removePerFrameHandler;
};        