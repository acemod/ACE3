#include "..\script_component.hpp"
/*
 * Author: Dedmen, johnb43, LinkIsGrim
 * Text statement for the binocular/NVG vision mode stat.
 *
 * Arguments:
 * 0: Not used
 * 1: Item config path <CONFIG>
 *
 * Return Value:
 * Stat Text <STRING>
 *
 * Public: No
 */

params ["", "_config"];
TRACE_1("statTextStatement_binoVisionMode",_config);

private _text = [];
private _visionModes = getArray (_config >> "visionMode") apply {toLowerANSI _x};
{
    if (_x in _visionModes) then {
        _text pushBack (localize ([LSTRING(VisionNormal), LSTRING(VisionNight), LSTRING(VisionThermal)] select _forEachIndex));
    };
} forEach ["normal", "nvg", "ti"];

_text joinString ", "
