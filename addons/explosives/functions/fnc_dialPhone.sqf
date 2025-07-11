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
private _explosiveConfig = configNull;
private _arr = [];

(if (_explosive isNotEqualTo []) then {
    _explosiveConfig = configOf (_explosive select 0);
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
private _ringtoneDuration = if (_explosive isNotEqualTo []) then {
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

[LINKFUNC(dialingPhone), 0.25, [_unit, 4, _arr, _explosive, _ringtoneDuration, _ringtonePath, _volume, _soundPitch, _distance]] call CALLSTACK(CBA_fnc_addPerFrameHandler);

nil
