/*
 * Author: commy2
 * Read laser distance measurement from engine.
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

parseNumber ctrlText (_dlgRangefinder displayCtrl 151);
