#include "script_component.hpp"


{
    deleteMarker _x;
    GVAR(plottingBoard_markers) deleteAt _x; 
} forEach GVAR(plottingBoard_markers);