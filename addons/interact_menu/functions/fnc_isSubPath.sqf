#include "..\script_component.hpp"
/*
 * Author: esteldunedain
 * Check if the first path is a subpath of the other
 *
 * Arguments:
 * 0: Long path <ARRAY>
 * 1: Short path <ARRAY>
 *
 * Return Value:
 * Bool <BOOL>
 *
 * Example:
 * [[["ACE_SelfActions", player], ["ace_gestures", player]], [["ACE_SelfActions", player]]] call ace_interact_menu_fnc_isSubPath
 *
 * Public: No
 */

params ["_longPath", "_shortPath"];

private _shortPathLength = count _shortPath;

_shortPathLength <= count _longPath && {(_longPath select [0, _shortPathLength]) isEqualTo _shortPath} // return
