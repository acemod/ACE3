//#define DEBUG_MODE_FULL
#include "script_component.hpp"

if(!hasInterface) exitWith { false };

PARAMS_3(_litterClass,_position,_direction);
private["_litterObject", "_maxLitterCount"];
//IGNORE_PRIVATE_WARNING(_values);

if (isNil QGVAR(allCreatedLitter)) then {
    GVAR(allCreatedLitter) = [];
    GVAR(litterPFHRunning) = false;
};

_litterObject = _litterClass createVehicleLocal _position;
_litterObject setDir _direction;
_litterObject setPosATL _position;
// Move the litter next frame to get rid of HORRIBLE spacing, fixes #1112
[{ (_this select 0) setPosATL (_this select 1); }, [_litterObject, _position]] call EFUNC(common,execNextFrame);
    
_maxLitterCount = getArray (configFile >> "ACE_Settings" >> QGVAR(litterSimulationDetail) >> "_values") select GVAR(litterSimulationDetail); 
if((count GVAR(allCreatedLitter)) > _maxLitterCount ) then {
    // gank the first litter object, and spawn ours.
    private["_oldLitter"];
    _oldLitter = GVAR(allCreatedLitter) deleteAt 0;
    {
        deleteVehicle _x;
    } forEach (_oldLitter select 1);
};

GVAR(allCreatedLitter) pushBack [ACE_time, [_litterObject]];

if(!GVAR(litterPFHRunning) && {GVAR(litterCleanUpDelay) > 0}) then {
    GVAR(litterPFHRunning) = true;
    [{
        {
            if (ACE_time - (_x select 0) >= GVAR(litterCleanUpDelay)) then {
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
    }, 30, []] call CBA_fnc_addPerFrameHandler;
};

true