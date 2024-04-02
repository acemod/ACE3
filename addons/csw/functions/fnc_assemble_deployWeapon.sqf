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

    private _carryWeaponClassname = secondaryWeapon _player;
    TRACE_3("assemble_deployWeapon_carryWeaponClassname",_tripod,_player,_carryWeaponClassname);

    private _tripodClassname = typeOf _tripod;
    private _assembledClassname = getText(configfile >> "CfgWeapons" >> _carryWeaponClassname >> QUOTE(ADDON) >> "assembleTo" >> _tripodClassname);
    private _deployTime =  getNumber(configfile >> "CfgWeapons" >> _carryWeaponClassname >> QUOTE(ADDON) >> "deployTime");
    if (!isClass (configFile >> "CfgVehicles" >> _assembledClassname)) exitWith {ERROR_1("bad static classname [%1]",_assembledClassname);};

    TRACE_4("",_carryWeaponClassname,_tripodClassname,_assembledClassname,_deployTime);

    private _onFinish = {
        params ["_args"];
        _args params ["_tripod", "_player", "_assembledClassname", "_carryWeaponClassname"];
        TRACE_4("deployWeapon finish",_tripod,_player,_assembledClassname,_carryWeaponClassname);

        // If the weapon was removed during the progressbar, quit
        if (_secondaryWeaponClassname != secondaryWeapon _player) exitWith {};

        _player removeWeaponGlobal _carryWeaponClassname;

        private _tripodPos = getPosATL _tripod;
        private _tripodDir = getDir _tripod;
        deleteVehicle _tripod;

        _tripodPos set [2, (_tripodPos select 2) + 0.1];
        // Delay a frame so tripod has a chance to be deleted
        [{
            params ["_assembledClassname", "_tripodDir", "_tripodPos"];
            private _csw = createVehicle [_assembledClassname, [0, 0, 0], [], 0, "NONE"];
            // Assembly mode: [0=disabled, 1=enabled, 2=enabled&unload, 3=default]
            _csw setVariable [QGVAR(assemblyMode), 2, true]; // Explicitly set advanced assembly mode + unload, and broadcast
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
        }, [_assembledClassname, _tripodDir, _tripodPos]] call CBA_fnc_execNextFrame;
    };

    private _codeCheck = {
        params ["_args"];
        _args params ["_tripod"];
        !isNull _tripod;
    };

    [TIME_PROGRESSBAR(_deployTime), [_tripod, _player, _assembledClassname, _carryWeaponClassname], _onFinish, {}, localize LSTRING(AssembleCSW_progressBar), _codeCheck] call EFUNC(common,progressBar);
}, _this] call CBA_fnc_execNextFrame;
