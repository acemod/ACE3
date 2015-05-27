/*
 * Author: esteldunedain
 * Start linking the belt
 *
 * Argument:
 * 0: Player <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

EXPLODE_2_PVT(_this,_player,_target);

if (vehicle _target != _target) exitWith {false};

private ["_magazineCfg","_magazineType", "_condition", "_onFailure", "_onFinish"];
_magazineType = currentMagazine _target;
_magazineCfg = configFile >> "CfgMagazines" >> _magazineType;
if (getNumber (_magazineCfg >> "ACE_isBelt") == 0) exitWith {false};

// Check if the ammo is not empty or full
private "_ammoCount";
_ammoCount = _target ammo currentWeapon _target;

// Exit if the belt is full or empty
if ((_ammoCount == 0)  || (getNumber (_magazineCfg >> "count") - _ammoCount) == 0) exitWith {false};

// Check if the player has any of the same same magazines
// Calculate max ammo it can link
private "_maxAmmo";
_maxAmmo = 0;

{
    _maxAmmo = _maxAmmo max (_x select 1);
} forEach ([magazinesAmmo _player, {_this select 0 == _magazineType}] call EFUNC(common,filter));

if (_maxAmmo == 0) exitWith {};


// Condition to call each frame
_condition = {
    EXPLODE_2_PVT((_this select 0),_player,_target);
    ([_player, _target, []] call EFUNC(common,canInteractWith)) && ((_player distance _target) < 3) && ((speed _target) < 1)
};

_onFinish = {
    EXPLODE_3_PVT((_this select 0),_player,_target,_magazine);

    // Raise event on remote unit
    ["linkedAmmo", [_target], [_target, _player, _magazine]] call EFUNC(common,targetEvent);
};

_onFailure = {
    EXPLODE_3_PVT((_this select 0),_player,_target,_magazine);
    [_player, "AmovPknlMstpSrasWrflDnon", 1] call EFUNC(common,doAnimation);

    // Add back the magazine with the former ammo count
    _player addMagazine _magazine;
};

_player playActionNow "PutDown";

// Remove the magazine with maximum remaining ammo
[_player, _magazineType, _maxAmmo] call EFUNC(common,removeSpecificMagazine);

// Call progress bar
[4, [_player, _target, [_magazineType, _maxAmmo]], _onFinish, _onFailure, (localize STRING(LinkingBelt)), _condition] call EFUNC(common,progressBar);
