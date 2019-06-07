#include "script_component.hpp"
if (!GVAR(enabled)) exitWith {};


// Events

[QGVAR(setVehicleDamage), {_this call FUNC(setDamage)}] call CBA_fnc_addEventHandler;
[QGVAR(setVehicleHitPointDamage), {_this call FUNC(setHitPointDamage)}] call CBA_fnc_addEventHandler;
[QGVAR(setWheelHitPointDamage), {
    params ["_object", "_hitPoint", "_damage"];
    private _damageDisabled = !isDamageAllowed _object;

    if (_damageDisabled) then {
        _object allowDamage true;
    };

    _object setHitPointDamage [_hitPoint, _damage];

    if (_damageDisabled) then {
        _object allowDamage false;
    };
}] call CBA_fnc_addEventHandler;


// Class EHs

["All", "InitPost", {
    params ["_vehicle"];
    if (!local _vehicle) exitWith {};

    if (getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "transportRepair") != 0) then {
        _vehicle setRepairCargo 0;
    };
}, true, [], true] call CBA_fnc_addClassEventHandler;

["ACE_RepairItem_Base", "killed", {
    params ["_object"];

    [{deleteVehicle _this}, _object, 5] call CBA_fnc_waitAndExecute;
}, true, [], true] call CBA_fnc_addClassEventHandler;

// load tracks and wheels
if (isServer) then {
    private _fnc_addSpareItems = {
        if (!GVAR(addSpareParts)) exitWith {};
        params ["_vehicle"];

        private _spareTracks = _vehicle getVariable QGVAR(editorLoadedTracks);
        if (isNil "_spareTracks") then {
            _spareTracks = [0, 1] select (_vehicle isKindOf "Tank"); // must match eden attribute default
        };
        if (_spareTracks > 0) then {
            [_vehicle, _spareTracks, "ACE_Track"] call FUNC(addSpareParts);
        };

        private _spareWheels = _vehicle getVariable QGVAR(editorLoadedWheels);
        if (isNil "_spareWheels") then {
            _spareWheels = [0, 1] select (_vehicle isKindOf "Car"); // must match eden attribute default
        };
        if (_spareWheels > 0) then {
            [_vehicle, _spareWheels, "ACE_Wheel"] call FUNC(addSpareParts);
        };
    };

    ["Tank", "initPost", _fnc_addSpareItems, true, [], true] call CBA_fnc_addClassEventHandler;
    ["Car", "initPost", _fnc_addSpareItems, true, [], true] call CBA_fnc_addClassEventHandler;
};


// Item replacement EH

["loadout", {
    params ["_unit"];

    private _cfgWeapons = configFile >> "CfgWeapons";
    private _toolKits = (items _unit) select {
        getNumber (_cfgWeapons >> _x >> "ItemInfo" >> "type") == ITEM_TYPE_TOOLKIT
    };

    {
        _unit removeItem _x;
        _unit addItem "ACE_ToolKit";
    } forEach _toolKits;
}, true] call CBA_fnc_addPlayerEventHandler;
