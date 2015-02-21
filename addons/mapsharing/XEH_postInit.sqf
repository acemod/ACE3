#include "script_component.hpp"

GVAR(markerDataToDraw) = [];

if (hasInterface) then {
    [{
        if (!isNull findDisplay 12) exitWith {};  //Wait for main map
        systemChat "Installing Map DrawEH";

        [(_this select 1)] call CBA_fnc_removePerFrameHandler;

        ((findDisplay 12) displayctrl 51) ctrlAddEventHandler ["Draw", {_this call FUNC(handleMainMapDraw)}];
        ((findDisplay 12) displayctrl 51) ctrlAddEventHandler ["MouseButtonDown", {[_this, false] call FUNC(handleMapClick)}];
        ((findDisplay 12) displayctrl 51) ctrlAddEventHandler ["MouseButtonUp", {[_this, true] call FUNC(handleMapClick)}];
    }, 1, []] call CBA_fnc_addPerFrameHandler;
};

//Handles when someone starts disconnects
if (isServer) then {
    addMissionEventHandler ["HandleDisconnect", {
        PARAMS_1(_disconnectedPlayer);
        if (!isNull _disconnectedPlayer) then {
            if (!isNull (_disconnectedPlayer getVariable [QGVAR(sharingMapObject), objNull])) then {
                _disconnectedPlayer setVariable [QGVAR(sharingMapObject), objNull, true];
            };
        };
    }];
};
