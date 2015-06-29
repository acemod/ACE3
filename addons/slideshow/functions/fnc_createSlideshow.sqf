/*
 * Author: Jonpas, DaC
 * Prepares necessary variables and default image.
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
 * [[object1, object2, object3], [controller1], ["images\image1.paa", "images\image2.paa"], ["Action1", "Action2"], 5] call ace_slideshow_fnc_createSlideshow;
 *
 * Public: Yes
 */
#define DEBUG_MODE_FULL
#include "script_component.hpp"

PARAMS_5(_objects,_controllers,_images,_names,_duration);

// Add controllers to objects if they support it
{
    if (typeOf _x in [CLASSNAMES_OBJECTS, CLASSNAMES_BOTH]) then {
        _objects pushBack _x;
    };
} forEach _controllers;

// Objects synced to the module
{
    if (typeOf _x in [CLASSNAMES_OBJECTS, CLASSNAMES_BOTH]) then {
        _objects pushBack _x;
    };
    if (typeOf _x in [CLASSNAMES_BOTH, CLASSNAMES_CONTROLLERS]) then { 
        _controllers pushBack _x;
    };
} forEach (synchronizedObjects _logic);

// If no controllers use objects as controllers
if (count _controllers == 0) then {
    _controllers = _objects;
};

TRACE_4("Information",_objects,_controllers,_images,_names);

// Default images on whiteboards (first image)
{
    _x setObjectTextureGlobal [0, _images select 0];
} forEach _objects;

// Set first image as default and set variable on controllers with necessary information
{
    _x setVariable [QGVAR(slides), [_objects, _images, _names, _duration], true];
    TRACE_1("Assigning Slides to controllers",_x);
} forEach _controllers;


// Exit if automatic transitions are not allowed
if (_duration == 0) exitWith {};


// Number of slideshows and formatted global variable (multiple modules support)
private ["_varString"];
GVAR(slideshows) = GVAR(slideshows) + 1;
_varString = str format [QGVAR(currentSlide%1), GVAR(slideshows)];
missionNamespace setVariable [_varString, 0]; // First slide

// Automatic transitions PFH
[{
    EXPLODE_3_PVT(_this select 0,_objects,_images,_varString);

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

    TRACE_3("Auto-transition",_images select _currentSlide,_currentSlide,count _images);
}, _duration, [_objects, _images, _varString]] call cba_fnc_addPerFrameHandler;
