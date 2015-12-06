/*
 * Author: commy2
 * Return enabled channels.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Enabled Channels <ARRAY>
 *
 * Public: No
 */
#include "script_component.hpp"

private _currentChannel = currentChannel;

private _enabledChannels = [];

for "_i" from 0 to 5 do {
    if (setCurrentChannel _i) then {
        _enabledChannels pushBack _i;
    };
};

setCurrentChannel _currentChannel;

_enabledChannels
