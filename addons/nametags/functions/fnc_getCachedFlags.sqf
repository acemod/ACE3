#include "script_component.hpp"
/*
 * Author: <N/A>
 * Get's flags used for onDraw3D that can be cached
 *
 * Arguments:
 * None
 *
 * Return Value:
 * [_drawName,_drawRank,_enabledTagsNearby,_enabledTagsCursor,_maxDistance] <ARRAY>
 *
 * Example:
 * call ace_nametags_fnc_getCachedFlags
 *
 * Public: No
 */

// Determine flags from current settings
private _drawName = true;
private _enabledTagsNearby = false;
private _enabledTagsCursor = false;

switch (GVAR(showPlayerNames)) do {
    case 0: {
        // Player names Disabled [Note: this should be unreachable as the drawEH will be removed]
        _drawName = false;
        _enabledTagsNearby = (GVAR(showSoundWaves) == 2);
    };
    case 1: {
        // Player names Enabled
        _enabledTagsNearby = true;
    };
    case 2: {
        // Player names Only cursor
        _enabledTagsNearby = (GVAR(showSoundWaves) == 2);
        _enabledTagsCursor = true;
    };
    case 3: {
        // Player names Only Keypress
        _enabledTagsNearby = GVAR(showSoundWaves) == 2; // non-cached: || _onKeyPressAlphaMax) > 0
    };
    case 4: {
        // Player names Only Cursor and Keypress
        _enabledTagsNearby = (GVAR(showSoundWaves) == 2);
        // non-cached: _enabledTagsCursor = _onKeyPressAlphaMax > 0;
    };
    case 5: {
        // Fade on border
        _enabledTagsNearby = true;
    };
};

private _ambientBrightness = ((([] call EFUNC(common,ambientBrightness)) + ([0, 0.4] select ((currentVisionMode ace_player) != 0))) min 1) max 0;
private _maxDistance = _ambientBrightness * GVAR(PlayerNamesViewDistance);

[_drawName, GVAR(showPlayerRanks),_enabledTagsNearby,_enabledTagsCursor,_maxDistance]
