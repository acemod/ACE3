#include "script_component.hpp"
/*
 * Author: Alganthe
 * Remove a stat from ACE Arsenal.
 *
 * Arguments:
 * 0: Array of IDs <ARRAY of STRINGS>
 *
 * Return Value:
 * None
 *
 * Example:
 * [["scopeStatL00", "scopeStatL01", "scopeStatL02", "scopeStatR07"]] call ace_arsenal_fnc_removeStat;
 *
 * Public: Yes
*/

params ["_IDList"];

// Compile stats from config (in case this is called before preInit)
call FUNC(compileStats);

private _currentID = "";
private _stringCount = 0;
private _tabSide = "";
private _tab = "";
private _tabToChange = [];
private _changes = [];

{
    // Get tab info
    _currentID = _x;
    _stringCount = count _currentID;
    _tabSide = _currentID select [_stringCount - 3, 1];
    _tab = _currentID select [_stringCount - 2, 2];

    _tab = parseNumber _tab;

    // Check which side to delete it from
    _tabToChange = if (_tabSide == "R") then {
        GVAR(statsListRightPanel) select _tab
    } else {
        GVAR(statsListLeftPanel) select _tab
    };

    // Delete stat
    {
        _x deleteAt (_x findIf {_x select 0 == _currentID});
    } forEach _tabToChange;

    // Store information, so that only tabs that were changed can be sorted again
    _changes pushBackUnique [_tab, _tabSide];
} forEach _IDList;

private _statsFlat = [];
private _stats = [];

// Fill empty spots
{
    _x params ["_tab", "_tabSide"];

    _tabToChange = if (_tabSide == "R") then {
        GVAR(statsListRightPanel)
    } else {
        GVAR(statsListLeftPanel)
    };

    _statsFlat = [];

    // Get all stats of a tab into a single array
    {
        _statsFlat append _x;
    } forEach (_tabToChange select _tab);

    // Priority has stayed intact, so no need to sort
    _stats = [];

    // Group stats into groups of 5
    for "_index" from 0 to count _statsFlat - 1 step 5 do {
        _stats pushBack (_statsFlat select [_index, _index + 5]);
    };

    _tabToChange set [_tab, _stats];
} forEach _changes;
