/**
 * fn_moduleAmbianceSoundLoop.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_logic", "_units", "_activated","_ambianceSounds", "_soundFiles", "_minimalDistance","_maximalDistance", "_minimalDistance", "_maxDelayBetweenSounds", "_allUnits", "_newPos", "_targetUnit", "_soundToPlay", "_soundPath", "_unparsedSounds", "_list", "_splittedList", "_nilCheckPassedList"];
_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_units = [_this,1,[],[[]]] call BIS_fnc_param;
_activated = [_this,2,true,[true]] call BIS_fnc_param;

if (_activated && isServer) then {
	_ambianceSounds = [];
	_unparsedSounds = _logic getvariable ["soundFiles", ""];
	_minimalDistance = (_logic getvariable ["minimalDistance", 400]) max 1;
	_maximalDistance = (_logic getvariable ["maximalDistance", 10]) max _minimalDistance;
	_minDelayBetweensounds = (_logic getvariable ["minimalDelay", 10]) max 1;
	_maxDelayBetweenSounds = (_logic getvariable ["maximalDelay", 170]) max _minDelayBetweensounds;
	_volume = (_logic getvariable ["soundVolume", 30]) max 1;
	_followPlayers = _logic getvariable ["followPlayers", false];

	_splittedList = [_unparsedSounds, ","] call BIS_fnc_splitString;

	_nilCheckPassedList = "";
	{
		_x = [_x] call cse_fnc_string_removeWhiteSpace;
		_splittedList set [_foreachIndex, _x];
	}foreach _splittedList;

	_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
	{
		if (isclass (missionConfigFile >> "CfgSounds" >> _x)) then {
			_ambianceSounds pushback (_soundPath + (getArray(missionConfigFile >> "CfgSounds" >> _x >> "sound") select 0));
		} else {
			if (isclass (configFile >> "CfgSounds" >> _x)) then {
				_ambianceSounds pushback ((getArray(configFile >> "CfgSounds" >> _x >> "sound") select 0));
			};
		};
	}foreach _splittedList;

	if (count _ambianceSounds == 0) exitwith {
		[format["No Ambiance sounds available"]] call cse_fnc_debug;
	};
	{
		if !([".", _x, true] call BIS_fnc_inString) then {
			[format["Ambiance soundfile does not contain a file extension %1", _x]] call cse_fnc_debug;
			_ambianceSounds set [_foreachIndex, _x + ".wss"];
		};
	}foreach _ambianceSounds;
	[format["Ambiance sounds %1", _ambianceSounds]] call cse_fnc_debug;

	while {alive _logic} do {
		_allUnits = switch (true) do {
			case isMultiplayer: {playableUnits};
			case isDedicated: {[_logic]};
			default {[player]};
		};

		if (count _allUnits > 0) then {
			_targetUnit = _allUnits select (round(random((count _allUnits)-1)));

			_newPos = (getPos _targetUnit);
			if (!_followPlayers) then {
				_newPos = getPos _logic;
			};

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

			if ({(_newPos distance _x < (_minimalDistance / 2))}count _allUnits == 0) then {

				_soundToPlay = _ambianceSounds select (round(random((count _ambianceSounds)-1)));
				playSound3D [_soundToPlay, _targetUnit,  false, _newPos, _volume, 1, 1000];

				[format["Played a sound %1", _soundToPlay]] call cse_fnc_debug;

				sleep (_minDelayBetweensounds + random(_maxDelayBetweenSounds)) min _maxDelayBetweenSounds;
			};
		};
	};
};

true;