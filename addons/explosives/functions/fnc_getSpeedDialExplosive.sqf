#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Gets the explosive from the speed dial entry.
 *
 * Arguments:
 * 0: Speed dial entry <STRING>
 *
 * Return Value:
 * Associated explosive <ARRAY>, empty array if invalid input
 * 0: Explosive <OBJECT>
 * 1: Code <STRING>
 * 2: Fuse time <NUMBER>
 *
 * Example:
 * "2113" call ace_explosives_fnc_getSpeedDialExplosive
 *
 * Public: Yes
 */

params [["_code", "", [""]]];
TRACE_1("params",_code);

if (_code == "" || {isNil QGVAR(cellphoneIEDs)} || {!(_code in GVAR(cellphoneIEDs))}) exitWith {
    [] // return
};

private _explosive = GVAR(cellphoneIEDs) get _code;

[_explosive select 0, _code, _explosive select 1] // return
