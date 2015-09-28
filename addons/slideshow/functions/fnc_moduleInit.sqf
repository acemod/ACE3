/*
 * Author: Jonpas
 * Initializes the module.
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: Units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

// Exit on Headless Client
if (!hasInterface && !isDedicated) exitWith {};

private ["_objects", "_controllers", "_images", "_names", "_duration"];
params [["_logic", objNull, [objNull]], "_units", "_activated"];

if !(_activated) exitWith {};
if (isNull _logic) exitWith {};

// Extract variables from logic
_objects = [_logic getVariable ["Objects", ""], true, true] call FUNC(makeList);
_controllers = [_logic getVariable ["Controllers", ""], true, true] call FUNC(makeList);
_images = [_logic getVariable ["Images", ""], true, false] call FUNC(makeList);
_names = [_logic getVariable ["Names", ""], true, false] call FUNC(makeList);
_duration = _logic getVariable ["Duration", 0];

// Objects synced to the module
{
    _objects pushBack _x;
    nil
} count (synchronizedObjects _logic);

// Prepare with actions
[_objects, _controllers, _images, _names, _duration] call FUNC(createSlideshow);

ACE_LOGINFO_1("Slideshow Module Initialized on %1 Objects", count _objects);
