#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Copperhead: attack profile
 *
 * Arguments:
 * 0: Seeker Target PosASL <ARRAY>
 * 1: Guidance Arg Array <ARRAY>
 * 2: Attack Profile State <ARRAY>
 *
 * Return Value:
 * Missile Aim PosASL <ARRAY>
 *
 * Example:
 * [[1,2,3], [], []] call ace_missile_clgp_fnc_copperhead_attackProfile
 *
 * Public: No
 */

params ["_seekerTargetPos", "_args", "_attackProfileStateParams"];
_args params ["_firedEH"];
_firedEH params ["","","","","","","_projectile"];
_attackProfileStateParams params ["_trajectoryShaped"];

// Apply CLGP Drag
// private _dragArray = _projectile getVariable [QGVAR(dragArray), []];
// if (_dragArray isNotEqualTo []) then { _dragArray call FUNC(submunition_applyDrag) };

private _projectilePos = getPosASL _projectile;
private _projectileVelocity = velocity _projectile;
private _projectileElev = acos (_projectileVelocity vectorCos [0,0,-1]); // referenced to straight down

private _aimASL = []; // return
if (_seekerTargetPos isEqualTo [0,0,0]) then {
    private _dir = _projectile getVariable [QGVAR(targetDir), 0];
    private _elev = if (_trajectoryShaped) then { 0 } else { _projectileElev - 90 };
    _aimASL = _projectilePos vectorAdd ([100, _dir, _elev] call CBA_fnc_polar2vect);
    if (EGVAR(missileguidance,debug_drawGuidanceInfo)) then {
        drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [0,0,0,1], ASLToAGL _aimASL, 
            0.75, 0.75, 0, format ["No TGT: %1 %2", floor _dir, floor _elev], 1, 0.025, "TahomaB"];
    };
 } else { 
    // have valid seeker target
    _aimASL = _seekerTargetPos;
    private _dir = (_seekerTargetPos vectorDiff _projectilePos) call CBA_fnc_vectDir;
    _projectile setVariable [QGVAR(targetDir), _dir];
 };

// Limit max elevation to prevent stalling - unpowered gliding
private _maxElev = 68; // ~2.5 glide ratio (another source says 20-25deg flyout angle)
private _aimDiff = _aimASL vectorDiff _projectilePos;
private _aimElev = acos (_aimDiff vectorCos [0,0,-1]);
private _adjustAngle = _maxElev - _aimElev;
if (_adjustAngle < 0) then {
    private _factor = [0.5, 1] select (_aimElev > _projectileElev);
    private _adjustOffset = _factor * ((sin _adjustAngle) * vectorMagnitude _aimDiff);
    if (EGVAR(missileguidance,debug_drawGuidanceInfo)) then {
        drawLine3D [ASLToAGL _aimASL, ASLToAGL (_aimASL vectorAdd [0,0,_adjustOffset]), [0,0.5,1,1]];
        drawIcon3D ["", [0,0.5,1,1], ASLToAGL (_aimASL vectorAdd [0,0,0.5*_adjustOffset]), 
            0.75, 0.75, 0, format ["GLIDE LIMIT %1", floor _adjustOffset], 1, 0.025, "TahomaB"];
    };
    _aimASL = _aimASL vectorAdd [0,0,_adjustOffset];
};


if (EGVAR(missileguidance,debug_drawGuidanceInfo)) then {
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0.2,1,1], ASLToAGL (_projectilePos vectorAdd ((vectorNormalized _projectileVelocity) vectorMultiply 100)), 
        0.75, 0.75, 0, format ["V %1", floor _projectileElev], 1, 0.025, "TahomaB"];
};

TRACE_1("dir",_projectilePos getDir _aimASL);
_aimASL
