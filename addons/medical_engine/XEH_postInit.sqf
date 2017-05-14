#include "script_component.hpp"

["CAManBase", "init", {
    params ["_unit"];

    // Check if last hit point is our dummy.
    private _allHitPoints = getAllHitPointsDamage _unit param [0, []];
    reverse _allHitPoints;

    if (_allHitPoints param [0, ""] != "ACE_HDBracket") then {
        ACE_LOGERROR_1("Bad hitpoints for unit type ""%1""",typeOf _unit);
    } else {
        // Calling this function inside curly brackets allows the usage of
        // "exitWith", which would be broken with "HandleDamage" otherwise.
        _unit addEventHandler ["HandleDamage", {_this call FUNC(handleDamage)}];
    };
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

#ifdef DEBUG_MODE_FULL
[QGVAR(woundReceived), {
    diag_log _this;
    systemChat str _this;
}] call CBA_fnc_addEventHandler;
#endif

// Kill vanilla bleeding feedback effects.
#ifdef DISABLE_VANILLA_DAMAGE_EFFECTS
[{
    {isNil _x} count [
        "BIS_fnc_feedback_damageCC",
        "BIS_fnc_feedback_damageRadialBlur",
        "BIS_fnc_feedback_damageBlur"
    ] == 0
}, {
    {
        ppEffectDestroy _x;
    } forEach [
        BIS_fnc_feedback_damageCC,
        BIS_fnc_feedback_damageRadialBlur,
        BIS_fnc_feedback_damageBlur
    ];
}] call CBA_fnc_waitUntilAndExecute;
#endif

// Hack for #3168 (units in static weapons do not take any damage):
// Doing a manual pre-load with a small distance seems to fix the LOD problems
// with handle damage not returning full results.
GVAR(fixedStatics) = [];

private _fnc_fixStatic = {
    params ["_vehicle"];

    private _type = typeOf _vehicle;
    TRACE_2("",_vehicle,_type);

    if !(_type in GVAR(fixedStatics)) then {
        GVAR(fixedStatics) pushBack _type;

        ACE_LOGINFO_1("Starting preload for ""%1""",_type);
        [{
            1 preloadObject _this;
        }, {
            ACE_LOGINFO_1("Preload done for ""%1""",_this);
        }, _type] call CBA_fnc_waitUntilAndExecute;
    };
};

["StaticWeapon", "init", _fnc_fixStatic, nil, nil, true] call CBA_fnc_addClassEventHandler;
["Car", "init", _fnc_fixStatic, nil, nil, true] call CBA_fnc_addClassEventHandler;

addMissionEventHandler ["Loaded", {
    {
        ACE_LOGINFO_1("Starting preload for ""%1""",_x);
        [{
            1 preloadObject _this;
        }, {
            ACE_LOGINFO_1("Preload done for ""%1""",_this);
        }, _x] call CBA_fnc_waitUntilAndExecute;
    } forEach GVAR(fixedStatics);
}];

#define BLAH __FILE__
diag_log BLAH;

diag_log 127;

diag_log __FILE__;
