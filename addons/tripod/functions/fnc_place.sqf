/*
 * Author: Rocko, Ruthberg
 *
 * Place down tripod
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: tripod class <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

PARAMS_2(_unit,_tripodClass);

_unit removeItem _tripodClass;

if ((_unit call CBA_fnc_getUnitAnim) select 0 == "stand") then {
    _unit playMove "AmovPercMstpSrasWrflDnon_diary";
};

[{
    PARAMS_1(_unit);
    
    private ["_direction", "_position", "_tripod"];
    _direction = getDir _unit;
    _position = (getPosASL _unit) vectorAdd [0.8 * sin(_direction), 0.8 * cos(_direction), 0.02];
    
    _tripod = "ACE_TripodObject" createVehicle [0, 0, 0];
    {
        _tripod animate [_x, 1];
    } foreach ["slide_down_tripod", "retract_leg_1", "retract_leg_2", "retract_leg_3"];
    
    [{
        EXPLODE_3_PVT(_this select 0,_tripod,_direction,_position);
        if (_tripod animationPhase "slide_down_tripod" == 1) then {
            _tripod setDir _direction;
            _tripod setPosASL _position;
            if ((getPosATL _tripod select 2) - (getPos _tripod select 2) < 1E-5) then {
                _tripod setVectorUp (surfaceNormal (position _tripod)); 
            };
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
    }, 0, [_tripod, _direction, _position]] call CBA_fnc_addPerFrameHandler;
    
}, [_unit], 1, 0] call EFUNC(common,waitAndExecute);
