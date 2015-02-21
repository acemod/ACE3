#include "script_component.hpp"

//Global Variables:
GVAR(markerDataToDraw) = [];
GVAR(MapMouseWorldPos) = [];
GVAR(MapLeftMouseButtonIsDown) = false;

//Event Handlers:
["ShareMap_RecieveMarkers", {_this call FUNC(handleRecieveMarkersEH)}] call EFUNC(common,addEventHandler);

//Install Main Map EH
if (hasInterface) then {
    [{
        if (isNull findDisplay 12) exitWith {};  //Wait for main map
        systemChat "Installing Map DrawEH";

        [(_this select 1)] call CBA_fnc_removePerFrameHandler;

        ((findDisplay 12) displayctrl 51) ctrlAddEventHandler ["Draw", {_this call FUNC(handleDrawMainMap)}];
        ((findDisplay 12) displayctrl 51) ctrlAddEventHandler ["MouseButtonDown", {["MouseDown", _this] call FUNC(handleMapEvents)}];
        ((findDisplay 12) displayctrl 51) ctrlAddEventHandler ["MouseButtonUp", {["MouseUp", _this] call FUNC(handleMapEvents)}];
        ((findDisplay 12) displayctrl 51) ctrlAddEventHandler ["MouseMoving", {["MouseMoving", _this] call FUNC(handleMapEvents)}];
    }, 1, []] call CBA_fnc_addPerFrameHandler;
};

//Server Events: Handles when someone disconnects
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
