#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// Hack for #3168 (units in static weapons do not take any damage):
// Doing a manual pre-load with a small distance seems to fix the LOD problems
// with handle damage not returning full results.
GVAR(fixedStatics) = [];

private _fnc_fixStatic = {
    params ["_vehicle"];
    private _type = typeOf _vehicle;

    if !(_type in GVAR(fixedStatics)) then {
        GVAR(fixedStatics) pushBack _type;
        PRELOAD_CLASS(_type);
    };
};

["StaticWeapon", "init", _fnc_fixStatic] call CBA_fnc_addClassEventHandler;
["Car", "init", _fnc_fixStatic] call CBA_fnc_addClassEventHandler;

addMissionEventHandler ["Loaded", {
    {
        PRELOAD_CLASS(_x);
    } forEach GVAR(fixedStatics);
}];

ADDON = true;
