#include "script_component.hpp"

[QGVAR(handlePunjiTrapDamage), LINKFUNC(handlePunjiTrapDamage)] call CBA_fnc_addEventHandler;

if (isServer) then {
    [QEGVAR(trenches,placed), {
        params ["", "_trench"];
        if (_trench isKindOf "vn_o_vc_spiderhole_01") then {
            _trench enableSimulationGlobal false;
        };
    }] call CBA_fnc_addEventHandler;

    [QEGVAR(trenches,finished), {
        params ["", "_trench"];
        if (_trench isKindOf "vn_o_vc_spiderhole_01") then {
            _trench enableSimulationGlobal true;
        };
    }] call CBA_fnc_addEventHandler;
};
