/*
 * Author: commy2
 *
 * Returns the current radio / chat / marker channel.
 * 
 * Argument:
 * NONE.
 * 
 * Return value:
 * The current channel. Can be "group", "side", "global", "command", "vehicle" or "direct" (String)
 */

#define CHANNELS ["group", "side", "global", "command", "vehicle", "direct"]
#define CHANNELS_LOCALIZED [localize "str_channel_group", localize "str_channel_side", localize "str_channel_global", localize "str_channel_command", localize "str_channel_vehicle", localize "str_channel_direct"]

CHANNELS select (CHANNELS_LOCALIZED find (uiNamespace getVariable ["AGM_currentChannel", ""])) max 0
