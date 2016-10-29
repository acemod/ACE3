#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// Credit to killzonekid
// Almost the same as (([] call CBA_fnc_getFov) select 1) but 10x faster
DFUNC(kkTrueZoom) = {
    (
    [0.5,0.5]
    distance2D
    worldToScreen
    positionCameraToWorld
    [0,3,4]
    ) * (
    getResolution
    select 5
    ) / 2
};

ADDON = true;
