/*
 * Author: Garth 'L-H' de Wet
 * Performs the dial tones and detonation of explosive.
 *
 * Arguments:
 * 0: Unit to do dialing <OBJECT>
 * 1: Index <NUMBER>
 * 2: Dialing points <ARRAY>
 * 3: IED code <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [FUNC(dialingPhone), 0.25, [_unit,4,_arr,_code]] call CALLSTACK(CBA_fnc_addPerFrameHandler);
 *
 * Public: No
 */
#include "script_component.hpp"
EXPLODE_4_PVT(_this select 0,_unit,_i,_arr,_code);
if ((_i mod 4) == 0) then {
    playSound3D [QUOTE(PATHTOF_R(Data\Audio\DialTone.wss)), objNull, false, (_unit ModelToWorld [0,0.2,2]), 15,1,2.5];
};
ctrlSetText [1400,format["Calling%1",_arr select (_i - 4)]];
if (_i >= (count _arr + 2)) then {
    [_this select 1] call CALLSTACK(cba_fnc_removePerFrameHandler);
    private "_explosive";
    _explosive = [_unit, _code] call FUNC(getSpeedDialExplosive);
    if (!isNull (_explosive)) then {
        [_unit, -1, [_explosive, 1]] call FUNC(detonateExplosive);
    };
    _unit setVariable [QGVAR(Dialing), false, true];
    if (_unit == ace_player) then {
        ctrlSetText [1400,"Call Ended!"];
    };
};
if (_i == (count _arr)) then {
    private "_explosive";
    _explosive = [_unit, _code] call FUNC(getSpeedDialExplosive);
    if (!isNull (_explosive)) then {
        playSound3D [QUOTE(PATHTOF_R(Data\Audio\Cellphone_Ring.wss)),objNull, false, getPosATL _explosive,3.16228,1,75];
    };
};
(_this select 0) set [1, _i + 1];
