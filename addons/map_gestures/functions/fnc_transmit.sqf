#include "script_component.hpp"
/*
 * Author: Dslyecxi, MikeMatrix
 * Transmit PFH
 *
 * Arguments:
 * 0: Arguments <ARRAY>
 * 1: PFH ID <NUMBER>
 *
 * Return Value:
 * Return description <TYPE>
 *
 * Example:
 * [[], 2] call ace_map_gestures_fnc_transmit
 *
 * Public: No
 */

BEGIN_COUNTER(transmit);

params ["", "_pfhId"];

if (!visibleMap) then {
    call FUNC(endTransmit);
};

if (!GVAR(EnableTransmit) || !visibleMap) exitWith {
    [_pfhId] call CBA_fnc_removePerFrameHandler;
};

private _remotePos = ACE_player getVariable [QGVAR(pointPosition), [0, 0, 0]];
if (_remotePos distance2D GVAR(pointPosition) > 1) then { // Only transmit when actually moving
    ACE_player setVariable [QGVAR(pointPosition), GVAR(pointPosition), true];
};

END_COUNTER(transmit);
