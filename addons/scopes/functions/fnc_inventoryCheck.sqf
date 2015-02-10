// by KoffeinFlummi / commy2

#include "script_component.hpp"

private "_new";

_new = _this call FUNC(getOptics);

if (isNil QGVAR(Optics)) then {
    GVAR(Optics) = ["", "", ""];
};

_adjustment = ACE_player getVariable QGVAR(Adjustment);
if (isNil "_adjustment") then {
    ACE_player setVariable [QGVAR(Adjustment), [[0,0], [0,0], [0,0]]];
    [ACE_player, QGVAR(Adjustment), 0.5] call EFUNC(common,throttledPublicVariable);
};

{
    if (_new select _forEachIndex != _x) then {
        _adjustment set [_forEachIndex, [0,0]];
        [ACE_player, QGVAR(Adjustment), 0.5] call EFUNC(common,throttledPublicVariable);
    };
} forEach GVAR(Optics);

GVAR(Optics) = _new;
