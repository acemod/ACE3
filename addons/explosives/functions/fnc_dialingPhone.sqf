#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Performs the dial tones and detonation of explosive.
 *
 * Arguments:
 * 0: Unit to do dialing <OBJECT>
 * 1: Index <NUMBER>
 * 2: Dialing points <ARRAY>
 * 3: Explosive data <ARRAY>
 * 4: Path to ringtone sound file <STRING>
 * 5: Duration before the explosive rings <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ace_explosives_fnc_dialingPhone, 0.25, [_unit,4,_arr, _explosive, _ringtonePath, _ringtoneDuration]] call CBA_fnc_addPerFrameHandler;
 *
 * Public: No
 */

params ["_args", "_pfID"];
_args params ["_unit", "_dialStep", "_arr", "_explosive", "_ringtonePath", "_ringtoneDuration", "_volume", "_soundPitch", "_distance"];

if ((_dialStep mod 4) == 0) then {
    private _pos = _unit modelToWorldVisualWorld (_unit selectionPosition "RightHand");
    playSound3D [QUOTE(PATHTO_R(Data\Audio\DialTone.wss)), objNull, false, _pos, 5, 1, 5];
};
ctrlSetText [1400,format["Calling%1",_arr select (_dialStep - 4)]];

if (_dialStep >= (count _arr + 2)) then {
    [_pfID] call CALLSTACK(CBA_fnc_removePerFrameHandler);
    if ((count _explosive) > 0) then {
        [_unit, -1, [_explosive select 0, _explosive select 2], "ACE_Cellphone"] call FUNC(detonateExplosive);
    };
    _unit setVariable [QGVAR(Dialing), false, true];
    if (_unit == ace_player) then {
        ctrlSetText [1400,"Call Ended!"];
    };
};

if (_dialStep == _ringtoneDuration) then {
    if (
        ((count _explosive) > 0) &&
        {[_unit, -1, (_explosive # 0), (_explosive # 2), "ACE_Cellphone"] call FUNC(checkDetonateHandlers)}
    ) then {
        playSound3D [_ringtonePath, objNull, false, (getPosASL (_explosive # 0)), _volume, _soundPitch, _distance];
    };
};

_args set [1, _dialStep + 1];
