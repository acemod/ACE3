/*
 * Author: BaerMitUmlaut, esteldunedain, Jonpas
 * Puts together a full path to the given tag color texture. Internal ACE3 textures only.
 *
 * Arguments:
 * 0: The colour of the tag (valid colours are black, red, green and blue) <STRING>
 *
 * Return Value:
 * Texture (full path), "" if not found <STRING>
 *
 * Example:
 * texture = ["blue"] call ace_tagging_fnc_getTexture
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_color"];

if !((toLower _color) in ["black", "red", "green", "blue"]) exitWith {
    ACE_LOGERROR_1("%1 is not a valid tag colour.",_color);
    ""
};

QUOTE(PATHTOF(UI)) + "\tags\" + _color + "\" + str (floor (random 3)) + ".paa"
