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

#include "script_component.hpp"

private ["_deviceConfigs","_allReportingModes","_deviceReportingModes"];

_deviceConfigs = "true" configClasses (configFile >> "ACE_BFT" >> "Devices");

_allReportingModes = [];
{
    if (isClass _x) then {
        if (isArray (_x >> "reportingModes")) then {
            _deviceReportingModes = getArray (_x >> "reportingModes");
            // only append what isn't there already
            _allReportingModes append (_deviceReportingModes - _allReportingModes);
        };
    }
} forEach _deviceConfigs;

_allReportingModes