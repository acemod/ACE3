/*
 * Author: Jonpas
 * Checks if object has slides.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * Can Change Slides <BOOL>
 *
 * Example:
 * [object] call ace_slideshow_fnc_canChangeSlides;
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_object);

private ["_slides"];
_slides = _object getVariable [QGVAR(slides), nil];

(!isNil "_slides" && {_slides select 3 == 0})
