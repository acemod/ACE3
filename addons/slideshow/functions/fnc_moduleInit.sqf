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
_objects = [_logic getVariable ["Objects", ""], true, true] call EFUNC(common,parseList);
_controllers = [_logic getVariable ["Controllers", ""], true, true] call EFUNC(common,parseList);
_images = [_logic getVariable ["Images", ""], false, false] call EFUNC(common,parseList);
_names = [_logic getVariable ["Names", ""], false, false] call EFUNC(common,parseList);
_duration = _logic getVariable ["Duration", 0];

// Prepare with actions
[_objects, _controllers, _images, _names, _duration] call FUNC(createSlideshow);

ACE_LOGINFO_2("Slideshow Module Initialized for: %1 with Duration: %2", _objects, _duration);
