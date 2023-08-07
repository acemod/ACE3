#include "script_component.hpp"
/*
 * Author: Vdauphin
 * Get surface of an item.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * Surface in m² <NUMBER>
 *
 * Example:
 * [player] call ace_cargo_fnc_getSurfaceItem
 *
 * Public: No
 */

params ["_object"];

private _bbr = 0 boundingBoxReal _object;
private _p1 = _bbr select 0;
private _p2 = _bbr select 1;
private _width = abs ((_p2 select 0) - (_p1 select 0));
private _length = abs ((_p2 select 1) - (_p1 select 1));

_width * _length
