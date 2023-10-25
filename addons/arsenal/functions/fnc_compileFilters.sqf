#include "..\script_component.hpp"
/*
 * Author: AmsteadRayle, Brett Mayson, johnb43
 * Create the internal filter arrays when needed for the first time.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
*/

if (!isNil QGVAR(filterListLeftPanel)) exitWith {};

private _fnc_addToTabs = {
    params ["_tabsList", "_tabsToAddTo", "_tabSide"];

    private _filter = [];

    {
        // Copy title, statement and condition
        _filter = +_finalArray;

        // Make filter name
        _filter set [0, [_class, _tabSide, [str _x, format ["0%1", _x]] select (_x < 10)] joinString ""];

        // No duplicates are possible here
        (_tabsList select _x) pushBack _filter;
    } forEach _tabsToAddTo;
};

private _filterListLeftPanel = [
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

private _filterListRightPanel = [
    [], // Optics 0
    [], // Side accs 1
    [], // Muzzle 2
    [], // Bipod 3
    [], // Mag 4
    [], // Throw 5
    [], // Put 6
    []  // Misc 7
];

private _class = "";
private _displayName = "";
private _statement = "";
private _condition = "";
private _finalArray = [];

{
    _class = configName _x;
    _displayName = getText (_x >> "displayName");
    _statement = getText (_x >> "statement");
    _condition = getText (_x >> "condition");
    (getArray (_x >> "tabs")) params ["_leftTabsList", "_rightTabsList"];

    if (_statement != "") then {
        _statement = compile _statement;
    };

    if (_condition != "") then {
        _condition = compile _condition;
    };

    _finalArray = ["", _displayName, _statement, _condition];
    TRACE_3("Filter array:", _finalArray, _leftTabsList, _rightTabsList);

    if (_leftTabsList isNotEqualTo []) then {
        [_filterListLeftPanel, _leftTabsList, "L"] call _fnc_addToTabs;
    };

    if (_rightTabsList isNotEqualTo []) then {
        [_filterListRightPanel, _rightTabsList, "R"] call _fnc_addToTabs;
    };
} forEach ("(getNumber (_x >> 'scope')) == 2" configClasses (configFile >> QGVAR(filters)));

GVAR(filterListLeftPanel) = _filterListLeftPanel;
GVAR(filterListRightPanel) = _filterListRightPanel;
