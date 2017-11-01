/*
 * Author: Glowbal
 * Export all config settings with their current values.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ACE_optionsmenu_fnc_exportSettings
 *
 * Public: No
 */

#include "script_component.hpp"

{
     /*_settingData = [
        _name,
        _typeName,
        _isClientSetable,
        _localizedName,
        _localizedDescription,
        _possibleValues,
        _isForced,
        _defaultValue
    ];*/
    _x params ["_name", "_typeName", "_isClientSetable", "_localizedName", "_localizedDescription", "_possibleValues", "_defaultValue"];

    if (GVAR(ClientSettingsExportIncluded) || !_isClientSetable) then {
        private _value = missionNamespace getVariable [_name, _defaultValue];
        private _formatedValue = switch (toLower _typeName) do {
            case ("scalar"): {
                format['value = %1;', _value];
            };
            case ("string"): {
                format['value = "%1";', _value];
            };
            case ("bool"): {
                if (!(_value isEqualType false)) then {ERROR("weird bool typename??");};
                _value = if ((_value isEqualType false) && {_value}) then {1} else {0};
                format ['value = %1;', _value];
            };
            case ("color"): {
                _value params [["_r",1], ["_b",0], ["_g",1], ["_a",1]];
                format ["value[] = {%1, %2, %3, %4};", _r, _b, _g, _a];
            };
            default {
                ERROR("unknown typeName");
                ""
            };

        };
        private _compiledConfigEntry = format ["
class %1 {
    %2
    typeName = %3;
    force = 1;
};", _name, _formatedValue, format['"%1"', _typeName]];

        "ace_clipboard" callExtension _compiledConfigEntry;
    };
} forEach EGVAR(common,settings);

"ace_clipboard" callExtension "--COMPLETE--";

[LSTRING(settingsExported)] call EFUNC(common,displayTextStructured);
