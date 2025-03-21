#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Deploys the tripod.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call ace_csw_fnc_assemble_deployTripod
 *
 * Public: No
 */

[{
    params ["_player"];
    TRACE_1("assemble_deployTripod",_player);

    // Save magazines and attachments (handle loaded launchers which can become csw like CUP Metis)
    private _secondaryWeaponInfo = (getUnitLoadout _player) select 1;
    private _secondaryWeaponClassname = _secondaryWeaponInfo deleteAt 0;

    // Remove empty entries
    _secondaryWeaponInfo = _secondaryWeaponInfo select {_x isNotEqualTo "" && {_x isNotEqualTo []}};

    // Remove the tripod from the launcher slot
    _player removeWeaponGlobal _secondaryWeaponClassname;

    private _onFinish = {
        params ["_args"];
        _args params ["_player", "_secondaryWeaponClassname", "_secondaryWeaponInfo"];
        TRACE_3("deployTripod finish",_player,_secondaryWeaponClassname,_secondaryWeaponInfo);

        private _tripodClassname = getText (configFile >> "CfgWeapons" >> _secondaryWeaponClassname >> QUOTE(ADDON) >> "deploy");

        // Create a tripod
        private _cswTripod = createVehicle [_tripodClassname, [0, 0, 0], [], 0, "NONE"];
        // Because the tripod can be a "full weapon" we disable any data that will allow it to be loaded
        _cswTripod setVariable [QGVAR(assemblyMode), 2, true]; // Explicitly set enabled&unload assembly mode and broadcast

        private _secondaryWeaponMagazines = [];

        {
            // Magazines
            if (_x isEqualType []) then {
                _secondaryWeaponMagazines pushBack _x;
            } else {
                // Items
                [_player, _x, true] call CBA_fnc_addItem;
            };
        } forEach _secondaryWeaponInfo;

        // Only add magazines once the weapon is fully ready
        if (_secondaryWeaponMagazines isNotEqualTo []) then {
            _cswTripod setVariable [QGVAR(secondaryWeaponMagazines), _secondaryWeaponMagazines, true];
        };

        // Disable vanilla assembly until FUNC(initVehicle) runs and sets the definite value
        [_cswTripod, "disableWeaponAssembly", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);

        private _posATL = _player getRelPos [2, 0];
        _posATL set [2, ((getPosATL _player) select 2) + 0.5];

        _cswTripod setDir (direction _player);
        _cswTripod setPosATL _posATL;
        _cswTripod setVectorUp (surfaceNormal _posATL);

        [_player, "PutDown"] call EFUNC(common,doGesture);

        // drag after deploying
        if ((missionNamespace getVariable [QGVAR(dragAfterDeploy), false]) && {["ace_dragging"] call EFUNC(common,isModLoaded)}) then {
            if ([_player, _cswTripod] call EFUNC(dragging,canCarry)) then {
                TRACE_1("starting carry",_cswTripod);
                [_player, _cswTripod] call EFUNC(dragging,startCarry);
            } else {
                TRACE_1("cannot carry",_cswTripod);
            };
        };
    };

    private _onFailure = {
        params ["_args"];
        _args params ["_player", "_secondaryWeaponClassname", "_secondaryWeaponInfo"];
        TRACE_3("deployTripod failure",_player,_secondaryWeaponClassname,_secondaryWeaponInfo);

        // Add tripod back
        [_player, _secondaryWeaponClassname] call CBA_fnc_addWeaponWithoutItems;

        // Add all attachments back
        {
            _player addWeaponItem [_secondaryWeaponClassname, _x, true];
        } forEach _secondaryWeaponInfo;
    };

    private _deployTime = getNumber (configFile >> "CfgWeapons" >> _secondaryWeaponClassname >> QUOTE(ADDON) >> "deployTime");
    [TIME_PROGRESSBAR(_deployTime), [_player, _secondaryWeaponClassname, _secondaryWeaponInfo], _onFinish, _onFailure, LLSTRING(PlaceTripod_progressBar)] call EFUNC(common,progressBar);
}, _this] call CBA_fnc_execNextFrame;
