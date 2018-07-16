#include "script_component.hpp"

["CAManBase", "init", {
    params ["_unit"];

    // Check if last hit point is our dummy.
    private _allHitPoints = getAllHitPointsDamage _unit param [0, []];
    reverse _allHitPoints;

    if (_allHitPoints param [0, ""] != "ACE_HDBracket") then {
        if ((getText (([_unit] call CBA_fnc_getObjectConfig) >> "simulation")) == "UAVPilot") exitWith {TRACE_1("ignore UAV AI",typeOf _unit);};
        ERROR_1("Bad hitpoints for unit type ""%1""",typeOf _unit);
    } else {
        // Calling this function inside curly brackets allows the usage of
        // "exitWith", which would be broken with "HandleDamage" otherwise.
        _unit setVariable [
            QEGVAR(medical,HandleDamageEHID),
            _unit addEventHandler ["HandleDamage", {_this call FUNC(handleDamage)}]
        ];
    };
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

#ifdef DEBUG_MODE_FULL
[QEGVAR(medical,woundReceived), {
    params ["_unit", "_woundedHitPoint", "_receivedDamage", "_shooter", "_ammo"];
    TRACE_5("wound",_unit,_woundedHitPoint, _receivedDamage, _shooter, _ammo);
    //systemChat str _this;
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

// this handles moving units into vehicles via load functions or zeus
// needed, because the vanilla INCAPACITATED state does not handle vehicles
["CAManBase", "GetInMan", {
    params ["_unit"];
    if (!local _unit) exitWith {};

    if (lifeState _unit == "INCAPACITATED") then {
        [_unit, true] call FUNC(setUnconsciousAnim);
    };
}] call CBA_fnc_addClassEventHandler;
