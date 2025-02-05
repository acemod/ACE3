#include "..\script_component.hpp"
/*
 * Author: Dedmen, johnb43
 * Text statement for the scope Night vision support stat.
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
TRACE_1("statTextStatement_scopeVisionMode",_config);

private _opticsModes = ("true" configClasses (_config >> "ItemInfo" >> "OpticsModes")) apply {
    private _visionMode = getArray (_x >> "visionMode") apply {toLowerANSI _x};
    [
        getNumber (_x >> "useModelOptics") == 1, // Is in optics
        _visionMode isEqualTo [], // Optional NVG
        "nvg" in _visionMode, // Integrated NVG
        "ti" in _visionMode // Integrated Thermal
    ]
};

private _primaryNVGIntegrated = false;
private _primaryNVGSupported = false;
private _primaryTiIntegrated = false;
private _secondaryNVGSupported = false;

{
    _x params ["_isPrimary", "_optionalNvg", "_integratedNVG", "_integratedTi"];

    if (_isPrimary) then {
        if (_integratedNVG) then {
            _primaryNVGIntegrated = true;
        };

        if (_optionalNvg) then {
            _primaryNVGSupported = true;
        };

        if (_integratedTi) then {
            _primaryTiIntegrated = true;
        };
    } else {
        if (_optionalNvg) then {
            _secondaryNVGSupported = true;
        };
    };
} forEach _opticsModes;

// Detecting Primary by useModelOptics works in 99.9% of cases.
// But on some scopes (from one specific mod) even the primary mode has useModelOptics=false
// So we have this workaround

// If we only have a single mode and it's a secondary, then consider it primary.
if (count _opticsModes == 1 && {!(_opticsModes select 0 select 0)}) then {
    _primaryNVGSupported = _secondaryNVGSupported;
};

// If all modes support NVGs, then the primary also supports it
if (!_primaryNVGSupported && {(_opticsModes select {_x select 1}) isEqualTo _opticsModes}) then {
    _primaryNVGSupported = true;
};

if (_primaryTiIntegrated && _primaryNVGIntegrated) exitWith {LLSTRING(statVisionMode_intPrimTi)};
if (_primaryTiIntegrated) exitWith {LLSTRING(statVisionMode_ti)};
if (_primaryNVGIntegrated) exitWith {LLSTRING(statVisionMode_intPrim)};
if (_primaryNVGSupported) exitWith {LLSTRING(statVisionMode_supPrim)};
if (_secondaryNVGSupported) exitWith {LLSTRING(statVisionMode_supSec)};

LLSTRING(statVisionMode_NoSup)
