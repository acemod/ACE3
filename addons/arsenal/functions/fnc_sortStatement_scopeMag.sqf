#include "script_component.hpp"
/*
 * Author: Alganthe, Brett Mayson
 * Statement to sort optics by their magnification.
 *
 * Arguments:
 * 0: Item Config <CONFIG>
 *
 * Return Value:
 * Sorting Value <NUMBER|STRING>
 *
 * Public: No
*/

params ["_config"];

private _minZoom = 999; // FOV, so smaller is more zoomed in
{
    _minZoom = _minZoom min getNumber (_x >> "opticsZoomMin");
} forEach configProperties [_config >> "ItemInfo" >> "OpticsModes", "isClass _x"];

if (_minZoom in [0, 999]) exitWith {"?"};

round ((0.25 / _minZoom) * 10)
