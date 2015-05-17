#include "script_component.hpp"

{
    private["_vehicle", "_fromVector", "_toVector"];
    _vehicle = _x select 0;
    _fromVector = _x select 1;
    _toVector = _x select 2;
    if(!isNil "_vehicle") then {
        if((typeName _vehicle) == "OBJECT") then {
            _toVector = _vehicle modelToWorldVisual _toVector;
            _fromVector = _vehicle modelToWorldVisual _fromVector;
        };
    };
    
    drawLine3D [_fromVector, _toVector, [1,1,1,1]];
} forEach GVAR(debug_lines);
