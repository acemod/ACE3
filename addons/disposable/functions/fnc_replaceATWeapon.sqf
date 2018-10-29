#include "script_component.hpp"
/*
 * Author: bux, commy2
 * Replace the disposable launcher with the used dummy. Called from the unified fired EH.
 *
 * Arguments:
 * None. Parameters inherited from EFUNC(common,firedEH)
 *
 * Return Value:
 * None
 *
 * Example:
 * [fromBisFiredEH] call ace_disposable_fnc_replaceATWeapon;
 *
 * Public: No
 */

//IGNORE_PRIVATE_WARNING ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle", "_gunner", "_turret"];
TRACE_10("firedEH:",_unit, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile, _vehicle, _gunner, _turret);

if (!local _unit || {_weapon != secondaryWeapon _unit})  exitWith {};

private _replacementTube = getText (configFile >> "CfgWeapons" >> _weapon >> "ACE_UsedTube");
if (_replacementTube == "") exitWith {}; //If no replacement defined just exit

//Save array of items attached to launcher
private _items = secondaryWeaponItems _unit;
//Replace the orginal weapon with the 'usedTube' weapon
_unit addWeapon _replacementTube;
//Makes sure the used tube is still equiped
_unit selectWeapon _replacementTube;
//Re-add all attachments to the used tube
{
    if (_x != "") then {_unit addSecondaryWeaponItem _x};
} count _items;

[{
    params ["_args", "_idPFH"];
    _args params ["_unit", "_replacementTube", "_projectile"];

    //Wait until the unit switches weapon.
    if (currentWeapon _unit != _replacementTube) then {
        //Remove PFEH:
        [_idPFH] call CBA_fnc_removePerFrameHandler;

        //If (tube is dropped) OR (is dead) just exit
        if (secondaryWeapon _unit != _replacementTube || {!alive _unit}) exitWith {};

        //Remove the weapon and "throw" it on the ground.
        _unit removeWeaponGlobal _replacementTube;
        private _container = createVehicle ["WeaponHolderSimulated", _unit modelToWorld ((_unit selectionPosition ["rightshoulder", "Memory"]) vectorAdd [0, 0.2, 0.1]), [], 0, "CAN_COLLIDE"];
        _container addWeaponCargoGlobal [_replacementTube, 1];
        _container setDir (getDir _unit - 90);
        //We get the current velocity of the soldier, then apply it to the launcher. Position 0 and 1 in the array are reversed because the model is rotated by 90 degrees.
        _container setVelocityModelSpace [(velocityModelSpace _unit select 1) + 0.2, (velocityModelSpace _unit select 0) - 1.5, velocityModelSpace _unit select 2];
    };
}, 0, [_unit, _replacementTube, _projectile]] call CBA_fnc_addPerFrameHandler;
