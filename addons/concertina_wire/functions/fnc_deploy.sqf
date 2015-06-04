#include "script_component.hpp"

PARAMS_2(_wirecoil,_unit);

private ["_wireNoGeo", "_dir", "_pos", "_wireNoGeoPos"];

_wireNoGeo = "ACE_ConcertinaWireNoGeo" createVehicle [0,0,0];
{
    _wireNoGeo animate [_x, 1];
} foreach WIRE_FAST;

GVAR(placer) = _unit;
_dir = getDir _unit;
_pos = getPosASL _unit;
_wireNoGeoPos = _pos vectorAdd [1.1 * sin(_dir), 1.1 * cos(_dir), 0];

_wireNoGeo setDir _dir;
_wireNoGeo setPosASL _wireNoGeoPos;

deleteVehicle _wirecoil;

_unit setVariable [QGVAR(wireDeployed), false];

GVAR(deployPFH) = [{
    EXPLODE_4_PVT(_this select 0,_wireNoGeo,_wireNoGeoPos,_unit,_action);
    
    private ["_range", "_posStart", "_posEnd", "_dirVect", "_dir", "_anim", "_wire"];
    _posStart = (_wireNoGeo modelToWorldVisual (_wireNoGeo selectionPosition "start")) call EFUNC(common,positionToASL);
    _posEnd = (getPosASL _unit) vectorAdd (vectorDir _unit);
    _dirVect = _posStart vectorDiff _posEnd;
    _dir = _dirVect call CBA_fnc_vectDir;
    _range = vectorMagnitude _dirVect;
    _anim = 0 max (1 - (_range / 12));
    
    if (!(alive _unit) || _range >= 12 || (_unit getVariable [QGVAR(wireDeployed), false])) exitWith {
        _wire = "ACE_ConcertinaWire" createvehicle [0, 0, 0];
        {
            _wire animate [_x, _anim];
        } foreach WIRE_FAST;        
        
        [{
            EXPLODE_5_PVT(_this select 0,_wireNoGeo,_wire,_anim,_dir,_wireNoGeoPos);
            if (_wire animationPhase "wire_2" == _anim) then {
                deleteVehicle _wireNoGeo;
                _wire setDir _dir;
                _wire setPosASL _wireNoGeoPos;
                [_this select 1] call CBA_fnc_removePerFrameHandler;
            };
        }, 0, [_wireNoGeo, _wire, _anim, _dir, _wireNoGeoPos]] call CBA_fnc_addPerFrameHandler;
        
        [_unit, "DefaultAction", _unit getVariable [QGVAR(Deploy), -1]] call EFUNC(Common,removeActionEventHandler);
        call EFUNC(interaction,hideMouseHint);
        
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };
    
    _wireNoGeo setDir _dir;
    {
        _wireNoGeo animate [_x, _anim];
    } foreach WIRE_FAST;
}, 0, [_wireNoGeo, _wireNoGeoPos, _unit, _action]] call CBA_fnc_addPerFrameHandler;

[localize "STR_ACE_ROLLWIRE", "", ""] call EFUNC(interaction,showMouseHint);
    
GVAR(placer) setVariable [QGVAR(Deploy),
    [GVAR(placer), "DefaultAction",
    {GVAR(deployPFH) != -1},
    {GVAR(placer) setVariable [QGVAR(wireDeployed), true]}
] call EFUNC(common,AddActionEventHandler)];
