/*
 * Author: Garth de Wet (LH)
 * Adds an item to the select menu
 *
 * Arguments:
 * 0: List container <ARRAY/NUMBER>
 * 1: Display name <STRING>
 * 2: Picture <STRING>
 * 3: Data <STRING/CODE>
 *
 * Return value:
 * Container <ARRAY/NUMBER>
 *
 * Example:
 * [actions, "Banana", "UI\dot_ca.paa", "bananaContents"] call ace_interaction_fnc_addSelectableItem
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_4(_container,_displayName,_picture,_data);

if (_picture == "" || _picture == "PictureThing") then {
    _picture = QUOTE(PATHTOF(UI\dot_ca.paa));
};

private ["_index"];
_index = lbAdd [_container, _displayName];
lbSetData [_container, _index, str _data];
lbSetPicture [_container, _index, _picture];

_container
