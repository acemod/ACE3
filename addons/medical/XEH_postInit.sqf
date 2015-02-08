
#include "script_component.hpp"

[{
    {
        if (!alive _x || !local _x) then {
            GVAR(injuredUnitCollection) set [ _forEachIndex, ObjNull];
        } else {
            [_x] call FUNC(handleUnitVitals);

            private "_pain";
            _pain = _X getvariable [QGVAR(pain), 0];
            if (_pain > 45) then {
                if (random(1) > 0.6) then {
                //    [_X] call FUNC(setUnconsciousState);
                };
                //[_X] call FUNC(playInjuredSound);
            };
        };
    }foreach GVAR(injuredUnitCollection);
    GVAR(injuredUnitCollection) = GVAR(injuredUnitCollection) - [ObjNull];
}, 1, [] ] call CBA_fnc_addPerFrameHandler;
