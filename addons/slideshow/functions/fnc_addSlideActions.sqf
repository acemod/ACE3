#include "script_component.hpp"
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

params ["_objects", "_images", "_names", "_controller", "_currentSlideshow"];

private _actions = [];

// fix action order by going through the array backwards
for "_i" from (count _images - 1) to 0 step -1 do
{
    _actions pushBack
    [
        [
            format [QGVAR(slideshow%1_slide%2), _currentSlideshow, _i + 1],
            _names select _i,
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
};

TRACE_1("Children actions",_actions);

_actions
