#include "script_component.hpp"
/*
 * Author: Brett Mayson
 * Add a custom sorting method.
 *
 * Arguments:
 * 0: Tabs to add stat to <ARRAY>
 *   0: Left Tab Indexes <ARRAY>
 *   1: Right Tab Indexes <ARRAY>
 * 1: Sort Class (a unique string for each algorithm) <STRING>
 * 2: Display Name <STRING>
 * 3: Algorithm <CODE>
 * 4: Condition (Optional)<CODE>
 *
 * Return Value:
 * 0: Array of IDs (ARRAY of STRINGS)
 *
 * Example:
 *  [[[0, 1], []], "fireRateSort", "Sort by fire rate", {
 *      params ["_itemCfg"];
 *      private _fireModes = getArray (_itemCfg >> "modes");
 *      private _fireRate = [];
 *
 *      {
 *          _fireRate pushBackUnique (getNumber (_itemCfg >> _x >> "reloadTime"));
 *      } foreach _fireModes;
 *
 *      _fireRate sort true;
 *      _fireRate param [0, 0]
 *  }] call ACE_arsenal_fnc_addSort;
 *
 * Public: Yes
 */

params [
    ["_tabs", [[], []], [[]], 2],
    ["_class", "", [""]],
    ["_displayName", "", [""]],
    ["_statement", {}, [{}]],
    ["_condition", {true}, [{}]]
];

_tabs params [
    ["_leftTabs", [], [[]]],
    ["_rightTabs", [], [[]]]
];

call FUNC(compileSorts);

private _returnArray = [];

private _fnc_addToTabs = {
    params ["_tabsList", "_tabsToAddTo", "_sideString"];
    {
        private _arrayToSave = +_finalArray;
        _arrayToSave set [0, [_class, _sideString, [str _x, format ["0%1", _x]] select (_x < 10)] joinString ""];
        _returnArray pushBack (_arrayToSave select 0);
        (_tabsList select _x) pushBack _arrayToSave;
    } forEach _tabsToAddTo;
};

_finalArray = ["", _displayName, _statement, _condition];

if (_leftTabs isNotEqualTo []) then {
    [GVAR(sortListLeftPanel), _leftTabs, "L", 0] call _fnc_addToTabs;
};

if (_rightTabs isNotEqualTo []) then {
    [GVAR(sortListRightPanel), _rightTabs, "R", 1] call _fnc_addToTabs;
};

_returnArray
