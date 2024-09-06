#include "..\script_component.hpp"
/*
Author: Kerc, Original by www.3commandobrigade.com, edited by johnb43 to be made CSW compatible
Alter weapon height
Arguments:
0: static weapon platform
1: new static weapon (ie the weapon to replace the current weapon)
Return Value:
None
*/

//////////////////////////////////////////////////////////////////////////////////////////
// Main
//////////////////////////////////////////////////////////////////////////////////////////
_this spawn {
    private ["_weaponPlatform", "_magazines", "_newStaticWeapon", "_pos", "_dir", "_rounds", "_magName"];
    _weaponPlatform = _this select 0;
    _newStaticWeapon = _this select 1;

    if ((alive (call SPE_fnc_findPlayer))) then
    {
        // Edited: Start
        if (param [2, false, [false]]) exitWith {
            [10 * EGVAR(csw,progressBarTimeCoefficent), [_weaponPlatform, _newStaticWeapon], {
                (_this select 0) params ["_weaponPlatform", "_newStaticWeapon"];

                [_weaponPlatform, _newStaticWeapon] call SPE_Weapons_Static_fnc_alter_height;
            }, {}, LSUBLSTRING(alteringHeight), {
                (_this select 0) params ["_weaponPlatform"];

                _player distance _weaponPlatform <= 4 && {[_weaponPlatform, true] call SPE_Weapons_Static_fnc_can_alter_height}
            }] call EFUNC(common,progressBar);
        };
        // Edited: End

        // Lock vehicle to prevent further interaction.  No need to unlock as it is being deleted.
        [_weaponPlatform,[[0],true]] remoteExec ["lockTurret",_weaponPlatform]; // Edited: Small fix by johnb43
        _dir = vectorDir _weaponPlatform;
        _pos = getPosATL _weaponPlatform;


        // Save state
        _magazines = magazinesAmmoFull _weaponPlatform;
        private _assemblyModeIndex = _weaponPlatform getVariable QEGVAR(csw,assemblyMode); // Edited

        // Delete weapon and create new one


        //diag_log format["Creating weapon at %1 (%2)", _pos, (getPosATL _weaponPlatform)];
        _pos = [_pos select 0, _pos select 1, (_pos select 2) + 0.1];  // 10cm above terrain surface
        deleteVehicle _weaponPlatform;

        _weaponPlatform = createVehicle [_newStaticWeapon, _pos, [], 0, "CAN_COLLIDE"];
        // Edited: Start
        if (!isNil "_assemblyModeIndex") then {
            // Don't empty the weapon of its existing mags
            _weaponPlatform setVariable [QEGVAR(csw,assemblyMode), 0, true];

            if (_assemblyModeIndex == 0) exitWith {};

            // Reset variable to original after initVehicle has run
            [{
                (_this select 0) setVariable [QEGVAR(csw,assemblyMode), _this select 1, true];
            }, [_weaponPlatform, _assemblyModeIndex], 1.5] call CBA_fnc_waitAndExecute;
        };
        // Edited: End
        _weaponPlatform disableCollisionWith (call SPE_fnc_findPlayer);
        _weaponPlatform setVectorDir _dir;

        // Set owner to server - avoids visual effects bug when hosted locally
        [_weaponPlatform,2] remoteExec ["setOwner",2];


        sleep 0.1;
        _weaponPlatform enableCollisionWith (call SPE_fnc_findPlayer);
        // Restore state
        private _Spawnmagazines = _weaponPlatform magazinesTurret [0];
        {
            _weaponPlatform removeMagazineTurret [_x,[0]];
        } forEach _Spawnmagazines;
        //Remove weapon temporarily and readd it to instantly load previous magazine
        private _weapon = (_weaponPlatform weaponsTurret [0])select 0;
        if (!isNil "_weapon") then {_weaponPlatform removeWeaponTurret [_weapon,[0]];};

        if (count _magazines > 0) then
        {
            //Find loaded magazine
            private _loadedIndex = _magazines findIf {_x#2};
            if (_loadedIndex != -1) then
            {
                (_magazines#_loadedIndex) params ["_magClass","_ammoCount"];
                _weaponPlatform addMagazineTurret [_magClass, [0], _ammoCount];
                _magazines deleteAt _loadedIndex;
            };
            _weaponPlatform addWeaponTurret [_weapon, [0]];
            {
                _x params ["_magClass","_ammoCount","_loaded"];
                //In some instances the loaded magazine is listed twice, so we skip it.
                if (!_loaded) then {_weaponPlatform addMagazineTurret [_magClass, [0], _ammoCount];};
            } forEach _magazines;
        };
    };
};
