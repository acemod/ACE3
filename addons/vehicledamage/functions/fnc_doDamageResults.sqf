#define DEBUG_MODE_FULL
#include "script_component.hpp"
private["_id", "_vehicle", "_vehicleData", "_hitData"];
_id = parseNumber (_this select 0);

// The rest of the arguments in the array are just a stream of animation names
// remove the id
_this deleteAt 0;

_vehicleData = HASH_GET(GVAR(vehicles),_id);
TRACE_1("", _vehicleData);
if(isNil "_vehicleData") exitWith { flase };
_vehicle = _vehicleData select 0;

// Build out the hit data
_hitData = [];

[QGVAR(hit_kenetic), [_vehicle, _hitData] ] call EFUNC(common,localEvent);
[QGVAR(hit_thermal), [_vehicle, _hitData] ] call EFUNC(common,localEvent);
[QGVAR(hit_pressure), [_vehicle, _hitData] ] call EFUNC(common,localEvent);
[QGVAR(hit_material), [_vehicle, _hitData] ] call EFUNC(common,localEvent);

