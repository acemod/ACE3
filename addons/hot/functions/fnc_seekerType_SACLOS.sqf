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
_args params ["_firedEH", "", "", "_seekerParams"];
_firedEH params ["_shooter","_weapon","","","","","_projectile"];
_seekerParams params ["_seekerAngle", "", "_seekerMaxRange"];

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
    _shooterPos vectorAdd [random [0, 2000, 4000], random [0, 2000, 4000], random [0, 2000, 4000]]
};

if ([_shooter, _projPos, _seekerAngle] call ace_missileguidance_fnc_checkSeekerAngle) exitWith {
    [0, 0, 0]
};

_shooterPos vectorAdd (_lookDirection vectorMultiply (_distanceToProj + 50));

