/*
 * Author: Grey-Soldierman
 *
 * Prepares a mortar round with a particular charge
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: oldMagazine <STRING>
 * 2: newMagazine <STRING>
 * 3: chargeClass <STRING>
 * 4: chargesRequired <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player,'ACE_1Rnd_82mm_Mo_HE','ACE_1Rnd_82mm_Mo_HE_Charge_3','ACE_Propelling_Charge',1] call ace_mk6mortar_fnc_prepRound
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit","_oldMagazine","_newMagazine","_chargeClass","_chargesRequired"];

if !(isNil (_newMagazine)) exitWith {ERROR("New magazine classname required");};

if !([_unit,_oldMagazine] call EFUNC(common,hasMagazine)) exitWith {ERROR("Player does not have magazine to remove");};

// Remove or add charges
if (_chargesRequired > 0) then {
    if (_unit canAdd [_chargeClass, _chargesRequired]) then {
        for "_i" from 1 to _chargesRequired do {
            _unit addItem _chargeClass;
        };
    } else {
        _pos = _unit modelToWorldVisual [0.5,0.5,0]; // Front right of player
        _holder = createVehicle ["WeaponHolder_Single_F",_pos,[],0,"NONE"];
        _holder addItemCargo [_chargeClass, _chargesRequired];
        _holder setPosATL _pos;
    };
} else {
    private _chargeCount = {_x == _chargeClass} count items _unit;
    
    //Flip the charges required from negative to positive number so we can easily check against it
    _chargesRequired = _chargesRequired * -1;

    if (_chargeCount < _chargesRequired) exitWith {ERROR("Player does not the required amount of charges")};

    for "_i" from 1 to _chargesRequired do {
        _unit removeItem _chargeClass;
    };
};

// Add the new magazine
if (_unit canAdd _newMagazine) then {
    _unit addMagazineGlobal _newMagazine;
} else {
    _pos = _unit modelToWorldVisual [0.5,0.5,0]; // Front right of player
    _holder = createVehicle ["WeaponHolder_Single_F",_pos,[],0,"NONE"];
    _holder addMagazineAmmoCargo [_newMagazine, 1, 1];
    _holder setPosATL _pos;
};

_unit removeMagazine _oldMagazine;
