/*
 * Author: Alganthe
 * Create the internal stats arrays on preStart
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

private _fnc_addToTabs = {
    params ["_tabsList", "_tabsToAddTo"];
    {
        private _currentTab = _tabsList select _x;
        private _availablePagesCount = {count _x < 5} count _currentTab;

        if (_availablePagesCount > 0) then {
            _finalArray set [0,(_class +  str _x)];
            (_currentTab select 0) append [_finalArray];
        } else {
            _finalArray set [0, str (_class + _x)];
            _currentTab pushBack [_finalArray];
        };
    } foreach _tabsToAddTo;
};

private _statsListLeftPanel = uiNamespace getVariable [QGVAR(statsListLeftPanel), [
    [[]], // Primary 0
    [[]], // Handgun 1
    [[]], // Launcher 2
    [[]], // Uniform 3
    [[]], // Vests 4
    [[]], // Backpacks 5
    [[]], // Headgear 6
    [[]], // Goggles 7
    [[]], // NVGs 8
    [[]], // Binoculars 9
    [[]], // Map 10
    [[]], // GPS 11
    [[]], // Radio 12
    [[]], // Compass 13
    [[]] // Watch 14
]];

private _statsListRightPanel = uiNamespace getVariable [QGVAR(statsListRightPanel), [
    [[]], // Optics 0
    [[]], // Side accs 1
    [[]], // Muzzle 2
    [[]], // Bipod 3
    [[]], // Mag 4
    [[]], // Throw 5
    [[]], // Put 6
    [[]] // Misc 7
]];

//------------------------- Config handling
private _configEntries = "(getNumber (_x >> 'scope')) == 2" configClasses (configFile >> "CfgACEArsenalStats");

{
    private _finalArray = [];

    private _class = configName _x;
    private _stats = getArray (_x >> "stats");
    private _displayName = getText (_x >> "displayName");
    private _showBar = getNumber (_x >> "showBar") == 1;
    private _showText = getNumber (_x >> "showText") == 1;
    private _arguments = getArray (_x >> "arguments");
    private _condition = (getText (_x >> "condition"));
    (getArray (_x >> "tabs")) params ["_leftTabsList", "_rightTabsList"];

    if (_condition != "") then {
        _condition = compile _condition;
    };

    _finalArray = ["", _stats, _displayName, [_showBar, _showText], _arguments, [{}, {}, _condition]];
    TRACE_3("stats array", _finalArray, _leftTabsList, _rightTabsList);

    if (_showBar) then {
        private _barStatement = compile (getText (_x >> "barStatement"));
        (_finalArray select 5) set [0, _barStatement];
    };

    if (_showText) then {
        private _textStatement = compile (getText (_x >> "textStatement"));
        (_finalArray select 5) set [1, _textStatement];
    };

    if (count _leftTabsList > 0) then {
        [_statsListLeftPanel, _leftTabsList] call _fnc_addToTabs;
    };

    if (count _rightTabsList > 0) then {
        [_statsListRightPanel, _rightTabsList] call _fnc_addToTabs;
    };
} foreach _configEntries;

//------------------------- Config Handling

uiNamespace setVariable [QGVAR(statsListLeftPanel), _statsListLeftPanel];
uiNamespace setVariable [QGVAR(statsListRightPanel), _statsListRightPanel];
