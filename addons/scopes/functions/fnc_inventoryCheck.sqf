// by KoffeinFlummi / commy2

#include "script_component.hpp"

private "_new";

_new = _this call FUNC(getOptics);

if (isNil QGVAR(Optics)) then {
    GVAR(Optics) = ["", "", ""];
};

if (isNil QGVAR(Adjustment)) then {
    GVAR(Adjustment) = [[0,0], [0,0], [0,0]];
};

{
    if (_new select _forEachIndex != _x) then {
        GVAR(Adjustment) set [_forEachIndex, [0,0]];
    };
} forEach GVAR(Optics);

GVAR(Optics) = _new;
