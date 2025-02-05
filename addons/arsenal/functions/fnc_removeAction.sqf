#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Remove a custom action button from ACE Arsenal.
 *
 * Arguments:
 * 0: Array of IDs <ARRAY of STRINGS>
 *
 * Return Value:
 * None
 *
 * Example:
 * [["TAG_myActions~text~0", "TAG_myActions~statement~0", "TAG_myActions~button~0"]] call ace_arsenal_fnc_removeAction
 *
 * Public: Yes
*/

params ["_IDList"];

// Compile sorts from config (in case this is called before preInit)
call FUNC(compileActions);

// Remove entries (all names are unique, there are no duplicates)
{
    (_x splitString "~") params ["_rootClass", "_class", "_tab"];

    _tab = parseNumber _tab;

    {
        if ((_x select 0) == _rootClass) exitWith {
            (_x select 3) deleteAt ((_x select 3) findIf {(_x select 0) == _class});

            // If no entries left in group, remove group
            if ((_x select 3) isEqualTo []) then {
                (GVAR(actionList) select _tab) deleteAt _forEachIndex;
            };
        };
    } forEach (GVAR(actionList) select _tab);
} forEach _IDList;

nil // return
