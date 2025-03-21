#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Returns default values for the sound state
 *
 * Arguments:
 * 0: Default Enabled <BOOL>
 *
 * Return Value:
 * Sound State Array <ARRAY>
 *
 * Example:
 * call ace_laser_warning_fnc_default_soundState;
 *
 * Public: No
 */
params ["_defaultEnabled"];
[
    _defaultEnabled,
    [0, 0, 0],
    false,
    createHashMapFromArray [
        ["laser", QGVAR(laser)],
        ["absolute", SOUND_BEARINGS_0],
        ["clock", SOUND_OCLOCK_0],
        ["heading", SOUND_HEADINGS_0],
        ["relative", SOUND_RELATIVE_0]
    ],
    -1,     // audio loop PFH id
    [0, 0], // Currently playing
    [[], 0, 0] // Circular Queue for to-play warnings
]
