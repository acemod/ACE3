#include "script_component.hpp"

[QEGVAR(medical,injured), {
    params ["_unit", "_painLevel"];
    [_unit, "hit", PAIN_TO_SCREAM(_painLevel)] call FUNC(playInjuredSound);

    if (hasInterface && {_unit == ace_player}) then {
        [true] call FUNC(handleEffects);
    };
}] call CBA_fnc_addEventHandler;

[QEGVAR(medical,moan), {
    params ["_unit", "_painLevel"];
    [_unit, "moan", PAIN_TO_MOAN(_painLevel)] call FUNC(playInjuredSound);
}] call CBA_fnc_addEventHandler;

if (!hasInterface) exitWith {};

[QEGVAR(medical,fracture), {
    params ["_unit"];
    if (_unit == ACE_player) then {
        playSound SND_FRACTURE;
    };
}] call CBA_fnc_addEventHandler;

GVAR(nextFadeIn) = 0;
GVAR(heartBeatEffectRunning) = false;
GVAR(lastHeartBeatSound) = 0;
GVAR(bloodTickCounter) = 0;

[false] call FUNC(initEffects);
[true] call FUNC(handleEffects);
[FUNC(handleEffects), 1, false] call CBA_fnc_addPerFrameHandler;

["ace_unconscious", {
    params ["_unit", "_unconscious"];

    if (_unit != ACE_player) exitWith {};
    TRACE_1("player unconscious eh",_unconscious);

    if (_unconscious && {cameraView == "GUNNER"} && {(vehicle _unit) != _unit} &&  {cameraOn == vehicle _unit}) then {
        TRACE_2("exiting gunner view",cameraOn,cameraView);
        ACE_player switchCamera "INTERNAL";
    };

    [!_unconscious, _unit] call EFUNC(common,setVolume);

    // Greatly reduce player's hearing ability while unconscious (affects radio addons)
    private _volume = missionNamespace getVariable [QEGVAR(hearing,unconsciousnessVolume), VOL_UNCONSCIOUS];
    [QUOTE(ADDON), _volume, _unconscious] call EFUNC(common,setHearingCapability);

    [_unconscious, 1] call FUNC(effectUnconscious);
    [true] call FUNC(handleEffects);
    ["unconscious", _unconscious] call EFUNC(common,setDisableUserInputStatus);
}] call CBA_fnc_addEventHandler;

// Reset volume upon death for spectators
[QEGVAR(medical,death), {
    params ["_unit"];

    if (_unit != ACE_player) exitWith {};
    // Players always able to hear for any systems that might run while dead (e.g. spectator)
    [true, _unit] call EFUNC(common,setVolume);

    [QUOTE(ADDON), 1, false] call EFUNC(common,setHearingCapability);
}] call CBA_fnc_addEventHandler;

// Update effects to match new unit's current status (this also handles respawn)
["unit", {
    params ["_new"];
    private _status = IS_UNCONSCIOUS(_new);

    [!_status, _new] call EFUNC(common,setVolume);

    private _volume = missionNamespace getVariable [QEGVAR(hearing,unconsciousnessVolume), VOL_UNCONSCIOUS];
    [QUOTE(ADDON), _volume, _status] call EFUNC(common,setHearingCapability);
    [true] call FUNC(handleEffects);
    ["unconscious", _status] call EFUNC(common,setDisableUserInputStatus);
}] call CBA_fnc_addPlayerEventHandler;

// Update effects for featureCamera (curator, arsenal, etc)
["featureCamera", {
    params ["_unit", "_newCamera"];

    [true] call FUNC(handleEffects);

    private _volume = missionNamespace getVariable [QEGVAR(hearing,unconsciousnessVolume), VOL_UNCONSCIOUS];

    if (_newCamera == "") then { // switched back to player view
        private _status = IS_UNCONSCIOUS(_unit);
        [!_status, _unit] call EFUNC(common,setVolume);

        [QUOTE(ADDON), _volume, _status] call EFUNC(common,setHearingCapability);

        ["unconscious", _status] call EFUNC(common,setDisableUserInputStatus);
    } else { // camera view
        [true, _unit] call EFUNC(common,setVolume);
        [QUOTE(ADDON), 1, false] call EFUNC(common,setHearingCapability);
    };
}] call CBA_fnc_addPlayerEventHandler;

// Forced say3D
[QGVAR(forceSay3D), {
    params ["_unit", "_sound", "_distance"];

    if (ACE_player distance _unit > _distance) exitWith {};

    if (vehicle _unit == _unit) then {
        // say3D waits for the previous sound to finish, so use a dummy instead
        private _dummy = "#dynamicsound" createVehicleLocal [0, 0, 0];
        _dummy attachTo [_unit, [0, 0, 0], "camera"];
        _dummy say3D [_sound, _distance, 1, false];

        [{
            detach _this;
            deleteVehicle _this;
        }, _dummy, 5] call CBA_fnc_waitAndExecute;
    } else {
        // Fallback: attachTo doesn't work within vehicles
        _unit say3D [_sound, _distance, 1, false];
    };
}] call CBA_fnc_addEventHandler;

// Kill vanilla bleeding feedback effects.
#ifdef DISABLE_VANILLA_DAMAGE_EFFECTS
TRACE_1("disabling vanilla bleeding feedback effects",_this);
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
