/*
 * Author: Alganthe
 * Add a stat to ACE Arsenal.
 *
 * Arguments:
 * 0: Tabs to add the stat to (ARRAY of ARRAYS)
   * 0.1: Left tab indexes (ARRAY of NUMBERS)
   * 0.2 Right tab indexes (ARRAY of NUMBERS)
 * 1: Stat class (STRING) (A unique string for each stat)
 * 2: Config entries to pass (ARRAY of STRINGS)
 * 3: Title (STRING)
 * 4: Show bar / show text bools (ARRAY of BOOLS)
   * 4.1 Show bar (BOOL)
   * 4.2 Show text (BOOL)
 * 5: Array of statements (ARRAY of ARRAYS)
   * 5.1: Bar code (CODE)
   * 5.2 Text code (CODE)
   * 5.3 Condition code (CODE)
 * 6: Priority (NUMBER) (Optional)
 *
 * Return Value:
 * 0: Array of IDs (ARRAY of STRINGS)
 *
 * Example:
 * [[[0,1,2], [7]], "scopeStat", ["scope"], "Scope", [false, true], [{}, {
        params ["_statsArray", "_itemCfg"];
        getNumber (_itemCfg >> _statsArray select 0)
    }, {true}]] call ACE_arsenal_fnc_addStat
 *
 * Public: Yes
*/
#include "script_component.hpp"
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

_bools params [["_showBar", false, [false]], ["_showText", false, [false]]];

_statements params [
    ["_barStatement", {}, [{}]],
    ["_textStatement", {}, [{}]],
    ["_condition", {true}, [{}]]
];

call FUNC(compileStats);

private _returnArray = [];

private _fnc_addToTabs = {
    params ["_tabsList", "_tabsToAddTo", "_sideString", "_returnIndex"];
    {
        private _currentTab = _tabsList select _x;

        private _finalID = [_class, _sideString, [str _x, format ["0%1", _x]] select (_x < 10)] joinString "";

        if ({{_x select 0  == _finalID} count _x > 0} count _currentTab > 0) then {
            TRACE_1("A stat with this ID already exists", _finalID);
        } else {

            private _arrayToSave = +_finalArray;
            _arrayToSave set [0, _finalID];
            _returnArray pushBack _finalID;

            // Add to existing page if there's enough space, otherwise create a new page
            if ({count _x < 5} count _currentTab > 0) then {
                {
                    if (count _x < 5) exitWith {
                        (_currentTab select _forEachIndex) append [_arrayToSave];
                    };
                } foreach _currentTab;
            } else {
                _currentTab pushBack [_arrayToSave];
            };
        };
    } foreach _tabsToAddTo;
};

private _finalArray = ["", _stats, _title, [_showBar, _showText], [_barStatement, _textStatement, _condition], _priority];

if (count _leftTabs > 0) then {
    [GVAR(statsListLeftPanel), _leftTabs, "L", 0] call _fnc_addToTabs;
};

if (count _rightTabs > 0) then {
    [GVAR(statsListRightPanel), _rightTabs, "R", 1] call _fnc_addToTabs;
};

_returnArray
