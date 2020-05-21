#include "script_component.hpp"
/*
 * Author: SynixeBrett
 * Add a custom sorting method.
 *
 * Arguments:
 * 1: Tabs to add the stat to (ARRAY of ARRAYS)
   * 1.1 Left tab indexes (ARRAY of NUMBERS)
   * 1.2 Right tab indexes (ARRAY of NUMBERS)
 * 2: Sort class (STRING) (A unique string for each algorithm)
 * 3: Display name (STRING)
 * 4: Algorithm (CODE)
 *
 * Return Value:
 * 0: Array of IDs (ARRAY of STRINGS)
 *
 * Example:
 *  [[[0, 1]], "fireRateSort", "Sort by fire rate", {
        params ["_itemCfg"];
        private _fireModes = getArray (_itemCfg >> "modes");
        private _fireRate = [];

        {
            _fireRate pushBackUnique (getNumber (_itemCfg >> _x >> "reloadTime"));
        } foreach _fireModes;

        _fireRate sort true;
        _fireRate param [0, 0]
    }] call ACE_arsenal_fnc_addSort;
 *
 * Public: Yes
*/

params [
    ["_tabs", [[], []], [[]], 2],
    ["_class", "", [""]],
    ["_displayName", "", [""]],
    ["_statement", {}, [{}]]
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
        _arrayToSave set [0, ([_class, _sideString, [str _x, format ["0%1", _x]] select (_x < 10)] joinString "")];
        _returnArray pushBack (_arrayToSave select 0);
        (_tabsList select _x) pushBack _arrayToSave;
    } foreach _tabsToAddTo;
};

_finalArray = ["", _displayName, _statement];

if (count _leftTabs > 0) then {
    [GVAR(sortListLeftPanel), _leftTabs, "L", 0] call _fnc_addToTabs;
};

if (count _rightTabs > 0) then {
    [GVAR(sortListRightPanel), _rightTabs, "R", 1] call _fnc_addToTabs;
};

_returnArray
