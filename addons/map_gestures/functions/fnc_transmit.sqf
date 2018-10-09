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

{
    private _owner = _x getVariable [QEGVAR(common,playerOwner), -1];
    if (_owner > -1) then {
        private _remotePos = _x getVariable [QGVAR(remotePos), [0,0,0]];
        if ((_remotePos distance2d GVAR(pointPosition)) > 1) then { // Only transmit when actually moving
            [QGVAR(syncPos), [ACE_Player, GVAR(pointPosition)], _owner] call CBA_fnc_ownerEvent;
            _x setVariable [QGVAR(remotePos), GVAR(pointPosition)];
        };
    };
} count ([ACE_player, GVAR(maxRange)] call FUNC(getProximityPlayers));

END_COUNTER(transmit);
