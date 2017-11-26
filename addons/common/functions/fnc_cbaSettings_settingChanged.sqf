/*
 * Author: PabstMirror
 * Function for handeling a cba setting being changed.
 * Adds warning if global setting is changed after ace_settingsInitialized
 *
 * Arguments:
 * 0: Setting Name <STRING>
 * 1: New Value <ANY>
 * 2: Can be changed mid-mission <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * ["ace_medical_level", 1, false] call ace_common_fnc_cbaSettings_settingChanged;
 *
 * Public: No
 */
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_settingName", "_newValue", ["_canBeChanged", false]];
TRACE_2("",_settingName,_newValue);

["ace_settingChanged", [_settingName, _newValue]] call CBA_fnc_localEvent;

if (_canBeChanged) exitWith {};
if (!GVAR(settingsInitFinished)) exitWith {}; // Ignore changed event before CBA_settingsInitialized
if (CBA_settings_default getVariable [_settingName, []] param [7, 0] == 0) exitWith {}; // Ignore if not a global setting
if ((getNumber (configFile >> "ACE_settings" >> _settingName >> "canBeChanged")) == 1) exitWith {}; // Ignore if flagged as ok to change

WARNING_1("Global setting [%1] changed mid-mission",_settingName);
[QGVAR(displayTextStructured), [format ["Global setting %1 changed mid-mission. Mission restart may be required to prevent issues", _settingName], 4]] call CBA_fnc_localEvent;
