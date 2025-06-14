#include "..\script_component.hpp"
/*
 * Author: esteldunedain
 * Connects/disconnects headphones to the mine detector.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Connect? <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, true] call ace_minedetector_fnc_connectHeadphones
 *
 * Public: No
 */

params ["_unit", "_state"];

_unit setVariable [QGVAR(isUsingHeadphones), _state, true];

if (_unit != ACE_player) exitWith {};

if (_state) then {
    [LLSTRING(HeadphonesConnected)] call EFUNC(common,displayTextStructured);
} else {
    [LLSTRING(HeadphonesDisconnected)] call EFUNC(common,displayTextStructured);
};
