#include "script_component.hpp"

PARAMS_1(_wire);

{
    _wire animate [_x, 1];
} foreach WIRE_FAST;

[{
    EXPLODE_1_PVT(_this select 0,_wire);
    
    if (_wire animationPhase "wire_2" == 1) then {
         private ["_dir", "_pos", "_wirecoil"];
         
        _dir = getDir _wire;
        _pos = getPosASL _wire;
        
        _wirecoil = "ACE_ConcertinaWireCoil" createvehicle [0, 0, 0];

        deleteVehicle _wire;
        
        _wirecoil setDir _dir;
        _wirecoil setPosASL _pos;
        _wirecoil setVelocity [0, 0, 0];
        
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };
}, 0, [_wire]] call CBA_fnc_addPerFrameHandler;
