#include "script_component.hpp"
/*
 * Author: Alganthe, SynixeBrett
 * Statement for the scope magnification sort.
 *
 * Arguments:
 * 0: item config path (CONFIG)
 *
 * Return Value:
 * Number to sort by
 *
 * Public: No
*/

params ["_config"];

private _minZoom = 999; // FOV, so smaller is more zoomed in
{
    _minZoom = _minZoom min (getNumber (_x >> "opticsZoomMin"));
} forEach configProperties [_config >> "ItemInfo" >> "OpticsModes"];

if (_minZoom in [0, 999]) exitWith {"?"};

round ((0.25/_minZoom) * 10)
