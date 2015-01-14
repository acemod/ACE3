/*
 * Author: commy2
 *
 * Read laser distance measurement from engine and update compatible info elements.
 *
 * Argument:
 * Nothing
 *
 * Return value:
 * Measured distance (Number)
 */

#include "script_component.hpp"

private ["_dlgRangefinder", "_range"];

disableSerialization;
_dlgRangefinder = uiNamespace getVariable ["ACE_dlgRangefinder", displayNull];

_range = ctrlText (_dlgRangefinder displayCtrl 151);
(_dlgRangefinder displayCtrl 1713151) ctrlSetText _range;

parseNumber _range
