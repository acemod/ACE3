/*
 * Author: Jonpas, DaC
 * Prepares necessary variables and default image.
 *
 * Arguments:
 * 0: Objects <ARRAY>
 * 1: Controller Objects <ARRAY>
 * 2: Image Paths <ARRAY>
 * 3: Names <ARRAY>
 *
 * Return Value:
 * Parsed List <ARRAY>
 *
 * Example:
 * [[object1, object2, object3], [controller1], ["images\image1.paa", "images\image2.paa"], ["Action1", "Action2"]] call ace_slideshow_fnc_createSlideshow;
 *
 * Public: Yes
 */
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

PARAMS_4(_objects,_controllers,_images,_names);

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
    _x setVariable [QGVAR(Slides), [_objects, _images, _names], true];
    TRACE_1("Assigning Slides to",_x);
} forEach _controllers;
