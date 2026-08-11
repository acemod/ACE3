#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Dials the number passed and detonates the explosive.
 *
 * Arguments:
 * 0: Unit to do dialing <OBJECT> (default: objNull)
 * 1: Code to dial <STRING> (default: "")
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "2131"] call ace_explosives_fnc_dialPhone
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]], ["_code", "", [""]]];
TRACE_2("params",_unit,_code);

if (!alive _unit || {!local _unit} || {_code == ""}) exitWith {};

if (_unit getVariable [QGVAR(dialing), false]) exitWith {};

_unit setVariable [QGVAR(dialing), true, true];

private _explosive = _code call FUNC(getSpeedDialExplosive);
private _explosiveObject = _explosive param [0, objNull];
private _explosiveConfig = configNull;
private _arr = [];

(if (!isNull _explosiveObject) then {
    _explosiveConfig = configOf _explosiveObject;
    (getArray (_explosiveConfig >> QGVAR(callConnectTime))) params ["_callConnectTimeMin", "_callConnectTimeMax"];

    private _random = ((ceil (random _callConnectTimeMax)) + _callConnectTimeMin) max 2;

    for "_i" from 1 to _random do {
        _arr append [".", "..", "...", ""];
    };

    private _ringtones = getArray (_explosiveConfig >> QGVAR(ringtones));

    if (_ringtones isEqualTo []) then {
        _ringtones = [[QPATHTOF(Data\Audio\Cellphone_Ring.wss), 0.75, 3.15, 1, 75]];
    };

    // Support random ringtones
    selectRandom _ringtones
} else {
    _arr append [".", "..", "...", ""];

    [QPATHTOF(Data\Audio\Cellphone_Ring.wss), 0.75, 3.15, 1, 75]
}) params ["_ringtonePath", "_ringtoneLength", ["_volume", 3.15], ["_soundPitch", 1], ["_distance", 75]];

// Calculate the ringtone duration before detonation with slight randomness
private _ringtoneDuration = if (!isNull _explosiveObject) then {
    private _detonationTimingOffset = getNumber (_explosiveConfig >> QGVAR(detonationTimingOffset));

    round (count _arr - (_ringtoneLength + (random (_detonationTimingOffset * 2)) - _detonationTimingOffset) / 0.25) max 4
} else {
    4
};

TRACE_6("ringtone",_ringtonePath,_ringtoneLength,_volume,_soundPitch,_distance,_ringtoneDuration);

// UI is only open for player
if (_unit == ACE_player) then {
    ctrlSetText [1400, "Calling"];
};

// Handle UI and sounds
[{
    params ["_args", "_pfhID"];
    _args params ["_unit", "_dialStep", "_arr", "_explosive", "_explosiveObject", "_ringtoneDuration", "_ringtonePath", "_volume", "_soundPitch", "_distance"];

    if (_dialStep % 4 == 0) then {
        private _pos = _unit modelToWorldVisualWorld (_unit selectionPosition "RightHand");

        playSound3D [QPATHTO_R(Data\Audio\DialTone.wss), objNull, false, _pos, 5, 1, 5];
    };

    // UI is only open for player
    if (_unit == ACE_player) then {
        ctrlSetText [1400, format ["Calling%1", _arr select (_dialStep - 4)]];
    };

    // End call and detonate explosive
    if (_dialStep >= (count _arr + 2)) exitWith {
        _pfhID call CALLSTACK(CBA_fnc_removePerFrameHandler);

        if (!isNull _explosiveObject) then {
            [_unit, -1, [_explosive select 0, _explosive select 2], "ACE_Cellphone"] call FUNC(detonateExplosive);
        };

        _unit setVariable [QGVAR(dialing), nil, true];

        // UI is only open for player
        if (_unit == ACE_player) then {
            ctrlSetText [1400, "Call Ended!"];
        };
    };

    if (
        _dialStep == _ringtoneDuration &&
        {!isNull _explosiveObject} &&
        {[_unit, -1, _explosiveObject, _explosive select 2, "ACE_Cellphone"] call FUNC(checkDetonateHandlers)}
    ) then {
        playSound3D [_ringtonePath, objNull, false, getPosASL _explosiveObject, _volume, _soundPitch, _distance];
    };

    _args set [1, _dialStep + 1];
}, 0.25, [_unit, 4, _arr, _explosive, _explosiveObject, _ringtoneDuration, _ringtonePath, _volume, _soundPitch, _distance]] call CALLSTACK(CBA_fnc_addPerFrameHandler);

nil
