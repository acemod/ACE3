#include "script_component.hpp"
/*
 * Author: Dedmen
 * Text statement for the scope Night vision support stat.
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

params ["", "_config"];
TRACE_1("statTextStatement_scopeVisionMode",_config);

private _opticsModes = ("true" configClasses (_config >> "ItemInfo" >> "OpticsModes")) apply {
    private _visionMode = getArray (_x >> "visionMode");
    [
        getNumber (_x >> "useModelOptics") == 1, //is in optics
        _visionMode isEqualTo [], //optional NVG 
        "NVG" in _visionMode, //Integrated NVG
        "Ti" in _visionMode //Integrated Thermal
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
        }
    }
} forEach _opticsModes;

//Detecting Primary by useModelOptics works in 99.9% of cases.
//But on some scopes (from one specific mod) even the primary mode has useModelOptics=false
//So we have this workaround

if (
    count _opticsModes == 1 || //If we only have a single mode. And it's a secondary, then consider it primary.
    {{_x select 1} count _opticsModes  == count _opticsModes} //If every mode supports it. Then then the primary also supports it
) then {
    _primaryNVGSupported = _secondaryNVGSupported;
};

if (_primaryNVGIntegrated) exitWith {LLSTRING(statVisionMode_IntPrim)};
if (_primaryNVGSupported) exitWith {LLSTRING(statVisionMode_supPrim)};
if (_secondaryNVGSupported) exitWith {LLSTRING(statVisionMode_supSec)};

LLSTRING(statVisionMode_NoSup)
