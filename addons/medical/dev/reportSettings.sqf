#include "\z\ace\addons\medical\script_component.hpp"
// Dumps info on all non-default medical settings

[{
    private _medicalSettings = cba_settings_allSettings select {(_x select [0,11]) == "ace_medical"};
    INFO_1("-- Checking %1 medical Settings --",count _medicalSettings);
    {
        private _currentValue = missionNamespace getVariable [_x, "$"];
        private _defaultValue = (cba_settings_default getVariable [_x, []]) param [0, "#"];
        if !(_currentValue isEqualTo _defaultValue) then {
            diag_log text format ["%1: [Current %2] [Default: %3]", _x, _currentValue, _defaultValue];
        };
    } forEach _medicalSettings;
}, nil, 2] call CBA_fnc_waitAndExecute;
