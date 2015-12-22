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
#include "script_component.hpp"

private ["_ownerID", "_unitUID", "_drawPosVariableName", "_playerOwnerID"];

params ["", "_pfhId"];

if (!visibleMap) then {
    call FUNC(endTransmit);
};

if (!GVAR(EnableTransmit) || !visibleMap) exitWith {
    [_pfhId] call CBA_fnc_removePerFrameHandler;
};

_unitUID = getPlayerUID ACE_Player;
_playerOwnerID = ACE_player getVariable QGVAR(owner_id);
if (!isNil "_unitUID" && _unitUID != "" && !isNil "_playerOwnerID") then {
    _drawPosVariableName = format [QGVAR(%1_DrawPos), _unitUID];
    {
        _ownerID = _x getVariable QGVAR(owner_id);
        if (isNil "_ownerID") then {
            [EVENT_PLAYER_HAS_NO_OWNER_ID, [name _x]] call EFUNC(common,serverEvent);
        } else {
            if (_ownerID != _playerOwnerID) then {
                _ownerID publicVariableClient _drawPosVariableName;
            };
        };
    } count ([ACE_player, GVAR(maxRange)] call FUNC(getProximityPlayers));
};
