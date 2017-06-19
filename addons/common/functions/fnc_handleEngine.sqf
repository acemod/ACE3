/*
 * Author: BaerMitUmlaut
 * Blocks turning on the vehicles engine if set by the status effect handler.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Engine state <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, "running"] call ace_common_fnc_handleEngine
 *
 * Public: No
 */
#include "script_component.hpp"
params ["_vehicle", "_engineOn"];

if (local _vehicle && {_engineOn} && {_vehicle getVariable [QGVAR(blockEngine), false]}) then {
    _vehicle engineOn false;
};
