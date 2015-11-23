/*
 * Author: commy2
 * Read laser distance measurement from engine and update compatible info elements.
 *
 * Argument:
 * None
 *
 * Return value:
 * Measured distance <NUMBER>
 *
 * Public: No
 */
#include "script_component.hpp"

disableSerialization;
private _dlgRangefinder = uiNamespace getVariable ["ACE_dlgRangefinder", displayNull];

private _range = ctrlText (_dlgRangefinder displayCtrl 151);
(_dlgRangefinder displayCtrl 1713151) ctrlSetText _range;

parseNumber _range
