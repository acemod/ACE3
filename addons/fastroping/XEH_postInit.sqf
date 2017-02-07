#include "script_component.hpp"

[QGVAR(deployRopes), {
    _this call FUNC(deployRopes);
}] call CBA_fnc_addEventHandler;

[QGVAR(startFastRope), {
    [FUNC(fastRopeServerPFH), 0, _this] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_addEventHandler;

["ACE3 Vehicles", QGVAR(cutRopes), localize LSTRING(Interaction_cutRopes), {
    if ([vehicle ACE_player] call FUNC(canCutRopes)) then {
        [vehicle ACE_player] call FUNC(cutRopes);
        true
    } else {
        false
    };
}, {false}] call CBA_fnc_addKeybind;



#ifdef DRAW_FASTROPE_INFO
addMissionEventHandler ["Draw3D", {
    if (!(cursorObject isKindOf "Helicopter")) exitWith {};
    private _config = configFile >> "CfgVehicles" >> (typeOf cursorObject);
    private _enabled = getNumber (_config >> QGVAR(enabled));
    drawIcon3D ["", [.5,.5,1,1], (ASLtoAGL getPosASL cursorObject), 0.5, 0.5, 0, format ["%1 = %2", typeOf cursorObject, _enabled], 0.5, 0.025, "TahomaB"];
    if (_enabled > 0) then {
        {
            private _hookAttachment = cursorObject getVariable [QGVAR(FRIES), cursorObject];
            private _ropeOrigin = if (_x isEqualType []) then {_x} else {_hookAttachment selectionPosition _x};
            drawIcon3D ["", [1,.5,.5,1], (_hookAttachment modelToWorld _ropeOrigin), 0.5, 0.5, 0, format ["Rope: %1", _forEachIndex], 0.5, 0.025, "TahomaB"];
        } forEach (getArray (_config >> QGVAR(ropeOrigins)));
    };
    if (_enabled == 2) then {
        drawIcon3D ["", [.5,1,.5,1], (cursorObject modelToWorld getArray (_config >> QGVAR(friesAttachmentPoint))), 0.5, 0.5, 0, format ["Fries: %1", getText (_config >> QGVAR(friesType))], 0.5, 0.025, "TahomaB"];
    };
}];
#endif
