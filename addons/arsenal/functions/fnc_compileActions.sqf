#include "..\script_component.hpp"
/*
 * Author: Brett Mayson
 * Create the internal actions arrays when needed for the first time.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
*/

if (!isNil QGVAR(actionList)) exitWith {};

private _actionList = [
    [], // Primary 0
    [], // Handgun 1
    [], // Launcher 2
    [], // Uniform 3
    [], // Vests 4
    [], // Backpacks 5
    [], // Headgear 6
    [], // Goggles 7
    [], // NVGs 8
    [], // Binoculars 9
    [], // Map 10
    [], // GPS 11
    [], // Radio 12
    [], // Compass 13
    [], // Watch 14
    [], // Face 15
    [], // Voice 16
    []  // Insignia 17
];

private _configGroupEntries = "true" configClasses (configFile >> QGVAR(actions));

{
    private _scopeEditor = getNumber (_x >> "scopeEditor");

    if (is3DEN && {_scopeEditor != 2}) then {continue};

    private _configActions = "true" configClasses _x;

    private _rootClass = configName _x;
    private _rootDisplayName = getText (_x >> "displayName");
    private _rootCondition = getText (_x >> "condition");
    private _rootTabs = getArray (_x >> "tabs");

    if (_rootCondition != "") then {
        _rootCondition = compile _rootCondition;
    } else {
        _rootCondition = {true};
    };

    private _group = [];

    {
        private _class = configName _x;
        private _label = getText (_x >> "label");
        private _condition = getText (_x >> "condition");
        private _statement = getText (_x >> "statement");
        private _text = getText (_x >> "text");
        private _textStatement = getText (_x >> "textStatement");

        private _type = switch (false) do {
            case (_text == ""): {
                _statement = format ["""%1""", _text];
                ACTION_TYPE_TEXT
            };
            case (_textStatement == ""): {
                _statement = _textStatement;
                ACTION_TYPE_TEXT
            };
            case (_statement == ""): {
                _statement = _statement;
                ACTION_TYPE_BUTTON
            };
            default {
                -1
            };
        };

        if (_type == -1) then {
            continue;
        };

        _statement = compile format [QUOTE([GVAR(center)] call {%1}), _statement];

        if (_condition != "") then {
            _condition = compile _condition;
        } else {
            _condition = {true};
        };

        // No duplicates are possible here
        _group pushBack [_class, _type, _label, _statement, _condition];
    } forEach _configActions;

    {
        (_actionList select _x) pushBack [_rootClass, _rootDisplayName, _rootCondition, _group];
    } forEach _rootTabs;
} forEach _configGroupEntries;

GVAR(actionList) = _actionList;
