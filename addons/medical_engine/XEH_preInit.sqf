#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// Hack for #3168 (units in static weapons do not take any damage):
// Doing a manual pre-load with a small distance seems to fix the LOD problems
// with handle damage not returning full results.
GVAR(fixedStatics) = [];

GVAR(animations) = [] call CBA_fnc_createNamespace;
GVAR(animations) setVariable [QGVAR(faceUp), ["ace_unc_2","ace_unc_2_1","ace_unc_7_1","ace_unc_8_1","ace_unc_5_1","ace_unc_6_1"]];
GVAR(animations) setVariable [QGVAR(faceDown), ["ace_unc_1", "ace_unc_3", "ace_unc_4","unconscious","KIA_passenger_boat_holdleft","ace_unc_3_1","ace_unc_4_1"]];
GVAR(animations) setVariable [QGVAR(faceLeft), ["ace_unc_7","ace_unc_8","ace_unc_1_1","ace_unc_7_1","ace_unc_8_1"]];
GVAR(animations) setVariable [QGVAR(faceRight), ["ace_unc_5","ace_unc_6","KIA_driver_boat01","ace_unc_5_1","ace_unc_6_1"]];

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

["ace_unconscious", {
    params ["_unit", "_active"];
    if (_active) then {
        if (_unit getVariable [QGVAR(waitForAnim), true]) then {
            [{(animationstate _this) find QGVAR(face) != -1}, {
                [_this, animationstate _this] call FUNC(applyAnimAfterRagdoll);
            }, _unit, 20] call CBA_fnc_waitUntilAndExecute;
            _unit setVariable [QGVAR(waitForAnim), false];
        };
    } else {
        _unit setVariable [QGVAR(waitForAnim), nil];
        if (local _unit) then {
            [_unit, _active] call FUNC(setUnconsciousAnim);
        };
    };
}] call CBA_fnc_addEventhandler;

ADDON = true;
