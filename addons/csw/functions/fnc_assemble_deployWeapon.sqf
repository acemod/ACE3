#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Deploys the current CSW
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Unit <OBJECT>
 * 2: Args <ANY>
 * 3: Action Data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player] call ace_csw_fnc_assemble_deployWeapon
 *
 * Public: No
 */

[{
    params ["_tripod", "_player"];

    // Save magazines and attachments (handle loaded launchers which can become csw like CUP Metis)
    private _carryWeaponInfo = (getUnitLoadout _player) select 1;
    private _carryWeaponClassname = _carryWeaponInfo deleteAt 0;

    // Remove empty entries
    _carryWeaponInfo = _carryWeaponInfo select {_x isNotEqualTo "" && {_x isNotEqualTo []}};

    TRACE_3("assemble_deployWeapon_carryWeaponClassname",_tripod,_player,_carryWeaponClassname);

    private _tripodClassname = typeOf _tripod;
    private _weaponConfig = configfile >> "CfgWeapons" >> _carryWeaponClassname >> QUOTE(ADDON);
    private _assembledClassname = getText (_weaponConfig >> "assembleTo" >> _tripodClassname);

    if (!isClass (configFile >> "CfgVehicles" >> _assembledClassname)) exitWith {ERROR_1("bad static classname [%1]",_assembledClassname);};

    _player removeWeaponGlobal _carryWeaponClassname;

    private _deployTime = getNumber (_weaponConfig >> "deployTime");

    TRACE_4("",_carryWeaponClassname,_tripodClassname,_assembledClassname,_deployTime);

    private _onFinish = {
        params ["_args"];
        _args params ["_tripod", "_player", "_assembledClassname", "", "_carryWeaponInfo"];
        TRACE_3("deployWeapon finish",_tripod,_player,_assembledClassname);

        private _secondaryWeaponMagazines = _tripod getVariable [QGVAR(secondaryWeaponMagazines), []];

        private _tripodPos = getPosATL _tripod;
        private _tripodDir = getDir _tripod;
        deleteVehicle _tripod;

        _tripodPos set [2, (_tripodPos select 2) + 0.1];
        // Delay a frame so tripod has a chance to be deleted
        [{
            params ["_assembledClassname", "_tripodDir", "_tripodPos", "_player", "_carryWeaponInfo", "_secondaryWeaponMagazines"];
            private _csw = createVehicle [_assembledClassname, [0, 0, 0], [], 0, "NONE"];
            // Assembly mode: [0=disabled, 1=enabled, 2=enabled&unload, 3=default]
            _csw setVariable [QGVAR(assemblyMode), 2, true]; // Explicitly set advanced assembly mode + unload, and broadcast

            {
                // Magazines
                if (_x isEqualType []) then {
                    _secondaryWeaponMagazines pushBack _x;
                } else {
                    // Items
                    [_player, _x, true] call CBA_fnc_addItem;
                };
            } forEach _carryWeaponInfo;

            // Only add magazines once the weapon is fully ready
            if (_secondaryWeaponMagazines isNotEqualTo []) then {
                _csw setVariable [QGVAR(secondaryWeaponMagazines), _secondaryWeaponMagazines, true];
            };

            if (!GVAR(defaultAssemblyMode)) then {
                [_csw, "disableWeaponAssembly", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);
            };
            _csw setDir _tripodDir;
            _csw setPosATL _tripodPos;
            if ((_tripodPos select 2) < 0.5) then {
                _csw setVectorUp (surfaceNormal _tripodPos);
            };
            [QGVAR(deployWeaponSucceeded), [_csw]] call CBA_fnc_localEvent;
            TRACE_2("csw placed",_csw,_assembledClassname);
        }, [_assembledClassname, _tripodDir, _tripodPos, _player, _carryWeaponInfo, _secondaryWeaponMagazines]] call CBA_fnc_execNextFrame;
    };

    private _onFailure = {
        params ["_args"];
        _args params ["", "_player", "", "_carryWeaponClassname", "_carryWeaponInfo"];
        TRACE_2("deployWeapon failure",_player,_carryWeaponClassname);

        // Add weapon back
        [_player, _carryWeaponClassname] call CBA_fnc_addWeaponWithoutItems;

        // Add all attachments back
        {
            _player addWeaponItem [_carryWeaponClassname, _x, true];
        } forEach _carryWeaponInfo;
    };

    private _condition = {
        params ["_args"];
        _args params ["_tripod"];

        alive _tripod
    };

    [TIME_PROGRESSBAR(_deployTime), [_tripod, _player, _assembledClassname, _carryWeaponClassname, _carryWeaponInfo], _onFinish, _onFailure, LLSTRING(AssembleCSW_progressBar), _condition] call EFUNC(common,progressBar);
}, _this] call CBA_fnc_execNextFrame;
