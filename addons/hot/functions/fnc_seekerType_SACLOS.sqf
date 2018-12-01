#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * SACLOS seeker
 *
 * Arguments:
 * 1: Guidance Arg Array <ARRAY>
 * 2: Seeker State <ARRAY>
 *
 * Return Value:
 * Position of wanted missile pos relative to the camera direction <ARRAY>
 *
 * Example:
 * [] call ace_hot_fnc_seekerType_SACLOS
 *
 * Public: No
 */
params ["", "_args"];
_args params ["_firedEH", "", "", "_seekerParams", "_stateParams"];
_firedEH params ["_shooter","_weapon","","","","","_projectile"];
_seekerParams params ["_seekerAngle", "", "_seekerMaxRange"];
_stateParams params ["", "_seekerStateParams"];

private _turretPath = [_shooter, _weapon] call CBA_fnc_turretPathWeapon;

private _shooterPos = AGLToASL (_shooter modelToWorld(_shooter selectionPosition getText(([_shooter, _turretPath] call CBA_fnc_getTurret) >> "memoryPointGunnerOptics")));
private _projPos = getPosASL _projectile;

private _lookDirection = if !(_shooter isKindOf "CAManBase") then {
    _shooter weaponDirection ((_shooter weaponsTurret _turretPath) select 0);
} else {
    _shooter weaponDirection _weapon;
};

private _distanceToProj = _shooterPos vectorDistance _projPos;
if (_distanceToProj > _seekerMaxRange) exitWith {
    // wire snap, random direction
    private _vector = [];
    if (_seekerStateParams isEqualTo [] || { !(_seekerStateParams select 0) }) then {
        _vector = RANDOM_VECTOR_3D vectorMultiply 300;
        _seekerStateParams set [0, true];
        _seekerStateParams set [1, _vector];
    } else {
        _vector = _seekerStateParams select 1;
    };
    _projPos vectorAdd _vector
};

private _testPointVector = vectorNormalized (_projPos vectorDiff _shooterPos);
private _testDotProduct = (_lookDirection vectorDotProduct _testPointVector);

if (_testDotProduct < (cos _seekerAngle)) exitWith {
    // out of LOS of seeker
    [0, 0, 0]
};

_shooterPos vectorAdd (_lookDirection vectorMultiply (_distanceToProj + 50));

