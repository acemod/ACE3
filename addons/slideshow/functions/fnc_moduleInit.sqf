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
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

if !(isServer) exitWith {};

PARAMS_3(_logic,_units,_activated);

if !(_activated) exitWith {};

private ["_objects", "_controllers", "_images", "_names", "_duration"];

_logic = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
if (isNull _logic) exitWith {};

// Extract variables from logic
_objects = [_logic getVariable ["Objects", ""], true, true] call FUNC(makeList);
_controllers = [_logic getVariable ["Controllers", ""], true, true] call FUNC(makeList);
_images = [_logic getVariable ["Images", ""], true, false] call FUNC(makeList);
_names = [_logic getVariable ["Names", ""], true, false] call FUNC(makeList);
_duration = _logic getVariable ["Duration", 0];

// Exit if Images or Names fields are empty
if (_images == [] || {_names == []} || {count _images != count _names}) exitWith {diag_log "[ACE] ERROR: Slideshow Module NOT Initialized: Images or Names fields can NOT be empty and must have equal number of items!"};

// Prepare with actions
[_objects, _controllers, _images, _names, _duration] call FUNC(createSlideshow);

diag_log text format ["[ACE]: Slideshow Module Initialized for: %1 with Duration: %2", _objects, _duration];
