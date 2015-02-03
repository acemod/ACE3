/*
 * Author: CAA-Picard
 * Load the user setable setting from the user profile.
 * Config < Server UserConfig < Mission Config < Client settings
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

_fnc_setSettingFromProfile = {
    EXPLODE_1_PVT(_this,_optionEntry);

    _name = configName _optionEntry;
    _valueEntry = _optionEntry >> "value";
    _isClientSetable = getNumber (_optionEntry >> "isClientSetable");

    if (_isClientSetable > 0) then {
        if !(missionNamespace getVariable format ["%1_forced", _name, false]) then {
            _profileValue = profileNamespace getvariable _name;
            if !(isNil _profileValue) then {
                if (typeName _profileValue == typeName (missionNamespace getvariable _name)) then {
                    missionNamespace setvariable [_name, _profileValue];
                };
            };
        };
    };
};

// Iterate through settings from main config
_countOptions = count (configFile >> "ACE_Settings");
for "_index" from 0 to (_countOptions - 1) do {
    _optionEntry = (configFile >> "ACE_Settings") select _index;
    [_optionEntry] call _fnc_setSettingFromProfile;

};

// Iterate through settings from mission config
_countOptions = count (missionConfigFile >> "ACE_Settings");
for "_index" from 0 to (_countOptions - 1) do {
    _optionEntry = (missionConfigFile >> "ACE_Settings") select _index;
    [_optionEntry] call _fnc_setSettingFromProfile;
};
