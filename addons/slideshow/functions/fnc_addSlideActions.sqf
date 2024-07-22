#include "..\script_component.hpp"
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
 * 5: Texture Selection <NUMBER> (default: 0)
 *
 * Return Value:
 * List of actions <ARRAY>
 *
 * Example:
 * [[object], ["image"], ["name"], controller, 1] call ace_slideshow_fnc_addSlideActions
 *
 * Public: No
 */

params ["_objects", "_images", "_names", "_controller", "_currentSlideshow", ["_selection", 0]];

private _actions = [];
{
    _actions pushBack
    [
        [
            format [QGVAR(slideshow%1_slide%2), _currentSlideshow, _forEachIndex + 1],
            _names select _forEachIndex,
            "",
            {
                (_this select 2) params ["_objects", "_image", "_currentSlideshow", "_selection"];
                {
                    _x setObjectTextureGlobal [_selection, _image]
                } forEach _objects;
                [QGVAR(slideChanged), [_image, _currentSlideshow]] call CBA_fnc_localEvent;
            },
            {true},
            {},
            [_objects, _x, _currentSlideshow, _selection]
        ] call EFUNC(interact_menu,createAction),
        [],
        _controller
    ];
} forEach _images;

TRACE_1("Children actions",_actions);

_actions
