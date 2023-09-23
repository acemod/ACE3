#include "..\script_component.hpp"
/*
 * Author: Alganthe, johnb43
 * Create the internal stat arrays when needed for the first time.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
*/

if (!isNil QGVAR(statsListLeftPanel)) exitWith {};

private _fnc_addToTabs = {
    params ["_tabsList", "_tabsToAddTo", "_tabSide"];

    private _stat = [];

    // First gather all stats for a tab
    {
        // Make stat name
        _stat = +_finalArray;
        _stat set [5, [_class, _tabSide, [str _x, format ["0%1", _x]] select (_x < 10)] joinString ""];

        (_tabsList select _x) pushBack _stat;
    } forEach _tabsToAddTo;
};

// Sort by priority
private _fnc_sortLists = {
    params ["_tabs"];

    {
        // Sort numerically
        _x sort false;
    } forEach _tabs;
};

private _statsListLeftPanel = [
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
    []  // Watch 14
];

private _statsListRightPanel = [
    [], // Optics 0
    [], // Side accs 1
    [], // Muzzle 2
    [], // Bipod 3
    [], // Mag 4
    [], // Throw 5
    [], // Put 6
    []  // Misc 7
];

private _finalArray = [];
private _class = "";
private _stats = [];
private _displayName = "";
private _showBar = false;
private _showText = false;
private _condition = "";
private _priority = 0;

{
    _class = configName _x;
    _stats = getArray (_x >> "stats");
    _displayName = getText (_x >> "displayName");
    _showBar = getNumber (_x >> "showBar") == 1;
    _showText = getNumber (_x >> "showText") == 1;
    _condition = getText (_x >> "condition");
    _priority = getNumber (_x >> "priority");
    (getArray (_x >> "tabs")) params ["_leftTabsList", "_rightTabsList"];

    if (_condition != "") then {
        _condition = compile _condition;
    };

    _finalArray = [_priority, _stats, _displayName, [_showBar, _showText], [{}, {}, _condition], ""];

    if (_showBar) then {
        (_finalArray select 4) set [0, compile (getText (_x >> "barStatement"))];
    };

    if (_showText) then {
        (_finalArray select 4) set [1, compile (getText (_x >> "textStatement"))];
    };

    TRACE_3("stats array", _finalArray, _leftTabsList, _rightTabsList);

    if (_leftTabsList isNotEqualTo []) then {
        [_statsListLeftPanel, _leftTabsList, "L"] call _fnc_addToTabs;
    };

    if (_rightTabsList isNotEqualTo []) then {
        [_statsListRightPanel, _rightTabsList, "R"] call _fnc_addToTabs;
    };
} forEach ("(getNumber (_x >> 'scope')) == 2" configClasses (configFile >> "ace_arsenal_stats"));

// Sort
[_statsListLeftPanel] call _fnc_sortLists;
[_statsListRightPanel] call _fnc_sortLists;

GVAR(statsListLeftPanel) = _statsListLeftPanel;
GVAR(statsListRightPanel) = _statsListRightPanel;
