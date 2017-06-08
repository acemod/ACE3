/*
 * Author: Rocko, Ruthberg
 *
 * Deploys the concertina wire
 *
 * Arguments:
 * 0: wire coil <OBJECT>
 * 1: unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_wirecoil", "_unit"];

private _wireNoGeo = "ACE_ConcertinaWireNoGeo" createVehicle [0,0,0];
{
    _wireNoGeo animate [_x, 1];
} count WIRE_FAST;

GVAR(placer) = _unit;
private _dir = getDir _unit;
private _pos = getPosASL _unit;
private _wireNoGeoPos = _pos vectorAdd [1.1 * sin(_dir), 1.1 * cos(_dir), 0];

_wireNoGeo setDir _dir;
_wireNoGeo setPosASL _wireNoGeoPos;

deleteVehicle _wirecoil;

_unit setVariable [QGVAR(wireDeployed), false];

GVAR(deployPFH) = [{
    params ["_args", "_idPFH"];
    _args params ["_wireNoGeo", "_wireNoGeoPos", "_unit"];

    private _posStart = (_wireNoGeo modelToWorldVisual (_wireNoGeo selectionPosition "start")) call EFUNC(common,positionToASL);
    private _posEnd = (getPosASL _unit) vectorAdd (vectorDir _unit);
    private _dirVect = _posStart vectorDiff _posEnd;
    private _dir = _dirVect call CBA_fnc_vectDir;
    private _range = vectorMagnitude _dirVect;
    private _anim = 0 max (1 - (_range / 12));

    if (!(alive _unit) || _range >= 12 || (_unit getVariable [QGVAR(wireDeployed), false])) exitWith {
        private _wire = "ACE_ConcertinaWire" createvehicle [0, 0, 0];
        {
            _wire animate [_x, _anim];
        } count WIRE_FAST;

        [{
            params ["_args", "_idPFH"];
            _args params ["_wireNoGeo", "_wire", "_anim", "_dir", "_wireNoGeoPos"];
            if (_wire animationPhase "wire_2" == _anim) then {
                deleteVehicle _wireNoGeo;
                _wire setDir _dir;
                _wire setPosASL _wireNoGeoPos;
                [_idPFH] call CBA_fnc_removePerFrameHandler;
            };
        }, 0, [_wireNoGeo, _wire, _anim, _dir, _wireNoGeoPos]] call CBA_fnc_addPerFrameHandler;

        [_unit, "DefaultAction", _unit getVariable [QGVAR(Deploy), -1]] call EFUNC(Common,removeActionEventHandler);
        call EFUNC(interaction,hideMouseHint);

        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };

    _wireNoGeo setDir _dir;
    {
        _wireNoGeo animate [_x, _anim];
    } count WIRE_FAST;
}, 0, [_wireNoGeo, _wireNoGeoPos, _unit]] call CBA_fnc_addPerFrameHandler;

[localize "STR_ACE_ROLLWIRE", "", ""] call EFUNC(interaction,showMouseHint);

GVAR(placer) setVariable [QGVAR(Deploy),
    [GVAR(placer), "DefaultAction",
    {GVAR(deployPFH) != -1},
    {GVAR(placer) setVariable [QGVAR(wireDeployed), true]}
] call EFUNC(common,AddActionEventHandler)];
