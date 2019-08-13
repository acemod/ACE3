#include "script_component.hpp"
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
 * 5: Set Name <STRING> (default: localized "Slides")
 *
 * Return Value:
 * None
 *
 * Example:
 * [[object1, object2, object3], [controller1], ["images\image1.paa", "images\image2.paa"], ["Action1", "Action2"], 5, "My Slides"] call ace_slideshow_fnc_createSlideshow
 *
 * Public: Yes
 */

params [
    ["_objects", [], [[]] ],
    ["_controllers", [], [[]] ],
    ["_images", [], [[]] ],
    ["_names", [], [[]] ],
    ["_duration", 0, [0]],
    ["_setName", localize LSTRING(Interaction), [""]]
];

// Verify data
if (_objects isEqualTo []) exitWith {
    ERROR("Slideshow Objects field must NOT be empty!");
};
if (count _images != count _names || {_images isEqualTo []} || {_names isEqualTo []}) exitWith {
    ERROR("Slideshow Images or Names fields must NOT be empty and must have equal number of items!");
};

// If no controllers use objects as controllers
if (_controllers isEqualTo []) then {
    _controllers = _objects;
};

TRACE_5("Information",_objects,_controllers,_images,_names,_setName);

if (isServer) then {
    // Default images on whiteboards (first image)
    {
        _x setObjectTextureGlobal [0, _images select 0];
    } count _objects;
};

// Number of slideshows (multiple modules support)
GVAR(slideshows) = GVAR(slideshows) + 1;

private _currentSlideshow = GVAR(slideshows); // Local variable in case GVAR gets changed during execution of below code

// If interaction menu module is not present, set default duration value
if !(["ace_interact_menu"] call EFUNC(common,isModLoaded)) then {
    _duration = NOINTERACTMENU_DURATION;
    INFO_1("Interaction Menu module not present, defaulting duration value to %1",_duration);
};

// Add interactions if automatic transitions are disabled, else setup automatic transitions
if (_duration == 0) then {

    // Reverse the arrays so that the interactions will be added in the right order
    reverse _images;
    reverse _names;

    {
        if (_setName == "") then {
            _setName = localize LSTRING(Interaction);
        };

        // Add Slides sub-action and populate with images
        private _slidesAction = [
            format [QGVAR(slideshow%1), _currentSlideshow],
            _setName,
            "",
            {},
            {true},
            {(_this select 2) call FUNC(addSlideActions)},
            [_objects, _images, _names, _x, _currentSlideshow],
            [0, 0, 0],
            2
        ] call EFUNC(interact_menu,createAction);
        [_x, 0, ["ACE_MainActions"], _slidesAction] call EFUNC(interact_menu,addActionToObject);
        nil
    } count _controllers;
} else {
    if !(isServer) exitWith {};

    // Formatted GVAR string (multiple modules support)
    private _varString = format [QGVAR(slideshow%1), _currentSlideshow];
    TRACE_1("Current Slide",_varString);

    // Set formatted GVAR to first slide
    missionNamespace setVariable [_varString, 0];

    // Automatic transitions handler
    [FUNC(autoTransition), [_objects, _images, _varString, _duration], _duration] call CBA_fnc_waitAndExecute;
};
