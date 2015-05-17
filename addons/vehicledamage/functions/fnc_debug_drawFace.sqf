//#define DEBUG_MODE_FULL
#include "script_component.hpp"
private["_id", "_vehicle", "_vehicleData"];
TRACE_1("enter", _this);

_id = parseNumber (_this select 0);
_this deleteAt 0;

_vehicleData = HASH_GET(GVAR(vehicles),_id);
if(isNil "_vehicleData") exitWith { false };
_vehicle = _vehicleData select 0;

_points = [];
for [{_i=0}, {_i<(count _this)-1}, {_i=_i+3}] do {
    _points pushBack (_vehicle modelToWorldVisual 
                    [  parseNumber (_this select _i), 
                       parseNumber (_this select (_i+2)),
                       parseNumber (_this select (_i+1))
                    ]);
};
//TRACE_1("", _points);
GVAR(debug_lines) pushBack [((_points select 0)), ((_points select 1))];
GVAR(debug_lines) pushBack [((_points select 1)), ((_points select 2))];
GVAR(debug_lines) pushBack [((_points select 2)), ((_points select 0))];