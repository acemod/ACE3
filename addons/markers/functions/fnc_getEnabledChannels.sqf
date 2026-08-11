#include "..\script_component.hpp"
/*
 * Author: commy2, Timi007, LinkIsGrim
 * Return enabled channels.
 *
 * Arguments:
 * 0: false - use channel id, true - use localized channel names <BOOL> (default: false)
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
private _currentChannel = currentChannel;

// Micro-optimization so we don't rebuild the array and localize in each iteration
private _engineChannels = CHANNEL_NAMES;

for "_channelId" from 0 to 15 do {
    if (_channelId == 5) then {continue}; // Direct channel, ignore
    if (setCurrentChannel _channelId) then {
        if (_localize) then {
            _enabledChannels pushBack (_engineChannels param [_channelId, (radioChannelInfo (_channelId - 5)) param [1, "#Unknown"]]); // radioChannelInfo works off custom IDs only, offset engine channels
        } else {
            _enabledChannels pushBack _channelId;
        };
    };
};

setCurrentChannel _currentChannel;

_enabledChannels
