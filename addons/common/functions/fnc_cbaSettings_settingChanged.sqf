#include "script_component.hpp"
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

params ["_settingName", "_newValue", ["_canBeChanged", false]];
TRACE_2("",_settingName,_newValue);

["ace_settingChanged", [_settingName, _newValue]] call CBA_fnc_localEvent;

if (!((toLower _settingName) in CBA_settings_needRestart)) exitWith {};
if (_canBeChanged) exitWith {WARNING_1("update cba setting [%1] to use correct Need Restart param",_settingName);};
if (!GVAR(settingsInitFinished)) exitWith {}; // Ignore changed event before CBA_settingsInitialized

WARNING_1("Setting [%1] changed mid-mission",_settingName);
[QGVAR(displayTextStructured), [format ["Setting %1 changed mid-mission. Mission restart may be required to prevent issues", _settingName], 4]] call CBA_fnc_localEvent;
