/*
 * Author: PabstMirror
 * Text statement for the scope magnification stat.
 *
 * Arguments:
 * 0: not used
 * 1: item config path (CONFIG)
 *
 * Return Value:
 * String to display
 *
 * Public: No
 */
#include "script_component.hpp"

params ["", "_config"];
TRACE_1("statTextStatement_scopeMag",_config);

private _minZoom = 999; // FOV, so smaller is more zoomed in
{
    _minZoom = _minZoom min (getNumber (_x >> "opticsZoomMin"));
} forEach configProperties [_config >> "ItemInfo" >> "OpticsModes"];

if (_minZoom in [0, 999]) exitWith {"?"};

format ["%1x", (0.25/_minZoom) toFixed 1]
