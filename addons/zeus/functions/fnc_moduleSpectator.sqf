#include "..\script_component.hpp"
/*
 * Author: mharis001
 * Zeus module function to make the local player an ACE Spectator.
 *
 * Arguments:
 * 0: Force interface <BOOL>
 * 1: Hide player <BOOL>
 * 2: Sides available to spectate <ARRAY>
 * 3: Camera modes available <ARRAY>
 * 4: Vision modes available <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [true, true, [west], [0, 1, 2], [-2, -1, 0, 1]] call ace_zeus_fnc_moduleSpectator
 *
 * Public: No
 */

params ["_force", "_hide", "_sides", "_modes", "_visions"];
TRACE_1("params",_this);

// Update sides available to spectate
[_sides, [west, east, independent, civilian] - _sides] call EFUNC(spectator,updateSides);

// Update available camera modes
[_modes, [0, 1, 2] - _modes] call EFUNC(spectator,updateCameraModes);

// Update available vision modes
[_visions, [-2, -1, 0, 1, 2, 3, 4, 5, 6, 7] - _visions] call EFUNC(spectator,updateVisionModes);

// Make unit spectator (close Zeus camera if open)
if (!isNull curatorCamera) then {
    (findDisplay 312) closeDisplay 2;
};

[true, _force, _hide] call EFUNC(spectator,setSpectator);
