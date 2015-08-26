/*
 * Author: Jonpas, DaC
 * Prepares necessary variables and default image.
 *
 * Arguments:
 * 0: Objects <ARRAY>
 * 1: Controller Objects <ARRAY>
 * 2: Image Paths <ARRAY>
 * 3: Action Names <ARRAY>
 * 4: Slide Duration <NUMBER> (0 disables automatic transitions)
 *
 * Return Value:
 * Parsed List <ARRAY>
 *
 * Example:
 * [[object1, object2, object3], [controller1], ["images\image1.paa", "images\image2.paa"], ["Action1", "Action2"], 5] call ace_slideshow_fnc_createSlideshow
 *
 * Public: Yes
 */
#include "script_component.hpp"

private ["_currentSlideshow", "_actionsObject", "_actionsClass", "_mainAction", "_slidesAction", "_varString"];

params ["_objects", "_controllers", "_images", "_names", "_duration"];

// Verify data
if (count _images != count _names || {count _images == 0} || {count _names == 0}) exitWith {
    ACE_LOGERROR("Slideshow Images or Names fields can NOT be empty and must have equal number of items!");
};

// Objects synced to the module
{
    _objects pushBack _x;
    nil
} count (synchronizedObjects _logic);

// If no controllers use objects as controllers
if (count _controllers == 0) then {
    _controllers = _objects;
};

TRACE_4("Information",_objects,_controllers,_images,_names);

if (isServer) then {
    // Default images on whiteboards (first image)
    {
        _x setObjectTextureGlobal [0, _images select 0];
    } count _objects;

    // Number of slideshows (multiple modules support)
    GVAR(slideshows) = GVAR(slideshows) + 1;
};

_currentSlideshow = GVAR(slideshows); // Local variable in case GVAR gets changed during execution of below code

// If interaction menu module is not present, set default duration value
if !(["ace_interact_menu"] call EFUNC(common,isModLoaded)) then {
    _duration = 5;
    ACE_LOGINFO(format [ARR_2("Interaction Menu module not present, defaulting duration value to %1", _duration)]);
};

// Add interactions if automatic transitions are disabled, else setup automatic transitions
if (_duration == 0) then {
    {
        // Add Slides sub-action and populate with images
        _slidesAction = [QGVAR(Slides), localize LSTRING(Interaction), "", {}, {true}, {(_this select 2) call FUNC(addSlideActions)}, [_objects,_images,_names,_x,_currentSlideshow], [0,0,0], 2] call EFUNC(interact_menu,createAction);
        [_x, 0, ["ACE_MainActions"], _slidesAction] call EFUNC(interact_menu,addActionToObject);
        nil
    } count _controllers;
} else {
    if !(isServer) exitWith {};

    // Formatted GVAR string (multiple modules support)
    _varString = format [QGVAR(slideshow%1), _currentSlideshow];
    TRACE_1("Current Slide",_varString);

    // Set formatted GVAR to first slide
    missionNamespace setVariable [_varString, 0];

    // Automatic transitions handler
    [FUNC(autoTransition), [_objects, _images, _varString, _duration], _duration] call EFUNC(common,waitAndExecute);
};
