#include "script_component.hpp"
/*
 * Author: Gundy
 *
 * Description:
 * Return all available reporting modes
 *
 * Arguments:
 * NONE
 *
 * Return Value:
 * List of reporting modes <ARRAY>
 *
 * Public: No
 */


private _deviceConfigs = "true" configClasses (configFile >> "ACE_BFT" >> "Devices");

private _allReportingModes = [];
{
    if (isClass _x && {isArray (_x >> "reportingModes")}) then {
        private _deviceReportingModes = getArray (_x >> "reportingModes");
        // only append what isn't there already
        _allReportingModes append (_deviceReportingModes - _allReportingModes);
    };
} forEach _deviceConfigs;

_allReportingModes
