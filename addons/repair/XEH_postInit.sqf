#include "script_component.hpp"

["CBA_settingsInitialized", {

    if (!GVAR(enabled)) exitWith {};

    [QGVAR(setVehicleDamage), LINKFUNC(setDamage)] call CBA_fnc_addEventHandler;
    [QGVAR(setVehicleHitPointDamage), LINKFUNC(setHitPointDamage)] call CBA_fnc_addEventHandler;
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


    // placed in editor static objects don't trigger init
    {
        if (local _x && {getRepairCargo _x > 0}) then {
            _x setRepairCargo 0;
            TRACE_3("setRepairCargo static",_x,typeOf _x,getRepairCargo _x);
        };
    } forEach allMissionObjects "Static";

    ["All", "InitPost", {
        params ["_vehicle"];
        if !(local _vehicle && {getRepairCargo _vehicle > 0}) exitWith {};
        _vehicle setRepairCargo 0;
        TRACE_3("setRepairCargo vehicle",_vehicle,typeOf _vehicle,getRepairCargo _vehicle);
    }, true, ["Man"], true] call CBA_fnc_addClassEventHandler;

    ["CAManBase", "InitPost", {
        params ["_unit"];
        private _isEngineer = _unit getUnitTrait "engineer";
        if (isNil "_isEngineer" || {_isEngineer isNotEqualTo true}) exitWith {};
        TRACE_4("setUnitTrait 1",_unit,typeOf _unit,local _unit,ACE_player);

        if (local _unit) exitWith {
            _unit setUnitTrait ["engineer", false];

            if (_unit getVariable ["ACE_IsEngineer", -1] isEqualTo -1) then {
                _unit setVariable ["ACE_IsEngineer", true, true];
            };
        };

        // Handle player locality delay, can be anywhere from instant to 10+ seconds (#10337)
        if (_unit isNotEqualTo ACE_player) exitWith {};
        _unit addEventHandler ["Local", {
            params ["_unit", "_isLocal"];
            if (!_isLocal) exitWith {};
            TRACE_3("setUnitTrait 2",_unit,typeOf _unit,_unit getUnitTrait "engineer");
            _unit setUnitTrait ["engineer", false];
            _unit removeEventHandler ["Local", _thisEventHandler];
        }];
    }, true, [], true] call CBA_fnc_addClassEventHandler;


    GVAR(allToolKits) = call (uiNamespace getVariable QGVAR(allToolKits));

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
                private _defaultCount = parseNumber (_vehicle isKindOf "Tank"); // must match eden attribute default
                _spareTracks = [configOf _vehicle >> QGVAR(spareTracks), "NUMBER", _defaultCount] call CBA_fnc_getConfigEntry;
            };
            if (_spareTracks > 0) then {
                [_vehicle, _spareTracks, "ACE_Track"] call FUNC(addSpareParts);
            };

            private _spareWheels = _vehicle getVariable QGVAR(editorLoadedWheels);
            if (isNil "_spareWheels") then {
                private _defaultCount = parseNumber (_vehicle isKindOf "Car"); // must match eden attribute default
                _spareWheels = [configOf _vehicle >> QGVAR(spareWheels), "NUMBER", _defaultCount] call CBA_fnc_getConfigEntry;
            };
            if (_spareWheels > 0) then {
                [_vehicle, _spareWheels, "ACE_Wheel"] call FUNC(addSpareParts);
            };
        };

        ["Tank", "initPost", _fnc_addSpareItems, true, [], true] call CBA_fnc_addClassEventHandler;
        ["Car", "initPost", _fnc_addSpareItems, true, [], true] call CBA_fnc_addClassEventHandler;
    };

}] call CBA_fnc_addEventHandler;
