#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Deploys the current CSW.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
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

    private _tripodClassname = typeOf _tripod;
    private _assembledClassname = getText (configFile >> "CfgWeapons" >> secondaryWeapon _player >> QUOTE(ADDON) >> "assembleTo" >> _tripodClassname);
    private _index = 1;

    if (_assembledClassname == "") then {
        _assembledClassname = getText (configFile >> "CfgWeapons" >> primaryWeapon _player >> QUOTE(ADDON) >> "assembleTo" >> _tripodClassname);
        _index = 0;
    };

    if (!isClass (configFile >> "CfgVehicles" >> _assembledClassname)) exitWith {ERROR_1("bad static classname [%1]",_assembledClassname);};

    // Save magazines and attachments (handle loaded launchers which can become csw like CUP Metis)
    private _carryWeaponInfo = (getUnitLoadout _player) select _index;
    private _carryWeaponClassname = _carryWeaponInfo deleteAt 0;

    // Remove empty entries
    _carryWeaponInfo = _carryWeaponInfo select {_x isNotEqualTo "" && {_x isNotEqualTo []}};

    TRACE_3("assemble_deployWeapon_carryWeaponClassname",_tripod,_player,_carryWeaponClassname);

    _player removeWeaponGlobal _carryWeaponClassname;

    private _deployTime = getNumber (configFile >> "CfgWeapons" >> _carryWeaponClassname >> QUOTE(ADDON) >> "deployTime");

    TRACE_4("",_carryWeaponClassname,_tripodClassname,_assembledClassname,_deployTime);

    private _onFinish = {
        params ["_args"];
        _args params ["_tripod", "_player", "_assembledClassname", "_tripodClassname", "_carryWeaponClassname", "_carryWeaponInfo"];
        TRACE_3("deployWeapon finish",_tripod,_player,_assembledClassname);

        private _secondaryWeaponMagazines = _tripod getVariable [QGVAR(secondaryWeaponMagazines), []];

        private _tripodPos = getPosATL _tripod;
        private _tripodDir = getDir _tripod;
        deleteVehicle _tripod;

        _tripodPos set [2, (_tripodPos select 2) + 0.1];
        // Delay a frame so tripod has a chance to be deleted
        [{
            params ["_assembledClassname", "_componentClasses", "_tripodDir", "_tripodPos", "_player", "_carryWeaponInfo", "_secondaryWeaponMagazines"];
            private _csw = createVehicle [_assembledClassname, [0, 0, 0], [], 0, "NONE"];
            // Assembly mode: [0=disabled, 1=enabled, 2=enabled&unload, 3=default]
            _csw setVariable [QGVAR(assemblyMode), 2, true]; // Explicitly set advanced assembly mode + unload, and broadcast
            _csw setVariable [QGVAR(componentClasses), _componentClasses, true];

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

            // Disable vanilla assembly until FUNC(initVehicle) runs and sets the definite value
            [_csw, "disableWeaponAssembly", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);

            _csw setDir _tripodDir;
            _csw setPosATL _tripodPos;
            if ((_tripodPos select 2) < 0.5) then {
                _csw setVectorUp (surfaceNormal _tripodPos);
            };
            [QGVAR(deployWeaponSucceeded), [_csw]] call CBA_fnc_localEvent;
            TRACE_2("csw placed",_csw,_assembledClassname);
        }, [_assembledClassname, [_tripodClassname, _carryWeaponClassname], _tripodDir, _tripodPos, _player, _carryWeaponInfo, _secondaryWeaponMagazines]] call CBA_fnc_execNextFrame;
    };

    private _onFailure = {
        params ["_args"];
        _args params ["", "_player", "", "", "_carryWeaponClassname", "_carryWeaponInfo"];
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

    [TIME_PROGRESSBAR(_deployTime), [_tripod, _player, _assembledClassname, _tripodClassname, _carryWeaponClassname, _carryWeaponInfo], _onFinish, _onFailure, LLSTRING(AssembleCSW_progressBar), _condition] call EFUNC(common,progressBar);
}, _this] call CBA_fnc_execNextFrame;
