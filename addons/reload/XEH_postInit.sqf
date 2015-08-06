// by esteldunedain
#include "script_component.hpp"

if !(hasInterface) exitWith {};

// Add keybinds
[localize ELSTRING(common,ACEConfigCategoryWeapons)
, QGVAR(checkAmmo), localize LSTRING(checkAmmo),
{
    // Conditions: canInteract
    if !([ACE_player, (vehicle ACE_player), ["isNotInside", "isNotSitting"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call EFUNC(common,canUseWeapon) || {(vehicle ACE_player) isKindOf "StaticWeapon"}) exitWith {false};

    // Statement
    [ACE_player] call FUNC(checkAmmo);
    true
},
{false},
[19, [false, true, false]], false] call cba_fnc_addKeybind;

["setAmmoSync", {
    //To propagate the setAmmo change, do it on all clients
    PARAMS_3(_unit,_weapon,_ammo);
    _unit setAmmo [_weapon, _ammo];
}] call EFUNC(common,addEventhandler);

// Listen for attempts to link ammo
["linkedAmmo", {
    EXPLODE_3_PVT(_this,_receiver,_giver,_magazine);
    diag_log "linkedAmmo";
    diag_log _this;

    private ["_magazineCfg","_magazineType"];
    _magazineType = currentMagazine _receiver;
    _magazineCfg = configFile >> "CfgMagazines" >> _magazineType;

    // Return the magazine if it's the wrong type
    if (_magazineType != (_magazine select 0)) exitWith {
        ["returnedAmmo", [_giver], [_giver,_receiver,_magazine]] call EFUNC(common,targetEvent);
    };

    private ["_ammoCount","_ammoMissing","_ammoAdded","_ammoRemaining"];
    _ammoCount = _receiver ammo currentWeapon _receiver;
    _ammoMissing = getNumber (_magazineCfg >> "count") - _ammoCount;

    // Return the magazine if the belt is full or empty
    if ((_ammoCount == 0)  || _ammoMissing == 0) exitWith {
        ["returnedAmmo", [_giver], [_giver,_receiver,_magazine]] call EFUNC(common,targetEvent);
    };

    // Add the ammo
    _ammoAdded = _ammoMissing min (_magazine select 1);
    ["setAmmoSync", [_receiver, (currentWeapon _receiver), (_ammoCount + _ammoAdded)]] call EFUNC(common,globalEvent);

    if ((_magazine select 1) - _ammoAdded > 0) then {
        ["returnedAmmo", [_giver], [_giver,_receiver,[_magazineType,(_magazine select 1) - _ammoAdded]]] call EFUNC(common,targetEvent);
    };

}] call EFUNC(common,addEventhandler);


// Listen for returned magazines
["returnedAmmo", {
    EXPLODE_3_PVT(_this,_receiver,_giver,_magazine);
    diag_log "returnedAmmo";
    diag_log _this;

    _receiver addMagazine _magazine;
}] call EFUNC(common,addEventhandler);
