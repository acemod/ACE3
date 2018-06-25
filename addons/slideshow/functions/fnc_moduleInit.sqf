#include "script_component.hpp"
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
 * Example:
 * [LOGIC, [bob, kevin], true] call ace_slideshow_fnc_moduleInit
 *
 * Public: No
 */

// Exit on Headless Client
if (!hasInterface && !isDedicated) exitWith {};

params [["_logic", objNull, [objNull]], "_units", "_activated"];

if !(_activated) exitWith {};
if (isNull _logic) exitWith {};

// Extract variables from logic
private _objects = [_logic getVariable ["Objects", ""], true, true] call EFUNC(common,parseList);
private _controllers = [_logic getVariable ["Controllers", ""], true, true] call EFUNC(common,parseList);
private _images = [_logic getVariable ["Images", ""], false, false] call EFUNC(common,parseList);
private _names = [_logic getVariable ["Names", ""], false, false] call EFUNC(common,parseList);
private _setName = _logic getVariable ["SetName", ""];
private _duration = _logic getVariable ["Duration", 0];

// Objects synced to the module
{
    _objects pushBack _x;
    nil
} count (synchronizedObjects _logic);

// Prepare with actions
[_objects, _controllers, _images, _names, _duration, _setName] call FUNC(createSlideshow);

INFO_1("Slideshow Module Initialized on %1 Objects", count _objects);
