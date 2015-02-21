#include "script_component.hpp"

PARAMS_2(_sender,_markers);
if (_sender == (ACE_player getVariable [QGVAR(sharingMapHost), objNull])) then {
    GVAR(markerDataToDraw) = _markers;
};
