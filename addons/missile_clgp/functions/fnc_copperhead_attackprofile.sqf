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
private _dragArray = _projectile getVariable [QGVAR(dragArray), []];
if (_dragArray isNotEqualTo []) then { _dragArray call FUNC(submunition_applyDrag) };

private _projectilePos = getPosASL _projectile;
private _projectileVelocity = velocity _projectile;
private _projectileElev = acos (_projectileVelocity vectorCos [0,0,-1]); // referenced to straight down

private _aimASL = []; // return

if (_seekerTargetPos isEqualTo [0,0,0]) then {
    if (_trajectoryShaped && {_projectileElev < 90}) then {
        // Shaped Trajectory - Try to glide level - adjusted to correct AoA below
        _aimASL = _projectile modelToWorldWorld [0,50,0];
        _aimASL set [2, _projectilePos # 2];
    };
 } else { 
     // have valid seeker target
    _aimASL = _seekerTargetPos;
 };

// systemChat format ["start %1", [0,0,0] getDir _projectileVelocity];

if (_aimASL isEqualTo []) then {
    _aimASL = [0,0,0]; // Fly unchanged
} else {
    // Limit max elevation to prevent stalling - unpowered gliding
    private _maxElev = 68; // ~2.5 glide ratio (another source says 20-25deg flyout angle)
    private _aimDiff = _aimASL vectorDiff _projectilePos;
    private _aimElev = acos (_aimDiff vectorCos [0,0,-1]);
    if (_aimElev > _projectileElev) then {
        private _adjustAngle = _maxElev - _aimElev;
        if (_adjustAngle >= 0) exitWith {};
        private _adjustOffset = (sin _adjustAngle) * vectorMagnitude _aimDiff;
        _aimASL = _aimASL vectorAdd [0,0,_adjustOffset];
#ifdef DEBUG_MODE_FULL
        drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [0,1,1,1], ASLtoAGL _aimASL, 0.75, 0.75, 0, "LIMIT", 1, 0.025, "TahomaB"];
#endif
    };
    TRACE_1("dir",_projectilePos getDir _aimASL);
};

_aimASL
