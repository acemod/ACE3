#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Wound handler for the toe-popper ammo; only does damage to legs
 *
 * Arguments:
 * 0: Unit (not used) <OBJECT>
 * 1: Damage <ARRAY>
 *
 * Return Value:
 * <ARRAY>
 *
 * Example:
 * [player, []] call ace_explosives_fnc_woundsHandlerToePopper
 *
 * Public: No
 */

params ["", "_array"];
TRACE_1("woundsHandlerToePopper",_this);

_array = _array select {
    _x params ["", "_part"];
    _part in ["LeftLeg", "RightLeg"]
};

_this set [1, _array];

_this // return
