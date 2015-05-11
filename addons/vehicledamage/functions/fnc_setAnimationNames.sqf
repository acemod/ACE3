#define DEBUG_MODE_FULL
#include "script_component.hpp"
private["_id", "_vehicle", "_vehicleData"];
_id = parseNumber (_this select 0);

// The rest of the arguments in the array are just a stream of animation names
// remove the id
_this deleteAt 0;

_vehicleData = HASH_GET(GVAR(vehicles),_id);
TRACE_1("", _vehicleData);
if(!isNil "_vehicleData") then {
    _vehicle = _vehicleData select 0;
    
    _vehicle setVariable[QGVAR(animationNames), _this, false];
};