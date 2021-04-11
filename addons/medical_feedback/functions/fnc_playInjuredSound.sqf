#include "script_component.hpp"
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
 * [player, "hit", 1] call ace_medical_feedback_fnc_playInjuredSound
 *
 * Public: No
 */
#define TIME_OUT_HIT 1
#define TIME_OUT_MOAN [12, 7.5, 5]

params [["_unit", objNull, [objNull]], ["_type", "hit", [""]], ["_severity", 0, [0]]];
// TRACE_3("",_unit,_type,_severity);

if (!local _unit) exitWith { ERROR_2("playInjuredSound: Unit not local or null [%1:%2]",_unit,typeOf _unit); };

if !(_unit call EFUNC(common,isAwake)) exitWith {};

// Limit network traffic by only sending the event to players who can potentially hear it
private _distance = if (_type == "hit") then {
    [50, 60, 70] select _severity;
} else {
    [10, 15, 20] select _severity;
};
private _targets = allPlayers inAreaArray [getPosWorld _unit, _distance, _distance, 0, false, _distance];
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
