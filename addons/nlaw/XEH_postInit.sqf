#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(isLockKeyDown) = false;

// Degrees per second
GVAR(yawChange) = 0;
GVAR(pitchChange) = 0;

// Add keybind
["ACE3 Weapons", QGVAR(trackTarget), localize LSTRING(trackTarget), {
    call FUNC(keyDown);
    false // Return false so it doesn't block the rest weapon action
}, {
    TRACE_1("lock key up",GVAR(isLockKeyDown));
    GVAR(isLockKeyDown) = false;
    false
}, [15, [false, false, false]], false] call CBA_fnc_addKeybind;  //Tab Key



// Visual debuging, idealy used with a moving vehicle called "testTarget"
#ifdef DRAW_NLAW_INFO
addMissionEventHandler ["Draw3d", {
    // GREEN - Draw an object called "testTarget"'s aim pos and 1 sec aimpos predicted by velocity
    if ((!isNil "testTarget") && {!isNull testTarget}) then {
        {
            drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [0,1,0,1], ASLtoAGL ((aimPos testTarget) vectorAdd ((velocity testTarget) vectorMultiply _x)), 0.75, 0.75, 0, format ["%1", _x], 1, 0.025, "TahomaB"];
        } forEach [0, 1, 2, 3];
    };

    // RED - If lock key is down, draw weapon dir and predicted path at various times
    if (GVAR(yawChange) != 0) then {
        {
            private _viewASL = AGLtoASL positionCameraToWorld [0,0,0];
            private _viewDir = ACE_player weaponDirection (currentWeapon ACE_player);
            (_viewDir call CBA_fnc_vect2Polar) params ["", "_yaw", "_pitch"];
            private _realYaw = _yaw + GVAR(yawChange) * _x;
            private _realPitch = _pitch + GVAR(pitchChange) * _x;
            private _returnTargetPos = _viewASL vectorAdd ([1000, _realYaw, _realPitch] call CBA_fnc_polar2vect);
            drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,0,1], ASLtoAGL _returnTargetPos, 0.75, 0.75, 0, format ["%1", _x], 1, 0.025, "TahomaB"];
        } forEach [0, 1, 2, 3];
    };
}];
#endif
