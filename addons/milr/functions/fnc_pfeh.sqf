#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Updates the displaced laser when needed
 *
 * Arguments:
 * 0: PFEH Data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_milr_fnc_pfeh
 *
 * Public: No
 */

params ["_pfData"]; // empty array on init
private _player = ACE_player;
private _range = GVAR(data) getOrDefault ["range", 0];
private _zero = currentZeroing _player;
// possible ToDo ballistic tilt as well?

if ([_range, _zero, GVAR(currentPointer)] isEqualTo _pfData) exitWith {}; // no state change

private _player = ACE_player;
if !(_player call CBA_fnc_canUseWeapon) exitWith {}; // in vehicle etc

private _item = if ((GVAR(data) getOrDefault ["range", 0]) == RANGE_IN_PROGRESS) then { 
    QGVAR(000)
} else {
    private _elevationMRAD = if (_range <= 0) then {
        0
    } else {
        ([_range, 0, 0, 0, GVAR(data)] call EFUNC(xm157,ballistics_calculator)) params ["_be","_bw"];
        TRACE_2("ballistics_calculator",_be,_bw);
        // systemChat format ["DEBUG Ballistics: %1 - %2", _be, _bw];
        _be
    };
    GVAR(data) set ["elevationMRAD", _elevationMRAD];

    if (_elevationMRAD <= 0) exitWith { 
        QGVAR(000) // negative or zero, just use base item (see how much a problem this is with high weapon zeroing)
    };
    _elevationMRAD = (_elevationMRAD max 0) min 30; // clamp
    private _best10step = if (_elevationMRAD <= 10) then { // tenths of MRADs, variable precision
        2 * round (_elevationMRAD * 5); // 0-10 @ 2x increments
    } else {
        10 * round (_elevationMRAD); // 10-30 @ 10x increments
    };
    // get best item for the elevation
    format ["%1_%2", QUOTE(ADDON), [_best10step, 3] call CBA_fnc_formatNumber];
};

if (_item != GVAR(currentPointer)) then {
    TRACE_1("Updating Item",_item);
    // systemChat format ["DEBUG New Item: %1", _item];
    _player addPrimaryWeaponItem _item;
};

_pfData set [0, _range];
_pfData set [1, _zero];
_pfData set [2, GVAR(currentPointer)];

call FUNC(display_refresh);
