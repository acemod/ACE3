#include "script_component.hpp"



//Only sync when sharing
if (isNull (ACE_player getVariable [QGVAR(sharingMapHost), objNull])) exitWith {};

EXPLODE_2_PVT(_this,_mouseEvent,_mouseData);

switch (_mouseEvent) do {
    case("MouseUp"): {
        EXPLODE_4_PVT(_mouseData,_mapControl,_mouseButton,_mouseX,_mouseY);
        if (_mouseButton == 0) then {
            GVAR(MapLeftMouseButtonIsDown) = false;
        };
    };
case ("MouseDown"): {
        EXPLODE_4_PVT(_mouseData,_mapControl,_mouseButton,_mouseX,_mouseY);
        if (_mouseButton == 0) then {
            GVAR(MapLeftMouseButtonIsDown) = true;
            GVAR(MapMouseWorldPos) = _mapControl ctrlMapScreenToWorld [_mouseX, _mouseY];
        };
        // if (_mouseButton == 1) then {
        // _handeled = ACE_player != (ACE_player getVariable [QGVAR(sharingMapHost), objNull])
        // };
    };
case ("MouseMoving"): {
        EXPLODE_3_PVT(_mouseData,_mapControl,_mouseX,_mouseY);
        GVAR(MapMouseWorldPos) = _mapControl ctrlMapScreenToWorld [_mouseX, _mouseY];
    };
};

if (GVAR(MapLeftMouseButtonIsDown)) then {
    //if var is [], set to pos
    if ((ACE_player getVariable [QGVAR(mouseClickPos), []]) isEqualTo []) then {
        [ACE_player, QGVAR(mouseClickPos), GVAR(MapMouseWorldPos), 0.2] call EFUNC(common,setVariablePublic);
    } else {
        //Only update if mouse has moved
        if ((GVAR(MapMouseWorldPos) distance (ACE_player getVariable [QGVAR(mouseClickPos), [0,0]])) > 5) then {
            [ACE_player, QGVAR(mouseClickPos), GVAR(MapMouseWorldPos), 0.2] call EFUNC(common,setVariablePublic);
        };
    };
} else {
    //Mouse Not Down, make sure var is []
    if (!((ACE_player getVariable [QGVAR(mouseClickPos), []]) isEqualTo [])) then {
        [ACE_player, QGVAR(mouseClickPos), [], 0.2] call EFUNC(common,setVariablePublic);
    };
};
