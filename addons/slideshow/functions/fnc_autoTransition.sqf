/*
 * Author: Jonpas
 * Handles automatic slide transitions using waitAndExecute in a PFH-like manner resulting in no performance loss.
 *
 * Arguments:
 * 0: Objects <ARRAY>
 * 1: Controller Objects <ARRAY>
 * 2: Image Paths <ARRAY>
 * 3: Action Names <ARRAY>
 * 4: Duration <NUMBER> (0 disables automatic transitions)
 *
 * Return Value:
 * Parsed List <ARRAY>
 *
 * Example:
 * [objects, controllers, images, actionNames, duration] call ace_slideshow_fnc_autoTransition
 *
 * Public: No
 */
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

PARAMS_4(_objects,_images,_varString,_duration);

private ["_currentSlide"];

// Get current slide number of this slideshow
_currentSlide = missionNamespace getVariable [_varString, 0];

// Increment slide or return to first slide if reached end
_currentSlide = (_currentSlide + 1) mod (count _images);

// Save slide back into global variable (PFH's local variables do not persist through PFH run)
missionNamespace setVariable [_varString, _currentSlide];

// Set slide
{
    _x setObjectTextureGlobal [0, _images select _currentSlide];
} forEach _objects;

TRACE_4("Auto-transition",_images select _currentSlide,_currentSlide,count _images,_duration);


// Next slide
[FUNC(autoTransition), [_objects, _images, _varString, _duration], _duration] call EFUNC(common,waitAndExecute);
