#include "script_component.hpp"
/*
 * Author: Seb
 * Renames a group to a given string (groupID), whilst checking that it is not an invalid name.
 *
 * Arguments:
 * 0: The group to be renamed
 * 1: The new name of the group.
 *
 * Return Value:
 * Whether the group was succesfully renamed <BOOL>
 *
 * Example:
 * [group player, "leet squad"] call ace_interaction_fnc_renameGroup
 *
 * Public: No
 */

params [
    ["_group", grpNull, [grpNull]],
    ["_newName", "", [""]]
];
if (_newName isEqualTo (groupID _group)) exitWith {true};

_nameAlreadyTaken = (toLower _newName) in (allGroups apply {toLower (groupID _x)});

if (_nameAlreadyTaken) then {
    hint LLSTRING(RenameGroupAlreadyExists);
} else {
    _group setGroupIdGlobal [_newName];
};

!_nameAlreadyTaken