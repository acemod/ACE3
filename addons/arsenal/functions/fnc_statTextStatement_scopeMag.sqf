#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Text statement for the scope magnification stat.
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
TRACE_1("statTextStatement_scopeMag",_config);

private _minZoom = 999; // FOV, so smaller is more zoomed in
private _maxZoom = 1.25; // Cap at 1x zoomed out

private _opticsModes = "true" configClasses (_config >> "ItemInfo" >> "OpticsModes");
{
    // If there is a primary mode then just use that
    if (getNumber (_x >> "useModelOptics") == 1 || {count _opticsModes == 1}) exitWith {
        _minZoom = getNumber (_x >> "opticsZoomMin");
        _maxZoom = getNumber (_x >> "opticsZoomMax");
    };
    // Otherwise go through the optic's modes
    _minZoom = _minZoom min (getNumber (_x >> "opticsZoomMin"));
    _maxZoom = _maxZoom max (getNumber (_x >> "opticsZoomMax"));
} forEach _opticsModes;

if (_minZoom in [0, 999]) exitWith {"?"};

private _maxMagnification = (0.25 / _minZoom) toFixed 1;
private _minMagnification = (0.25 / _maxZoom);
if (_minMagnification < 1) then {
    _minMagnification = 1;
};
_minMagnification = _minMagnification toFixed 1;

if (_minMagnification == _maxMagnification) exitWith {
    format ["%1x", _maxMagnification]
};

format ["%1x-%2x", _minMagnification, _maxMagnification]
