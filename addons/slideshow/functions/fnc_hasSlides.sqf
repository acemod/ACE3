/*
 * Author: Jonpas
 * Checks if object has slides.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * Has Slides <BOOL>
 *
 * Example:
 * [object] call ace_slideshow_fnc_hasSlides;
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_object);

(!isNil {_object getVariable [QGVAR(Slides), nil]})
