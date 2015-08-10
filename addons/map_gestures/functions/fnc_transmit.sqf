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

private ["_nearDudes", "_ownerID", "_nameSane"];

params ["", "_pfhId"];

if (!GVAR(EnableTransmit) || !visibleMap) exitWith {
    call FUNC(endTransmit);
    [_pfhId] call CBA_fnc_removePerFrameHandler;
};

_nearDudes = [ACE_player, GVAR(maxRange)] call FUNC(getProximityPlayers);
TRACE_1("Near",_nearDudes)

{
    _ownerID = _x getVariable QGVAR(owner_id);
    if (isNil "_ownerID") exitWith {
        [0, {[_this] call FUNC(assignClientIDOnServer)}, name _x] call cba_fnc_GlobalExecute;
    };
    _ownerID = _x getVariable QGVAR(owner_id);

    if (_ownerID != ACE_player getVariable QGVAR(owner_id)) then {
        _nameSane = [name ACE_player] call FUNC(sanitizeName);
        _ownerID publicVariableClient format [QGVAR(%1_DrawPos), _nameSane];
    };
} count _nearDudes;
