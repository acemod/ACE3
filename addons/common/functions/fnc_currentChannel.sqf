#include "script_component.hpp"
/*
 * Author: commy2
 * Returns the current radio / chat / marker channel.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * The current channel ("group", "side", "global", "command", "vehicle", "direct", "custom_X") <STRING>
 *
 * Example:
 * [] call ace_common_fnc_currentChannel
 *
 * Public: Yes
 */

#define CHANNELS ["global", "side", "command", "group", "vehicle", "direct"]
#define CHANNELS_LOCALIZED [localize "str_channel_global", localize "str_channel_side", localize "str_channel_command", localize "str_channel_group", localize "str_channel_vehicle", localize "str_channel_direct"]

private _currentChannel = currentChannel;

if (_currentChannel < count CHANNELS) then {
    _currentChannel = CHANNELS select _currentChannel;
} else {
    _currentChannel = format ["custom_%1", _currentChannel - count CHANNELS - 1];
};

_currentChannel
