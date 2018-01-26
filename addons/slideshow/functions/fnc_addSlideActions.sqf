/*
 * Author: Jonpas
 * Adds controller slide actions.
 *
 * Arguments:
 * 0: Objects <ARRAY>
 * 1: Images <ARRAY>
 * 2: Names <ARRAY>
 * 3: Controller <OBJECT>
 * 4: Current Slideshow <NUMBER>
 *
 * Return Value:
 * List of actions <ARRAY>
 *
 * Example:
 * [[object], ["image"], ["name"], controller, 1] call ace_slideshow_fnc_addSlideActions
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_objects", "_images", "_names", "_controller", "_currentSlideshow"];

private _actions = [];
{
    _actions pushBack
    [
        [
            format [QGVAR(slideshow%1_slide%2), _currentSlideshow, _forEachIndex + 1],
            _names select _forEachIndex,
            "",
            {
                (_this select 2) params ["_objects", "_image"];
                {
                    _x setObjectTextureGlobal [0, _image]
                } count _objects;
            },
            {true},
            {},
            [_objects, _x]
        ] call EFUNC(interact_menu,createAction),
        [],
        _controller
    ];
} forEach _images;

TRACE_1("Children actions",_actions);

_actions
