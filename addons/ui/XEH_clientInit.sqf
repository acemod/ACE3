#define DEBUG_MODE_FULL
#include "script_component.hpp"

// Exit on Headless
if !(hasInterface) exitWith {};

["SettingsInitialized", {
    // On load and entering/exiting a vehicle
    ["infoDisplayChanged", {
        LOG("UI infoDisplayChanged");

        private ["_elements", "_display"];

        // All elements with their show/hide, IDD and IDC
        _elements = [
            [GVAR(weaponInfo), 300, 2302],
            [GVAR(weaponName), 300, 118],
            //[GVAR(ammoCount), 300, 184], // Disabled in config by ace_reload
            [GVAR(magCount), 300, 185],
            [GVAR(grenadeName), 300, 152],
            [GVAR(grenadeCount), 300, 151],
            [GVAR(zeroing), 300, 168]
        ];

        disableSerialization;
        {
            _display = _x;
            {
                EXPLODE_3_PVT(_x,_show,_idd,_idc);

                //_idd = 300; //debug
                //_idc = 122; //debug
                if (_idd == ctrlIDD _display) then {
                    _show = if (_show) then {0} else {1};

                    (_display displayCtrl _idc) ctrlSetFade _show;
                    (_display displayCtrl _idc) ctrlCommit 0;
                };
            } forEach _elements;
        } forEach (uiNamespace getVariable "IGUI_displays"); // Those displays can be present several times for some reason
    }] call EFUNC(common,addEventHandler);
}] call EFUNC(common,addEventHandler);


/*
RscUnitInfo = 300
--------
Alt = 122 (UNKNOWN)
Ammo = 119 (UNKNOWN)
AmmoCount = 184 (Ammo Count)
MagCount = 185 (Magazine Count)
CA_TextFlares = 151 (Grenade Count)
CA_TextFlaresMode = 152 (Grenade Name)
CA_Zeroing = 168 (Zeroing)
Weapon = 118 (Weapon Name)
WeaponInfoControlsGroupLeft = 2302 (entire RscUnitInfo without Zeroing)
WeaponInfoControlsGroupRight = 2303 (UNKNOWN)


RscStanceInfo = 303
-------
StanceIndicator = 188 (UNKNOWN)
*/
