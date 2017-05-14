/*
 * Author: commy2
 * Play random injured sound for a unit. The sound is broadcasted across MP.
 * Will not play if the unit has already played a sound within to close a time frame.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Type (optional) ["hit" (default) or "moan"] <STRING>
 * 2: Severity (optional) [0 (default), 1, 2] <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "hit", 1] call ace_medical_engine_fnc_playInjuredSound
 *
 * Public: No
 */
#include "script_component.hpp"

#define TIME_OUT 1

params [["_unit", objNull, [objNull]], ["_type", "hit", [""]], ["_severity", 0, [0]]];

if (!local _unit) exitWith {
    ACE_LOGERROR("Unit not local or null");
};

// Handle timeout
if (_unit getVariable [QGVAR(soundTimeout), -1] > CBA_missionTime) exitWith {};
_unit setVariable [QGVAR(soundTimeout), CBA_missionTime + TIME_OUT];

// Get sounds
private _soundsNamespace = NAMESPACE_NULL;

switch (toLower _type) do {
    case ("hit"): {
        _soundsNamespace = GVAR(HitScreamNamespace);
    };
    case ("moan"): {
        _soundsNamespace = GVAR(InjuredMoanNamespace);
    };
};

// Get units speaker
private _speaker = speaker _unit;

if (_speaker == "ACE_NoVoice") then {
    _speaker = _unit getVariable "ace_originalSpeaker";
};

private _sounds = _soundsNamespace getVariable _speaker;

if (isNil "_sounds") then {
    _sounds = _soundsNamespace getVariable (_soundsNamespace getVariable "#default");
};

if (isNil "_sounds") exitWith {
    ACE_LOGERROR("No sounds for speaker and no default found");
};

// Get correct sound of the speaker
_sounds = _sounds param [_severity, []];
(selectRandom _sounds) params ["_sound", ["_volume", 1], ["_frequency", 1], ["_distance", 80]];

if (isNil "_sound") exitWith {
    ACE_LOGERROR("No sound for this speaker");
};

// Delete leading slash.
if (_sound select [0, 1] == "\") then {
    _sound = _sound select [1];
};

// Default file extension.
if (_sound find "." == -1) then {
    _sound = _sound + ".wss";
};

playSound3D [_sound, objNull, false, position _unit, _volume, _frequency, _distance];
