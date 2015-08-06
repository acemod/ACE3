/*
 * Author: commy2
 *
 * Returns the current radio / chat / marker channel.
 *
 * Argument:
 * NONE.
 *
 * Return value:
 * The current channel. Can be "group", "side", "global", "command", "vehicle", "direct" or "custom_X" (String)
 *
 * Public: No
 */
#include "script_component.hpp"

#define CHANNELS ["global", "side", "command", "group", "vehicle", "direct"]
#define CHANNELS_LOCALIZED [localize "str_channel_global", localize "str_channel_side", localize "str_channel_command", localize "str_channel_group", localize "str_channel_vehicle", localize "str_channel_direct"]

private "_currentChannel";
_currentChannel = currentChannel;

if (_currentChannel < count CHANNELS) then {
    _currentChannel = CHANNELS select _currentChannel;
} else {
    _currentChannel = format ["custom_%1", _currentChannel - count CHANNELS - 1];
};

_currentChannel
