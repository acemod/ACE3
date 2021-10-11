#include "script_component.hpp"
/*
 * Author: Seb
 * Renames a group to a given string (groupID), whilst checking that it is not an invalid name.
 *
 * Arguments:
 * 0: The group to be renamed <GROUP>
 * 1: The new name of the group <STRING>
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

private _lowerName = toLower _newName; // Case insensitive name search
private _nameAlreadyTaken = allGroups findIf {
    side _x isEqualTo side _group
    && {_lowerName isEqualTo toLower (groupID _x)}
    && {_group != _x}
} != -1;


if (_nameAlreadyTaken) then {
    [LLSTRING(RenameGroupAlreadyExists)] call EFUNC(common,displayTextStructured);
} else {
    _group setGroupIdGlobal [_newName];
};

!_nameAlreadyTaken
