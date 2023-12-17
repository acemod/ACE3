#include "..\script_component.hpp"
/*
 * Author: Brett Mayson, johnb43
 * Adds a custom sorting method.
 *
 * Arguments:
 * 0: Tabs to add sort to <ARRAY>
 * - 0: Left Tab Indexes <ARRAY of NUMBERS>
 * - 1: Right Tab Indexes <ARRAY of NUMBERS>
 * 1: Sort class (a unique string for each algorithm) <STRING>
 * 2: Title <STRING>
 * 3: Algorithm <CODE>
 * 4: Condition <CODE> (default: {true})
 *
 * Return Value:
 * 0: Array of IDs <ARRAY of STRINGS>
 *
 * Example:
 *  [[[0, 1], []], "fireRateSort", "Sort by fire rate", {
 *      params ["_itemCfg"];
 *      private _fireModes = getArray (_itemCfg >> "modes");
 *      private _fireRate = [];
 *
 *      {
 *          _fireRate pushBackUnique (getNumber (_itemCfg >> _x >> "reloadTime"));
 *      } forEach _fireModes;
 *
 *      _fireRate sort true;
 *      _fireRate param [0, 0]
 *  }] call ace_arsenal_fnc_addSort
 *
 * Public: Yes
 */

params [
    ["_tabs", [[], []], [[]], 2],
    ["_class", "", [""]],
    ["_title", "", [""]],
    ["_statement", {}, [{}]],
    ["_condition", {true}, [{}]]
];

_tabs params [
    ["_leftTabs", [], [[]]],
    ["_rightTabs", [], [[]]]
];

// Compile sorts from config (in case this is called before preInit)
call FUNC(compileSorts);

private _return = [];

private _fnc_addToTabs = {
    params ["_tabsList", "_tabsToAddTo", "_tabSide"];

    private _sort = [];
    private _sortName = "";
    private _currentTab = [];

    {
        // Copy title, statement and condition
        _sort = +_finalArray;

        // Make sort name
        _sortName = [_class, _tabSide, [str _x, format ["0%1", _x]] select (_x < 10)] joinString "";
        _sort set [0, _sortName];

        _currentTab = _tabsList select _x;

        // Find if there is an entry with same ID
        if ((_currentTab findIf {(_x select 0) == _sortName}) == -1) then {
            _currentTab pushBack _sort;
            _return pushBack _sortName;
        } else {
            TRACE_1("A sort with this ID already exists", _sortName);
        };
    } forEach _tabsToAddTo;
};

private _finalArray = ["", _title, _statement, _condition];

if (_leftTabs isNotEqualTo []) then {
    [GVAR(sortListLeftPanel), _leftTabs, "L"] call _fnc_addToTabs;
};

if (_rightTabs isNotEqualTo []) then {
    [GVAR(sortListRightPanel), _rightTabs, "R"] call _fnc_addToTabs;
};

_return
