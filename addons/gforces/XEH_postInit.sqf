#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(pfID) = -1;

["ace_settingsInitialized", {
    TRACE_1("SettingsInitialized eh",GVAR(enabledFor));

    if (GVAR(enabledFor) == 0) exitWith {}; //Module has no effect if enabledFor is "None"
    if (GVAR(enabledFor) == 2) exitWith { //PFEH is always on when enabledFor is "All"
        [] call FUNC(addPFEH);
        TRACE_1("adding perm PFEH",GVAR(pfID));
    };

    //PFEH only runs when player is in a type "Air" vehicle when enabledFor is "Aircraft"

    if ((!isNull (vehicle ACE_player)) && {(vehicle ACE_player) isKindOf "Air"}) then { //"playerVehicleChanged" can happen before "settingInit"
        [] call FUNC(addPFEH);
        TRACE_1("adding temp PFEH [start in]",GVAR(pfID));
    };
    ["vehicle", {
        params ["", "_vehicle"];
        TRACE_2("playerVehicleChanged",_vehicle,typeOf _vehicle);
        if (_vehicle isKindOf "Air") then {
            if (GVAR(pfID) == -1) then {
                [] call FUNC(addPFEH);
                TRACE_1("adding temp PFEH",GVAR(pfID));
            };
        } else {
            if (GVAR(pfID) != -1) then {
                TRACE_1("removing temp PFEH",GVAR(pfID));
                ppEffectDestroy GVAR(GForces_CC);
                [GVAR(pfID)] call CBA_fnc_removePerFrameHandler;
                GVAR(pfID) = -1;
            };
        };
    }] call CBA_fnc_addPlayerEventHandler;
}] call CBA_fnc_addEventHandler;
