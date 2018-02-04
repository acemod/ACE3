/*
 * Author: Alganthe
 * Remove a stat from ACE Arsenal.
 *
 * Arguments:
 * 0: Array of IDs (ARRAY)
 *
 * Return Value:
 * None
 *
 * Example:
 * [["scopeStatL00","scopeStatL01","scopeStatL02","scopeStatR07"]] call ace_arsenal_fnc_removeStat;
 *
 * Public: Yes
*/
#include "script_component.hpp"

params ["_IDList"];

private _statsListLeftPanel = uiNamespace getVariable QGVAR(statsListLeftPanel);
private _statsListRightPanel = uiNamespace getVariable QGVAR(statsListRightPanel);

{
    private _currentID = _x;
    private _stringCount = count _currentID;
    private _side = _currentID select [_stringCount - 3, 1];
    private _tab = _currentID select [_stringCount - 2, 2];
    _tab = parseNumber _tab;

    private _tabToChange = if (_side == "R") then {
         _statsListRightPanel select _tab
    } else {
        _statsListLeftPanel select _tab
    };

    {
        private _currentPage = _x;

        {
            if (_x select 0 == _currentID) then {
                _currentPage deleteAt _forEachIndex;
            };
        } foreach _currentPage;
    } foreach _tabToChange;
} foreach _IDList;

// Clear empty pages
private _fnc_deleteEmptyPage = {
    {
        private _evaluatedTab = _forEachIndex;
        {
            if (count _x == 0) then {
                _markedForDeletion pushBack [_evaluatedTab, _forEachIndex];
            };
        } foreach _x;

        {
            (_statsListLeftPanel select (_x select 0)) deleteAt (_x select 1);
        } foreach _markedForDeletion;
    } foreach (_this select 0);
};

private _markedForDeletion = [];

[_statsListLeftPanel] call _fnc_deleteEmptyPage;
[_statsListRightPanel] call _fnc_deleteEmptyPage;
