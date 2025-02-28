#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Dials the number passed and detonates the explosive.
 *
 * Arguments:
 * 0: Unit to do dialing <OBJECT>
 * 1: Code to dial <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ace_player,"2131"] call ACE_explosives_fnc_dialPhone;
 *
 * Public: Yes
 */

params ["_unit", "_code"];
TRACE_2("params",_unit,_code);

if (_unit getVariable [QGVAR(Dialing),false]) exitWith {};
if !(alive _unit) exitWith {};
_unit setVariable [QGVAR(Dialing), true, true];

private _explosive = [_code] call FUNC(getSpeedDialExplosive);

private _callConnectTimes = getArray (configOf (_explosive select 0) >> QGVAR(callConnectTime));
_callConnectTimes params ["_callConnectTimeMin", "_callConnectTimeMax"];

private _ran = ((ceil(random _callConnectTimeMax)) + _callConnectTimeMin) max 2;
private _arr = [];
for "_i" from 1 to _ran do {
    _arr = _arr + ['.','..','...',''];
};

private _ringtone = getArray (configOf (_explosive select 0) >> QGVAR(ringtones));
if (_ringtone isEqualTo []) then { _ringtone = [[QPATHTOF(Data\Audio\Cellphone_Ring.wss), 0.75, 3.16228, 1, 75]] };
//support random ringtones
_ringtone = selectRandom _ringtone;
_ringtone params ["_ringtonePath", "_ringtoneLength", ["_volume", 3.16228], ["_soundPitch", 1], ["_distance", 75]];

//Calculate the ringtone duration before detonation with slight randomness
private _detonationTimingOffset = getNumber (configOf (_explosive select 0) >> QGVAR(detonationTimingOffset));
private _ringtoneDuration = round(count _arr - (_ringtoneLength + (random (_detonationTimingOffset * 2)) - _detonationTimingOffset) / 0.25) max 4;

TRACE_2("ringtone",_ringtone,_ringtoneDuration);
if (_unit == ace_player) then {
    ctrlSetText [1400,"Calling"];
    [LINKFUNC(dialingPhone), 0.25, [_unit,4,_arr,_explosive,_ringtonePath,_ringtoneDuration,_volume,_soundPitch,_distance]] call CALLSTACK(CBA_fnc_addPerFrameHandler);
} else {
    if ((count _explosive) > 0) then {
        private _waitTime = 0.25 * _ringtoneDuration;
        [{
            params ["_unit", "_item", "_ringtonePath", "_volume", "_soundPitch", "_distance"];
            if ([_unit, -1, (_item # 0), (_item # 2), "ACE_Cellphone"] call FUNC(checkDetonateHandlers)) then {
                playSound3D [_ringtonePath, objNull, false, (getPosASL (_item # 0)), _volume, _soundPitch, _distance];
            };

            _unit setVariable [QGVAR(Dialing), false, true];
        }, [_unit, _explosive, _ringtonePath, _volume, _soundPitch, _distance], _waitTime] call CBA_fnc_waitAndExecute;

        [_explosive select 0,(_waitTime + 2) + (_explosive select 2), "ACE_Cellphone", _unit] call FUNC(startTimer);
    };
};
