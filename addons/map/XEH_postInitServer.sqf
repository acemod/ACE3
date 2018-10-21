#include "script_component.hpp"

// Delete map glow lights from disconnecting players, #2810
addMissionEventHandler ["HandleDisconnect",{
    params ["_disconnectedPlayer"];
    if (!GVAR(mapGlow)) exitWith {};
    private _unitLight = _disconnectedPlayer getVariable [QGVAR(flashlight), ["", objNull]];
    _unitLight params ["", "_glow"];
    
    if ((!isNull _disconnectedPlayer) && {!isNull _glow}) then {
        detach _glow;
        deleteVehicle _glow;
    };

    nil
}];
