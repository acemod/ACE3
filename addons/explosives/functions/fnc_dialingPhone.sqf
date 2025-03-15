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
 * 4: Duration before the explosive rings <NUMBER>
 * 5: Path to ringtone sound file <STRING>
 * 6: Sound volume <NUMBER>
 * 7: Sound pitch <NUMBER>
 * 8: Sound maximum distance <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ace_explosives_fnc_dialingPhone, 0.25, [_unit, 4, _arr, _explosive, _ringtonePath, _ringtoneDuration]] call CBA_fnc_addPerFrameHandler;
 *
 * Public: No
 */

params ["_args", "_pfhID"];
_args params ["_unit", "_dialStep", "_arr", "_explosive", "_ringtoneDuration", "_ringtonePath", "_volume", "_soundPitch", "_distance"];

if (_dialStep % 4 == 0) then {
    private _pos = _unit modelToWorldVisualWorld (_unit selectionPosition "RightHand");

    playSound3D [QPATHTO_R(Data\Audio\DialTone.wss), objNull, false, _pos, 5, 1, 5];
};

// UI is only open for player
if (_unit == ACE_player) then {
    ctrlSetText [1400, format ["Calling%1", _arr select (_dialStep - 4)]];
};

if (_dialStep >= (count _arr + 2)) exitWith {
    _pfhID call CALLSTACK(CBA_fnc_removePerFrameHandler);

    if (_explosive isNotEqualTo []) then {
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
    {_explosive isNotEqualTo []} &&
    {[_unit, -1, _explosive select 0, _explosive select 2, "ACE_Cellphone"] call FUNC(checkDetonateHandlers)}
) then {
    playSound3D [_ringtonePath, objNull, false, getPosASL (_explosive select 0), _volume, _soundPitch, _distance];
};

_args set [1, _dialStep + 1];
