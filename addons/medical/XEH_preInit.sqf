#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(HITPOINTS) = ["HitHead", "HitBody", "HitLeftArm", "HitRightArm", "HitLeftLeg", "HitRightLeg"];
GVAR(SELECTIONS) = ["head", "body", "hand_l", "hand_r", "leg_l", "leg_r"];

call FUNC(parseConfigForInjuries);
GVAR(STATE_MACHINE) = (configFile >> "ACE_Medical_StateMachine") call FUNC(createStateMachine);

//Hack for #3168 (units in static weapons do not take any damage):
//doing a manual pre-load with a small distance seems to fix the LOD problems with handle damage not returning full results
GVAR(fixedStatics) = [];
private _fixStatic = {
    params ["_vehicle"];
    private _vehType = typeOf _vehicle;
    TRACE_2("",_vehicle,_vehType);
    if (!(_vehType in GVAR(fixedStatics))) then {
        GVAR(fixedStatics) pushBack _vehType;
        TRACE_1("starting preload",_vehType);
        [{
            1 preloadObject (_this select 0);
        }, {
            TRACE_1("preload done",_this);
        }, [_vehType]] call CBA_fnc_waitUntilAndExecute;
    };
};
["StaticWeapon", "init", _fixStatic] call CBA_fnc_addClassEventHandler;
["Car", "init", _fixStatic] call CBA_fnc_addClassEventHandler;
addMissionEventHandler ["Loaded",{
    {
        TRACE_1("starting preload (save load)",_x);
        [{
            1 preloadObject (_this select 0);
        }, {
            TRACE_1("preload done",_this);
        }, [_x]] call CBA_fnc_waitUntilAndExecute;
    } forEach GVAR(fixedStatics);
}];

ADDON = true;
