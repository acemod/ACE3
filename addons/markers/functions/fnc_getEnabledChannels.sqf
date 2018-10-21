#include "script_component.hpp"
/*
 * Author: commy2, Timi007
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

private _currentChannel = currentChannel;
private _enabledChannels = [];

if (_localize) then {
    if (setCurrentChannel 0) then {
        _enabledChannels pushBack localize "str_channel_global";
    };

    if (setCurrentChannel 1) then {
        _enabledChannels pushBack localize "str_channel_side";
    };

    if (setCurrentChannel 2) then {
        _enabledChannels pushBack localize "str_channel_command";
    };

    if (setCurrentChannel 3) then {
        _enabledChannels pushBack localize "str_channel_group";
    };

    if (setCurrentChannel 4) then {
        _enabledChannels pushBack localize "str_channel_vehicle";
    };
} else {
    for "_i" from 0 to 4 do {
        if (setCurrentChannel _i) then {
            _enabledChannels pushBack _i;
        };
    };
};

setCurrentChannel _currentChannel;

_enabledChannels
