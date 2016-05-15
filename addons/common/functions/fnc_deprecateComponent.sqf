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
#include "script_component.hpp"

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
    // Log deprecated component is loaded
    private _message = format["Component %1 is deprecated. It is replaced by %2. Please disable %1 and make use of %2. The component (%1) will no longer be available from version %3 and later.", _oldComponentName, _newComponentName, _version];
    systemChat format["ACE [WARNING] - %1", _message];
    ACE_LOGWARNING(_message);
};

_isReplacementAvailable;
