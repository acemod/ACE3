#include "..\script_component.hpp"
/*
 * Author: Alganthe
 * Remove a stat from ACE Arsenal.
 *
 * Arguments:
 * 0: Array of IDs <ARRAY of STRINGs>
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
    _tabToChange deleteAt (_tabToChange findIf {_x select 5 == _currentID});
} forEach _IDList;
