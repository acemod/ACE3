
#include "script_component.hpp"

["SettingsInitialized", {
    GVAR(categories) pushBack "";  //Ensure All Catagories is at top
    {
        if !(_x select 8 in GVAR(categories)) then {
            GVAR(categories) pushBack (_x select 8);
        };
    }forEach EGVAR(common,settings);
}] call EFUNC(common,addEventHandler);

if (isServer) then {
    private _currentSavedSettings = getMissionConfigValue ["ACE_MissionSettings", []];
    {
        _x params ["_settingName", "_value"];
        // Set the setting globally and force it
        TRACE_2("3den mission attribute",_settingName,_value);
        [_settingName, _value, true, true] call EFUNC(common,setSetting);
    } forEach _currentSavedSettings;
};