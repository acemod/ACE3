#include "..\script_component.hpp"
/*
 * Author: Alganthe, johnb43, LinkIsGrim
 * Adds a stat to ACE Arsenal.
 *
 * Arguments:
 * 0: Tabs to add the stat to <ARRAY of ARRAYs>
 * - 0: Left tab indexes <ARRAY of NUMBERs>
 * - 1: Right tab indexes <ARRAY of NUMBERs>
 * 1: Stat class (unique string for each stat) <STRING>
 * 2: Config entries to pass <ARRAY of STRINGs>
 * 3: Title <STRING>
 * 4: Show bar / show text bools <ARRAY of BOOLs>
 * - 0: Show bar <BOOL> (default: false)
 * - 1: Show text <BOOL> (default: false)
 * 5: Array of statements <ARRAY of CODE>
 * - 0: Bar code <CODE> (default: {})
 * - 1: Text code <CODE> (default: {})
 * - 2: Condition code <CODE> (default: {true})
 * 6: Priority <NUMBER> (default: 0)
 *
 * Return Value:
 * 0: Array of IDs <ARRAY of STRINGs>
 *
 * Example:
 * [[[0, 1, 2], [7]], "scopeStat", ["scope"], "Scope", [false, true], [{}, {
 *     params ["_statsArray", "_itemCfg"];
 *     getNumber (_itemCfg >> _statsArray select 0)
 * }, {true}]] call ace_arsenal_fnc_addStat
 *
 * Public: Yes
 */

params [
    ["_tabs", [[], []], [[]], 2],
    ["_class", "", [""]],
    ["_stats", [], [[]]],
    ["_title", "", [""]],
    ["_bools", [false, false], [[]], 2],
    ["_statements", [{}, {}, {true}], [[]], 3],
    ["_priority", 0, [0]]
];

_tabs params [
    ["_leftTabs", [], [[]]],
    ["_rightTabs", [], [[]]]
];

_bools params [
    ["_showBar", false, [false]],
    ["_showText", false, [false]]
];

_statements params [
    ["_barStatement", {}, [{}]],
    ["_textStatement", {}, [{}]],
    ["_condition", {true}, [{}]]
];

// Compile stats from config (in case this is called before preInit)
call FUNC(compileStats);

private _return = [];
private _changes = [];

private _fnc_addToTabs = {
    params ["_tabsList", "_tabsToAddTo", "_tabSide"];

    private _statName = "";
    private _currentTab = [];
    private _stat = [];

    {
        // Make stat name
        _statName = [_class, _tabSide, [str _x, format ["0%1", _x]] select (_x < 10)] joinString "";
        _currentTab = _tabsList select _x;

        // Find if there is an entry with same ID
        if (_currentTab findIf {_x select 5 == _statName} != -1) then {
            TRACE_1("A stat with this ID already exists",_statName);
        } else {
            _stat = +_finalArray;
            _stat set [5, _statName];

            _currentTab pushBack _stat;

            _return pushBack _statName;

            // Store information, so that only tabs that were changed can be sorted again
            _changes pushBackUnique [_x, _tabSide];
        };
    } forEach _tabsToAddTo;
};

private _finalArray = [_priority, _stats, _title, [_showBar, _showText], [_barStatement, _textStatement, _condition], ""];

if (_leftTabs isNotEqualTo []) then {
    [GVAR(statsListLeftPanel), _leftTabs, "L"] call _fnc_addToTabs;
};

if (_rightTabs isNotEqualTo []) then {
    [GVAR(statsListRightPanel), _rightTabs, "R"] call _fnc_addToTabs;
};

private _stats = [];
private _tabToChange = [];

// Ensure priority is kept
{
    _x params ["_tab", "_tabSide"];

    _tabToChange = [
        GVAR(statsListLeftPanel),
        GVAR(statsListRightPanel)
    ] select (_tabSide == "R");

    _stats = _tabToChange select _tab;

    // Sort by priority
    _stats sort false;
} forEach _changes;

_return
