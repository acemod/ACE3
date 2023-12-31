#include "..\script_component.hpp"
/*
 * Author: commy2, LinkIsGrim, Avokadomos
 * When the channel list box is changed.
 *
 * Arguments:
 * 0: Channel ListBox (idc 103) <CONTROL>
 * 1: Selected Index <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL, 5] call ACE_markers_fnc_onLBSelChangedChannel
 *
 * Public: No
 */

params ["_ctrl", "_index"];
TRACE_2("params",_ctrl,_index);

setCurrentChannel (parseNumber (_ctrl lbData _index));
