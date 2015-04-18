//#define DEBUG_MODE_FULL
#include "script_component.hpp"

if(!hasInterface) exitWith { false };

PARAMS_3(_litterClass,_position,_direction);
private["_litterObject"];

if (isNil QGVAR(allCreatedLitter)) then {
    GVAR(allCreatedLitter) = [];
    GVAR(litterPFHRunning) = false;
};

_litterObject = _litterClass createVehicleLocal _position;
_litterObject setDir _direction;

if((count GVAR(allCreatedLitter)) > GVAR(litterSimulationDetail) ) then {
    // gank the first litter object, and spawn ours.
    private["_oldLitter"];
    _oldLitter = GVAR(allCreatedLitter) deleteAt 0;
    {
        deleteVehicle _x;
    } forEach (_oldLitter select 1);
};

GVAR(allCreatedLitter) pushBack [time, [_litterObject]];

if(!GVAR(litterPFHRunning) && {GVAR(litterCleanUpDelay) > 0}) then {
    [{
        {
            if (time - (_x select 0) >= GVAR(litterCleanUpDelay)) then {
                {
                    deleteVehicle _x;
                } forEach (_x select 1);
                GVAR(allCreatedLitter) set[_foreachIndex, objNull];
            };
        } forEach GVAR(allCreatedLitter);
        GVAR(allCreatedLitter) = GVAR(allCreatedLitter) - [objNull];

        if ( (count GVAR(allCreatedLitter)) == 0) exitwith {
            [(_this select 1)] call CBA_fnc_removePerFrameHandler;
            GVAR(litterPFHRunning) = false;
        }; 
    }, 30, []] call cba_fnc_addPerFrameHandler;
};

true