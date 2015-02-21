#include "script_component.hpp"

PARAMS_2(_sender,_markers);
if (_sender == (ACE_player getVariable [QGVAR(sharingMapHost), objNull])) then {
    systemChat format ["Recieved %1 markers", (count _markers)];
    GVAR(markerDataToDraw) = _markers;
};
