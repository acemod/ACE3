#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Transfers a client's old ace settings to cba
 *
 * Arguments:
 * 0: Old Version <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["3.11.0"] call ace_common_fnc_cbaSettings_transferUserSettings
 *
 * Public: No
 */

if (!hasInterface) exitWith {};

params [["_lastVersion", "", [""]]];

if ((parseNumber _lastVersion) >= 3.12) exitWith {};

INFO("-Transfering old ACE_Settings to CBA-");

private _aceSettings = configProperties [configFile >> "ACE_Settings", "isClass _x"];
{
    private _settingName = configName _x;
    private _isClientSettable = (getNumber (_x >> "isClientSettable")) > 0;
    private _profileVar = profileNamespace getVariable _settingName;

    if (!isNil "_profileVar") then {
        private _currentValue = [_settingName, "client"] call CBA_settings_fnc_get;
        if (_isClientSettable && {!(_currentValue isEqualTo _profileVar)}) then {
            // CBA_settings_fnc_set will do type checking for the old profile var
            private _ret = [_settingName, _profileVar, 0, "client", true] call CBA_settings_fnc_set;
            INFO_3("Transfering setting [%1: %2] returned %3", _settingName, _profileVar, _ret);
        };
    };
} forEach _aceSettings;

INFO("-Finished Transfering-");
