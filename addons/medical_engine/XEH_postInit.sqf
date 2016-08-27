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
