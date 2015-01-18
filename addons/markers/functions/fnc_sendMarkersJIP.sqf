// by commy2
#include "script_component.hpp"

private "_logic";

_logic = _this;

[QGVAR(setMarkerJIP), _logic, [
        GETMVAR(allMapMarkers,[]),
        GETMVAR(allMapMarkersProperties,[]),
        _logic
    ]
] call EFUNC(common,targetEvent);
