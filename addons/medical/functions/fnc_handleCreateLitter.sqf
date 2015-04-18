#include "script_component.hpp"
PARAMS_3(_litterClass,_position,_direction);
private["_litterObject"];

if (isNil QGVAR(allCreatedLitter)) then {
    GVAR(allCreatedLitter) = [];
    GVAR(litterPFHRunning) = false;
};

if((count GVAR(allCreatedLitter)) <= GVAR(litterSimulationDetail) ) then {
    _litterObject = _litterClass createVehicleLocal _position;
    _litterObject setDir _direction;
} else {
    // @TODO: We hit max litter items, remove a few of them to work with what we have.
    // Basically, we should just start FIFO'ing these
};

GVAR(allCreatedLitter) pushBack _litterObject;
//GVAR(allCreatedLitter) = GVAR(allCreatedLitter) - [objNull];

true