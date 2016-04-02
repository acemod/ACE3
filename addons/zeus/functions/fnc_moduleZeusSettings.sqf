/*
 * Author: SilentSpike
 * Module for adjusting various aspects of zeus
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: units <ARRAY>
 * 2: activated <BOOL>
 *
 * Return Value:
 * None <NIL>
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_logic", "_units", "_activated"];

if !(_activated) exitWith {};

[_logic, QGVAR(zeusAscension), "zeusAscension"] call CFUNC(readSettingFromModule);
[_logic, QGVAR(zeusBird), "zeusBird"] call CFUNC(readSettingFromModule);
[_logic, QGVAR(radioOrdnance), "radioOrdnance"] call CFUNC(readSettingFromModule);
[_logic, QGVAR(revealMines), "revealMines"] call CFUNC(readSettingFromModule);
[_logic, QGVAR(remoteWind), "remoteWind"] call CFUNC(readSettingFromModule);
