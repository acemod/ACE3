#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Remove a sort from ACE Arsenal.
 *
 * Arguments:
 * 0: Array of IDs <ARRAY of STRINGS>
 *
 * Return Value:
 * None
 *
 * Example:
 * [["scopeSortL00", "scopeSortL01", "scopeSortL02", "scopeSortR07"]] call ace_arsenal_fnc_removeSort;
 *
 * Public: Yes
*/

params ["_IDList"];

// Compile sorts from config (in case this is called before preInit)
call FUNC(compileSorts);

private _currentID = "";
private _stringCount = 0;
private _tabSide = "";
private _tab = "";
private _tabToChange = [];

{
    _currentID = _x;
    _stringCount = count _currentID;

    // Make sure to keep at least 1 sort per category, so make default sort not deletable
    if ("ace_alphabetically" in toLower (_currentID select [0, _stringCount - 3])) then {
        continue;
    };

    // Get tab info
    _tabSide = _currentID select [_stringCount - 3, 1];
    _tab = _currentID select [_stringCount - 2, 2];

    _tab = parseNumber _tab;

    // Check which side to delete it from
    _tabToChange = if (_tabSide == "R") then {
        GVAR(sortListRightPanel) select _tab
    } else {
        GVAR(sortListLeftPanel) select _tab
    };

    // Remove entry (all names are unique, there are no duplicates)
    _tabToChange deleteAt (_tabToChange findIf {_x select 0 == _currentID});
} forEach _IDList;
