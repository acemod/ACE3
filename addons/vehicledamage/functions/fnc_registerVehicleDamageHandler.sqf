#define DEBUG_MODE_FULL
#include "script_component.hpp"
PARAMS_1(_vehicle);
private["_hitPoints"];

_vehicle addEventHandler ["handleDamage", FUNC(dispatchDamage)];
_vehicle addEventHandler ["hitPart", FUNC(dispatchHitPart)];

// Calculate the number of hitpoints on the vehicle and cache it
_hitPoints = (configFile >> "CfgVehicles" >> typeOf _vehicle >> "HitPoints");
_vehicle setVariable[QGVAR(hitpointCount), (count _hitPoints), false];

// Create the simulation copy of this vehicle locally on each client
//_localSimulation = (typeOf _vehicle) createVehicleLocal [-1000,-1000,-1000];
//_localSimulation enableSimulation false;
//_vehicle setVariable[QGVAR(localSimulation), _localSimulation, false];

// Map the hitpoints of the vehicle so we dont have to pull/calculate at runtime
