#include "script_component.hpp"
/*
 * Author: commy2, Timi007, LinkIsGrim
 * Return enabled channels.
 *
 * Arguments:
 * 0: false - use channel id, true - use localized channel names <BOOl> (default: false)
 *
 * Return Value:
 * Enabled Channels <ARRAY>
 *
 * Example:
 * [false] call ACE_markers_fnc_getEnabledChannels
 *
 * Public: No
 */

params [["_localize", false, [false]]];

private _enabledChannels = [];

// Channel IDs go from 0 to 15
for "_i" from 0 to 15 do {
    // Only text channels
    if ((channelEnabled _i) select 0) then {
        if (_localize) then {
            _enabledChannels pushBack ((radioChannelInfo _i) select 1);
        } else {
            _enabledChannels pushBack _i;
        };
    }
};

_enabledChannels
