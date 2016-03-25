/*
 * Author: SzwedzikPL
 * onMapItemChange event handler
 *
 * Arguments:
 * 0: Current map classname <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"
#include "script_component.hpp"

params ["_currentMap"];
TRACE_1("onMapChange",_currentMap);

if (_currentMap == "") then {
    GVAR(currentMap) = "";
    {deleteMarkerLocal _x} forEach GVAR(currentMapMarkers);
    GVAR(currentMapMarkers) = [];
    GVAR(currentMapMarkersProperties) = [];
} else {
    if (GVAR(currentMap) != _currentMap) then {
        if (isMultiplayer) then {
            GVAR(localLogic) = (createGroup sideLogic) createUnit ["Logic", [0,0,0], [], 0, "NONE"];
        };
        [QGVAR(sendMapData), [GVAR(localLogic), _currentMap]] call EFUNC(common,serverEvent);
    };
};
