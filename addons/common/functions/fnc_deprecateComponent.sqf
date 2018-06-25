#include "script_component.hpp"
/*
 * Author: Glowbal
 * Mark a component as deprecated and switches it to a new component if that is available
 *
 * Arguments:
 * 0: Component <Array>
 * 1: New component <Array>
 * 2: Version when the compent will be removed <String>
 *
 * Return Value:
 * Replaced by new component <Boolean>
 *
 * Public: No
 *
 * Example:
 * [["ace_sitting", "ace_sitting_enabled"], ["acex_sitting", "acex_sitting_enabled"], "3.7.0"] call ace_common_fnc_deprecateComponent;
 */

params ["_oldComponent", "_newComponent", "_version"];

_oldComponent params ["_oldComponentName", "_oldSettingName"];
_newComponent params ["_newComponentName", "_newSettingName"];

private _isReplacementAvailable = isClass (configFile >> "CfgPatches" >> _newComponentName);
private _isDeprecatedLoaded = missionNamespace getvariable [_oldSettingName, false];
private _isReplacementLoaded = missionNamespace getvariable [_newSettingName, false];

if (_isDeprecatedLoaded && {_isReplacementAvailable} && {!_isReplacementLoaded}) then {
    [_newSettingName, true, true, true] call FUNC(setSetting);
};

if (_isDeprecatedLoaded && {!_isReplacementLoaded}) then {
    private _componentVersion = getText (configFile >> "CfgPatches" >> _oldComponentName >> "version");
    ((_componentVersion splitString ".") apply {parseNumber _x}) params ["_componentMajor", "_componentMinor", "_componentPatch"];
    ((_version splitString ".") apply {parseNumber _x}) params ["_major", "_minor", "_patch"];

    switch (true) do {
        case (_componentMajor >= _major && {_componentMinor >= _minor} && {_componentPatch >= _patch}): { // Removed from this version
            private _message = format[
                "Component %1 is deprecated. It has been replaced by %2. The component %1 is no longer usable on this version. ", _oldComponentName, _newComponentName, _version];
            systemChat format["ACE [ERROR] - %1", _message];
            ERROR(_message);
        };
        case (_componentMajor >= _major && {_componentMinor >= _minor-1}): { // Removed the next this version
            private _message = format[
                "Component %1 is deprecated. It is replaced by %2. Please disable %1 and make use of %2. "
                + "The component (%1) will no longer be available from version %3 and later.", _oldComponentName, _newComponentName, _version];
            systemChat format["ACE [WARNING] - %1", _message];
            WARNING(_message);
        };
        case (_componentMajor == _major && {_componentMinor >= _minor - 2}): { // we are in a version leading up to removal
            private _message = format[
                "Component %1 is deprecated. It is replaced by %2. Please disable %1 and make use of %2. "
                + "The component (%1) will no longer be available from version %3 and later.", _oldComponentName, _newComponentName, _version];
            WARNING(_message);
        };
        default {
        };
    };
};

_isReplacementAvailable;
