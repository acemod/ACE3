#include "script_component.hpp"

[QEGVAR(medical,injured), {
    params ["_unit", "_painLevel"];
    [_unit, "hit", PAIN_TO_SCREAM(_painLevel)] call FUNC(playInjuredSound);
}] call CBA_fnc_addEventHandler;

[QEGVAR(medical,moan), {
    params ["_unit", "_painLevel"];
    [_unit, "moan", PAIN_TO_MOAN(_painLevel)] call FUNC(playInjuredSound);
}] call CBA_fnc_addEventHandler;

if (!hasInterface) exitWith {};

GVAR(nextFadeIn) = 0;
GVAR(heartBeatEffectRunning) = false;

[false] call FUNC(initEffects);
[LINKFUNC(handleEffects), 1, []] call CBA_fnc_addPerFrameHandler;

/*
Author: SilentSpike

Initalises logic for volume handling between consciousness transitions and death
*/

["ace_unconscious", {
    params ["_unit", "_unconscious"];

    if (_unit != ACE_player) exitWith {};

    // Toggle unconscious player's ability to talk in radio addons
    _unit setVariable ["tf_voiceVolume", [1, 0] select _unconscious, true];
    _unit setVariable ["tf_unable_to_use_radio", _unconscious]; // Only used locally
    _unit setVariable ["acre_sys_core_isDisabled", _unconscious, true];

    // Greatly reduce player's hearing ability while unconscious (affects radio addons)
    [QUOTE(ADDON), VOL_UNCONSCIOUS, _unconscious] call EFUNC(common,setHearingCapability);

    [_unconscious, 1] call FUNC(effectUnconscious);
    ["unconscious", _unconscious] call EFUNC(common,setDisableUserInputStatus);
}] call CBA_fnc_addEventHandler;

// Reset volume upon death for spectators
[QEGVAR(medical,death), {
    params ["_unit"];

    if (_unit != ACE_player) exitWith {};

    _unit setVariable ["tf_voiceVolume", 1, true];
    _unit setVariable ["tf_unable_to_use_radio", false];
    _unit setVariable ["acre_sys_core_isDisabled", false, true];
    [QUOTE(ADDON), 1, false] call EFUNC(common,setHearingCapability);
}] call CBA_fnc_addEventHandler;

// Update effects to match new unit's current status (this also handles respawn)
["unit", {
    params ["_new", "_old"];

    private _status = _new getVariable ["ace_unconscious", false];

    _new setVariable ["tf_voiceVolume", [1, 0] select _status, true];
    _new setVariable ["tf_unable_to_use_radio", _status];
    _new setVariable ["acre_sys_core_isDisabled", _status, true];
    [QUOTE(ADDON), VOL_UNCONSCIOUS, _status] call EFUNC(common,setHearingCapability);
    [_status, 0] call FUNC(effectUnconscious);
    ["unconscious", _status] call EFUNC(common,setDisableUserInputStatus);
}] call CBA_fnc_addPlayerEventHandler;

/*
Author: SilentSpike

Initalises logic for treatment notifications shown to the player
*/

// Notification lets the player known if they're being treated
[QGVAR(treatment_initiated), {
    params ["_medic", "_patient"];

    // Notifications don't make sense for self-healing or when dead
    if (_medic == _patient || {!alive _patient}) exitWith {};

    // Can't tell who is providing aid when you're unconscious
    private _name = if IS_UNCONSCIOUS(_patient) then {
        LLSTRING(UnknownPerson)
    } else {
        name _medic
    };

    QGVAR(notification) cutText [format [LLSTRING(TreatingYou), _name], "PLAIN DOWN"];
}] call CBA_fnc_addEventHandler;

// Notification may no longer apply when treatment ends
[QGVAR(treatment_ended), {
    params ["_medic", "_patient", "_responders"];

    // Notifications don't make sense for self-healing or when dead
    if (_medic == _patient || {!alive _patient}) exitWith {};

    // If someone else is still treating it's useful to know
    if (_responders isEqualTo []) then {
        QGVAR(notification) cutFadeOut 1;
    } else {
        private _name = if IS_UNCONSCIOUS(_patient) then {
            LLSTRING(UnknownPerson);
        } else {
            name (_responders select 0)
        };

        QGVAR(notification) cutText [
            format [LLSTRING(TreatingYou2), _name],
            "PLAIN DOWN"
        ];
    };
}] call CBA_fnc_addEventHandler;

// A dead patient no longer needs a notification
[QEGVAR(medical,death), {
    params ["_unit"];
    if (_unit == ACE_player) then {
        QGVAR(notification) cutFadeOut 1;
    };
}] call CBA_fnc_addEventHandler;

// Immediately hide any old notification upon switching unit
["unit", {
    QGVAR(notification) cutText ["", "PLAIN DOWN"];
}] call CBA_fnc_addPlayerEventHandler;
