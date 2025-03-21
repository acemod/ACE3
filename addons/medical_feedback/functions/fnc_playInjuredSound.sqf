#include "..\script_component.hpp"
/*
 * Author: commy2
 * Play random injured sound for a unit. The sound is broadcasted across MP.
 * Will not play if the unit has already played a sound within to close a time frame.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Type ["hit", "moan"] <STRING> (default: "hit")
 * 2: Severity [0, 1, 2] <NUMBER> (default: 0)
 * 3: Hit sound distances <ARRAY> (default: [50, 60, 70])
 * 4: Moan sound distances <ARRAY> (default: [10, 15, 20])
 * 5: Allow unconscious units <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "hit", 1] call ace_medical_feedback_fnc_playInjuredSound
 *
 * Public: No
 */
#define TIME_OUT_HIT 1
#define TIME_OUT_MOAN [12, 7.5, 5]

params [["_unit", objNull, [objNull]], ["_type", "hit", [""]], ["_severity", 0, [0]], ["_hitDistances", [50, 60, 70], [[]], [3]], ["_moanDistances", [10, 15, 20], [[]], [3]], ["_allowUnconscious", false, [true]]];
// TRACE_3("",_unit,_type,_severity);

if (!local _unit) exitWith { ERROR_2("playInjuredSound: Unit not local or null [%1:%2]",_unit,typeOf _unit); };

if (!_allowUnconscious && {!(_unit call EFUNC(common,isAwake))}) exitWith {};

// Limit network traffic by only sending the event to players who can potentially hear it
private _distance = if (_type == "hit") then {
    _hitDistances select _severity
} else {
    _moanDistances select _severity
};
private _targets = allPlayers inAreaArray [ASLToAGL getPosASL _unit, _distance, _distance, 0, false, _distance];
if (_targets isEqualTo []) exitWith {};

// Handle timeout
if (_unit getVariable [QGVAR(soundTimeout) + _type, -1] > CBA_missionTime) exitWith {};
private _timeOut = if (_type == "moan") then { TIME_OUT_MOAN # _severity } else { TIME_OUT_HIT };
_unit setVariable [QGVAR(soundTimeout) + _type, CBA_missionTime + _timeOut];

// Get units speaker
private _speaker = speaker _unit;
if (_speaker == "ACE_NoVoice") then {
    _speaker = _unit getVariable "ace_originalSpeaker";
};

// Fallback if speaker has no associated scream/moan sound
if (isNull (configFile >> "CfgSounds" >> format ["ACE_moan_%1_low_1", _speaker])) then {
    _speaker = "Male08ENG";
};

// Select actual sound
private _variation = ["low", "mid", "high"] select _severity;

private _cfgSounds = configFile >> "CfgSounds";
private _targetClass = format ["ACE_%1_%2_%3_", _type, _speaker, _variation];
private _index = 1;
private _sounds = [];
while {isClass (_cfgSounds >> (_targetClass + str _index))} do {
    _sounds pushBack (_cfgSounds >> (_targetClass + str _index));
    _index = _index + 1;
};
private _sound = configName selectRandom _sounds;
if (isNil "_sound") exitWith { WARNING_1("no sounds for target [%1]",_targetClass); };

[QGVAR(forceSay3D), [_unit, _sound, _distance], _targets] call CBA_fnc_targetEvent;
