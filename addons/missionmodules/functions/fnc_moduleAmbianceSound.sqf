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
 * Nothing
 *
 * Example:
 * N/A
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_ambianceSounds", "_minimalDistance","_maximalDistance", "_minimalDistance", "_maxDelayBetweenSounds", "_missionRoot", "_unparsedSounds", "_splittedList", "_soundPath"];
params ["_logic", "_units", "_activated"];

// We only play this on the locality of the logic, since the sounds are broadcasted across the network
if (_activated && local _logic) then {
    _ambianceSounds = [];
    _unparsedSounds = _logic getVariable ["soundFiles", ""];
    _minimalDistance = (_logic getVariable ["minimalDistance", 400]) max 1;
    _maximalDistance = (_logic getVariable ["maximalDistance", 10]) max _minimalDistance;
    _minDelayBetweensounds = (_logic getVariable ["minimalDelay", 10]) max 1;
    _maxDelayBetweenSounds = (_logic getVariable ["maximalDelay", 170]) max _minDelayBetweensounds;
    _volume = (_logic getVariable ["soundVolume", 30]) max 1;
    _followPlayers = _logic getVariable ["followPlayers", false];

    _splittedList = _unparsedSounds splitString ",";
    _missionRoot = str missionConfigFile select [0, count str missionConfigFile - 15];

    {
        _x = [_x] call EFUNC(common,stringRemoveWhiteSpace);

        if (isClass (missionConfigFile >> "CfgSounds" >> _x)) then {
            // CfgSounds accepts a leading backslash, but a double backslash
            // is not accepted in the path, so we have to filter that.
            _soundPath = getArray (missionConfigFile >> "CfgSounds" >> _x >> "sound") select 0;
            if (_soundPath select [0,1] == "\") then {
                _ambianceSounds pushBack (_missionRoot + (_soundPath select [1]));
            } else {
                _ambianceSounds pushBack (_missionRoot + _soundPath);
            };
        } else {
            if (isClass (configFile >> "CfgSounds" >> _x)) then {
                _ambianceSounds pushBack ((getArray(configFile >> "CfgSounds" >> _x >> "sound") select 0));
            } else {
                ACE_LOGERROR_1("Ambient Sounds: Sound ""%1"" not found.",_x);
            };
        };

        false
    } count _splittedList;

    if (count _ambianceSounds == 0) exitWith {};
    {
        if ((_x find ".") == -1) then {
            _ambianceSounds set [_forEachIndex, _x + ".wss"];
        };
    } forEach _ambianceSounds;

    [{
        private ["_newPos", "_allUnits", "_targetUnit"];
        params ["_args", "_pfhHandle"];
        _args params ["_logic", "_ambianceSounds", "_minimalDistance", "_maximalDistance", "_minDelayBetweensounds", "_maxDelayBetweenSounds", "_volume", "_followPlayers", "_lastTimePlayed"];

        if (!alive _logic) exitWith {
            [_pfhHandle] call CBA_fnc_removePerFrameHandler;
        };

        if (ACE_time - _lastTimePlayed >= ((_minDelayBetweensounds + random(_maxDelayBetweenSounds)) min _maxDelayBetweenSounds)) then {

            // Find all players in session.
            _allUnits = if (isMultiplayer) then {playableUnits} else {[ACE_player]};

            // Check if there are enough players to even start playing this sound.
            if (count _allUnits > 0) then {

                // Select a target unit at random.
                _targetUnit = _allUnits call BIS_fnc_selectRandom;

                // find the position from which we are going to play this sound from.
                _newPos = (getPos _targetUnit);
                if (!_followPlayers) then {
                    _newPos = getPos _logic;
                };

                // Randomize this position.
                if (random(1) >= 0.5) then {
                    if (random(1) >= 0.5) then {
                        _newPos set [0, (_newPos select 0) + (_minimalDistance + random(_maximalDistance))];
                    } else {
                        _newPos set [0, (_newPos select 0) - (_minimalDistance + random(_maximalDistance))];
                    };
                } else {
                    if (random(1) >= 0.5) then {
                        _newPos set [1, (_newPos select 1) + (_minimalDistance + random(_maximalDistance))];
                    } else {
                        _newPos set [1, (_newPos select 1) - (_minimalDistance + random(_maximalDistance))];
                    };
                };

                // If no unit is to close to this position, we will play the sound.
                if ({(_newPos distance _x < (_minimalDistance / 2))}count _allUnits == 0) then {
                    playSound3D [_ambianceSounds call BIS_fnc_selectRandom, objNull,  false, _newPos, _volume, 1, 1000];
                    _args set [8, ACE_time];
                };
            };
        };
    }, 0.1, [_logic, _ambianceSounds, _minimalDistance, _maximalDistance, _minDelayBetweensounds, _maxDelayBetweenSounds, _volume, _followPlayers, ACE_time] ] call CBA_fnc_addPerFrameHandler;
};

true;
