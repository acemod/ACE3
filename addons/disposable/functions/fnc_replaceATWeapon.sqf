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
#include "script_component.hpp"

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


// AI - Remove the ai's missle launcher tube after the missle has exploded
if !([_unit] call EFUNC(common,isPlayer)) then {
    [{
        params ["_args","_idPFH"];
        _args params ["_unit", "_tube", "_projectile"];

        //don't do anything until projectile is null (exploded/max range)
        if (isNull _projectile) then {
            //Remove PFEH:
            [_idPFH] call CBA_fnc_removePerFrameHandler;

            //If (tube is dropped) OR (is dead) OR (is player) just exit
            if (secondaryWeapon _unit != _tube || {!alive _unit} || {[_unit] call EFUNC(common,isPlayer)}) exitWith {};

            //private  _items = secondaryWeaponItems _unit;
            private _container = createVehicle ["GroundWeaponHolder", position _unit, [], 0, "CAN_COLLIDE"];
            _container setPosAsl (getPosAsl _unit);
            _container addWeaponCargoGlobal [_tube, 1];

            //This will duplicate attachements, because we will be adding a weapon that may already have attachments on it
            //We either need a way to add a clean weapon, or a way to add a fully configured weapon to a container:
            // {
                // if (_x != "") then {_container addItemCargoGlobal [_x, 1];};
            // } forEach _items;

            _unit removeWeaponGlobal _tube;
        };
    }, 1, [_unit, _replacementTube, _projectile]] call CBA_fnc_addPerFrameHandler;
};
