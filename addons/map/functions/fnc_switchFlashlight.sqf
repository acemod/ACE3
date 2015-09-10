/*
 * Author: voioper
 * Switch flashlight.
 *
 * Arguments:
 * 0: Flashlight classname ("" for off) <STRING>
 *
 * Return value:
 * None
 *
 * Example:
 * ["ACE_Flashlight_MX991"] call ace_map_fnc_switchFlashlight;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_flashlight"];

GVAR(flashlightInUse) = _flashlight;
if (GVAR(mapGlow)) then {
    [GVAR(flashlightInUse)] call FUNC(flashlightGlow);
};
playSound "ACE_map_flashlightClick";