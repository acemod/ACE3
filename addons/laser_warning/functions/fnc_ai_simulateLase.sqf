#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Simulates vehicle lasing target with range finder
 * Runs on each vehicle, checking if it is gunned by AI and has laser range finder. If so,
 * every so often we will ping a laser in the cannon direction.
 *
 * Arguments:
 * Vehicle to watch <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * myTank call ace_laser_warning_fnc_ai_simulateLase;
 *
 * Public: No
 */
params ["_vehicle"];

private _hasFcs = _vehicle call FUNC(initialiseVehicle);

TRACE_2("vehicle fcs loop",_vehicle,_hasFcs);
if !(_hasFcs) exitWith {};

[{
    params ["_args", "_pfhId"];
    _args params ["_vehicle", "_lastPing"];
    if !(alive _vehicle) exitWith {
        [_pfhId] call CBA_fnc_removePerFrameHandler;
    };
    if !(alive gunner _vehicle) exitWith {};
    if !(local gunner _vehicle) exitWith {};
    if (isPlayer gunner _vehicle) exitWith {};
    private _target = getAttackTarget _vehicle;
    if !(isNull _target) then {
        private _aimed = _vehicle aimedAtTarget [_target];
        if (_aimed > 0.5 && { CBA_missionTime - _lastPing >= AI_PING_INTERVAL }) then {
            _args set [1, CBA_missionTime];
            private _vPos = eyePos _vehicle;
            private _tPos = AGLToASL unitAimPositionVisual _target;
            [QGVAR(ping), [_vPos, _vPos vectorFromTo _tPos]] call CBA_fnc_globalEvent;
        };
    };
}, 0, [_vehicle, 0]] call CBA_fnc_addPerFrameHandler;