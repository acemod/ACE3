#include "script_component.hpp"

[QGVAR(setEngineOn), {
    params ["_vehicle", "_state"];
    _vehicle setVariable [QGVAR(engineOn), _state, true];
    _vehicle engineOn _state;
}] call EFUNC(common,addEventHandler);

[QGVAR(setPilotLight), {
    params ["_vehicle", "_state"];
    _vehicle setPilotLight _state;
}] call EFUNC(common,addEventHandler);

[QGVAR(setCollisionLight), {
    params ["_vehicle", "_state"];
    _vehicle setCollisionLight _state;
}] call EFUNC(common,addEventHandler);

[QGVAR(simulatePowerLoss), {
    params ["_vehicle"];
    _vehicle setVariable [QGVAR(engineOn), false, true];
    _vehicle engineOn false;
    _vehicle setPilotLight false;
    _vehicle setCollisionLight false;
}] call EFUNC(common,addEventHandler);
