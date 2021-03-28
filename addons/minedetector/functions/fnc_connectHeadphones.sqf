#include "script_component.hpp"
/*
 * Author: esteldunedain
 * Connect/disconnect headphones to the mine detector
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Connect? <BOOLEAN>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit, true] call ace_minedetector_fnc_connectHeadphones
 *
 * Public: No
 */

params ["_unit", "_state"];
_unit setVariable [QGVAR(isUsingHeadphones), _state];

if (_state) then {
    [localize LSTRING(HeadphonesConnected)] call EFUNC(common,displayTextStructured);
} else {
    [localize LSTRING(HeadphonesDisconnected)] call EFUNC(common,displayTextStructured);
};
