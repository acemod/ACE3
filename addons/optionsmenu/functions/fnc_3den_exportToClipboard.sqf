/*
 * Author: PabstMirror
 * Export all mission configs to a format for ace_server.pbo
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ACE_optionsmenu_fnc_3den_exportToClipboard
 *
 * Public: No
 */

#include "script_component.hpp"

private _currentSavedSettings = QUOTE(ADDON) get3DENMissionAttribute "ACE_MissionSettings";
if (isNil "_currentSavedSettings") then { ACE_LOGERROR("_currentSavedSettings nil"); };

TRACE_1("export",count _currentSavedSettings);

{
    _x params ["_xVarName", "_xValue"];

    //Find the ace_setting's data for this var:
    private _settingData = [];
    {
        if ((_x select 0) == _xVarName) exitWith {
            _settingData = _x;
        };
    } forEach EGVAR(common,settings);


    if (_settingData isEqualTo []) then {
        //Don't export a setting if it doesn't exist in current ace_settings (eg. a deprecated module)
        ACE_LOGERROR_1("Mission Setting [%1] Not in Current ACE_settings and will not be exported",_xVarName);
    } else {
        _settingData params ["", "_typeName", "", "_localizedName", "", "_possibleValues"];

        private _formatedValue = switch (toLower _typeName) do {
        case ("scalar"): {
                if (_possibleValues isEqualTo []) then {
                    format ['value = %1;', _xValue];
                } else {
                    format ['value = %1; \\ %2', _xValue, _possibleValues select _xValue];
                };
            };
            // case ("string"): {
            // format['value = "%1";', _xValue];
            // };
        case ("bool"): {
                if (!(_xValue isEqualType false)) then {ERROR("weird bool typename??");};
                _xValue = if ((_xValue isEqualType false) && {_xValue}) then {1} else {0};
                format ['value = %1;', _xValue];
            };
            // case ("color"): {
            // _xValue params [["_r",1], ["_b",0], ["_g",1], ["_a",1]];
            // format ["value[] = {%1, %2, %3, %4};", _r, _b, _g, _a];
            // };
            default {
                ERROR("unknown typeName");
                ""
            };
        };

        private _compiledConfigEntry = format ["
class %1 { \\ %2
    %3
    typeName = %4;
    force = 1;
};", _xVarName, _localizedName, _formatedValue, format['"%1"', _typeName]];

        "ace_clipboard" callExtension _compiledConfigEntry;
    };
} forEach _currentSavedSettings;

"ace_clipboard" callExtension "--COMPLETE--";

systemChat localize LSTRING(settingsExported);
