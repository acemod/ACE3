#include "..\script_component.hpp"
/*
 * Author: PabstMirror, LinkIsGrim
 * Text statement for the binocular magnification stat.
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
TRACE_1("statTextStatement_binoMag",_config);

private _minZoom = getNumber (_config >> "opticsZoomMin"); // FOV, so smaller is more zoomed in
private _maxZoom = getNumber (_config >> "opticsZoomMax");

if (_minZoom == 0) exitWith {"?"};

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
