// by esteldunedain
#include "script_component.hpp"

if (!hasInterface) exitWith {};

// Add keybinds
["ACE3 Weapons", QGVAR(checkAmmo), localize LSTRING(checkAmmo),
{
    // Conditions: canInteract
    if !([ACE_player, vehicle ACE_player, ["isNotInside", "isNotSitting"]] call CFUNC(canInteractWith)) exitWith {false};
    // Conditions: specific
    if !(ACE_player call CBA_fnc_canUseWeapon || {(vehicle ACE_player) isKindOf "StaticWeapon"}) exitWith {false};

    // Statement
    [ACE_player] call FUNC(checkAmmo);
    true
},
{false},
[19, [false, true, false]], false] call CBA_fnc_addKeybind;

["setAmmoSync", {
    //To propagate the setAmmo change, do it on all clients
    params ["_unit", "_weapon", "_ammo"];
    TRACE_3("setAmmoSync EH",_unit,_weapon,_ammo);

    _unit setAmmo [_weapon, _ammo];
}] call CFUNC(addEventhandler);

// Listen for attempts to link ammo
["linkedAmmo", {
    params ["_receiver", "_giver", "_magazine"];

    private _magazineType = currentMagazine _receiver;
    private _magazineCfg = configFile >> "CfgMagazines" >> _magazineType;

    // Return the magazine if it's the wrong type
    if (_magazineType != (_magazine select 0)) exitWith {
        ["returnedAmmo", [_giver], [_giver,_receiver,_magazine]] call CFUNC(targetEvent);
    };

    private _ammoCount = _receiver ammo currentWeapon _receiver;
    private _ammoMissing = getNumber (_magazineCfg >> "count") - _ammoCount;

    // Return the magazine if the belt is full or empty
    if ((_ammoCount == 0)  || _ammoMissing == 0) exitWith {
        ["returnedAmmo", [_giver], [_giver,_receiver,_magazine]] call CFUNC(targetEvent);
    };

    // Add the ammo
    private _ammoAdded = _ammoMissing min (_magazine select 1);
    ["setAmmoSync", [_receiver, currentWeapon _receiver, _ammoCount + _ammoAdded]] call CFUNC(globalEvent);

    if ((_magazine select 1) - _ammoAdded > 0) then {
        ["returnedAmmo", [_giver], [_giver, _receiver, [_magazineType, (_magazine select 1) - _ammoAdded]]] call CFUNC(targetEvent);
    };
}] call CFUNC(addEventhandler);

// Listen for returned magazines
["returnedAmmo", {
    params ["_receiver", "", "_magazine"];
    TRACE_2("returnedAmmo EH",_receiver,_magazine);

    _receiver addMagazine _magazine;
}] call CFUNC(addEventhandler);
