#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Plays synchronized ambiance sounds while the module is alive.
 *
 * Arguments:
 * 0: Logic <LOGIC>
 * 1: Units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC, [bob, kevin], true] call ace_missionmodules_fnc_moduleAmbianceSound
 *
 * Public: No
 */

params ["_logic", "_units", "_activated"];

// We only play this on the locality of the logic, since the sounds are broadcasted across the network
if (!_activated || !local _logic) exitWith {0};

private _ambianceSounds = [];
private _unparsedSounds = _logic getVariable ["soundFiles", ""];
private _minimalDistance = (_logic getVariable ["minimalDistance", 400]) max 1;
private _maximalDistance = (_logic getVariable ["maximalDistance", 10]) max _minimalDistance;
private _minDelayBetweensounds = (_logic getVariable ["minimalDelay", 10]) max 1;
private _maxDelayBetweenSounds = (_logic getVariable ["maximalDelay", 170]) max _minDelayBetweensounds;
private _volume = (_logic getVariable ["soundVolume", 30]) max 1;
private _followPlayers = _logic getVariable ["followPlayers", false];

private _splittedList = _unparsedSounds splitString ",";
private _missionRoot = str missionConfigFile select [0, count str missionConfigFile - 15];

{
    _x = [_x] call CBA_fnc_removeWhitespace;

    if (isClass (missionConfigFile >> "CfgSounds" >> _x)) then {
        // CfgSounds accepts a leading backslash, but a double backslash
        // is not accepted in the path, so we have to filter that.
        private _soundPath = getArray (missionConfigFile >> "CfgSounds" >> _x >> "sound") select 0;
        if (_soundPath select [0,1] == "\") then {
            _ambianceSounds pushBack (_missionRoot + (_soundPath select [1]));
        } else {
            _ambianceSounds pushBack (_missionRoot + _soundPath);
        };
    } else {
        if (isClass (configFile >> "CfgSounds" >> _x)) then {
            private _soundPath = (getArray(configFile >> "CfgSounds" >> _x >> "sound")) param [0, ""];
            if ((_soundPath select [0, 1]) == "\") then {_soundPath = _soundPath select [1];};
            _ambianceSounds pushBack _soundPath;
        } else {
            ERROR_1("Ambient Sounds: Sound ""%1"" not found.",_x);
        };
    };
} forEach _splittedList;

if (_ambianceSounds isEqualTo []) exitWith {};
{
    if ((_x find ".") == -1) then {
        _ambianceSounds set [_forEachIndex, _x + ".wss"];
    };
} forEach _ambianceSounds;

TRACE_1("",_ambianceSounds);

[{
    params ["_args", "_pfhHandle"];
    _args params ["_logic", "_ambianceSounds", "_minimalDistance", "_maximalDistance", "_minDelayBetweensounds", "_maxDelayBetweenSounds", "_volume", "_followPlayers", "_lastTimePlayed"];

    if (!alive _logic) exitWith {
        [_pfhHandle] call CBA_fnc_removePerFrameHandler;
    };

    if (CBA_missionTime - _lastTimePlayed >= ((_minDelayBetweensounds + random(_maxDelayBetweenSounds)) min _maxDelayBetweenSounds)) then {

        // Find all players in session.
        private _allUnits = if (isMultiplayer) then {playableUnits} else {[ACE_player]};

        // Check if there are enough players to even start playing this sound.
        if (_allUnits isNotEqualTo []) then {
            // find the position from which we are going to play this sound from.
            private _newPosASL = if (_followPlayers) then {
                // Select a target unit at random.
                private _targetUnit = selectRandom _allUnits;
                AGLToASL (_targetUnit getPos [_minimalDistance + random (_maximalDistance - _minimalDistance), random 360]);
            } else {
                AGLToASL (_logic getPos [_minimalDistance + random (_maximalDistance - _minimalDistance), random 360]);
            };

            TRACE_1("",_newPosASL);
            // If no unit is to close to this position, we will play the sound.
            if (_allUnits findIf {_newPosASL distance _x < (_minimalDistance / 2)} == -1) then {
                private _soundFile = selectRandom _ambianceSounds;
                TRACE_2("playing file",_soundFile,_newPosASL);
                playSound3D [_soundFile, objNull,  false, _newPosASL, _volume, 1, 1000];
                _args set [8, CBA_missionTime];
            } else {
                TRACE_1("pos is too close to a player",_newPosASL);
            };
        };
    };
}, 0.1, [_logic, _ambianceSounds, _minimalDistance, _maximalDistance, _minDelayBetweensounds, _maxDelayBetweenSounds, _volume, _followPlayers, CBA_missionTime] ] call CBA_fnc_addPerFrameHandler;

true;
