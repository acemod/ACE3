#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Handles player getting into new vehicle. Loads PFEG for mortar display if it is a mortar.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: New Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_mk6mortar_fnc_handlePlayerVehicleChanged
 *
 * Public: No
 */

params ["_player", "_newVehicle"];

if (isNull _newVehicle) exitWith {};
if !(_newVehicle isKindOf "Mortar_01_base_F") exitWith {};

// Restore last firemode
private _lastSavedWeaponsInfo = _newVehicle getVariable QGVAR(lastFireMode);

if (!isNil "_lastSavedWeaponsInfo") then {
    _newVehicle selectWeaponTurret [_lastSavedWeaponsInfo select 0, [0], _lastSavedWeaponsInfo select 1, _lastSavedWeaponsInfo select 2];
};

[{
    params ["_mortarVeh", "_pfhID"];

    if ((vehicle ACE_player) != _mortarVeh) exitWith {
        _pfhID call CBA_fnc_removePerFrameHandler;
    };

    // Save firemode ('charge' from weaponstate) on vehicle
    _mortarVeh setVariable [QGVAR(lastFireMode), (weaponState [_mortarVeh, [0]]) select [0, 3]];

    if (shownArtilleryComputer && {!GVAR(allowComputerRangefinder)}) then {
        // Don't like this solution, but it works
        closeDialog 0;
        [parseText "Computer Disabled"] call EFUNC(common,displayTextStructured);
    };

    private _display = uiNamespace getVariable ["ACE_Mk6_RscWeaponRangeArtillery", displayNull];

    if (isNull _display) exitWith {}; // It may be null for the first frame

    // Hud should hidden in 3rd person
    private _notGunnerView = cameraView != "GUNNER";
    private _useMils = _mortarVeh getVariable [QGVAR(useMils), true];

    // Get aiming values from ace_artillerytables
    // Note: it also handles displaying the "charge" level
    private _realAzimuth = missionNamespace getVariable [QEGVAR(artillerytables,predictedAzimuth), -1];
    private _realElevation = missionNamespace getVariable [QEGVAR(artillerytables,predictedElevation), -1];

    // Update Heading Display
    if (_notGunnerView || !GVAR(allowCompass)) then {
        (_display displayCtrl 80156) ctrlSetText "";
    } else {
        if (_useMils) then {
            (_display displayCtrl 80156) ctrlSetText str (((round (_realAzimuth * 6400 / 360)) + 6400) % 6400);
        } else {
            (_display displayCtrl 80156) ctrlSetText str ((round (_realAzimuth + 360)) % 360);
        };
    };

    // Update CurrentElevation Display
    if (_notGunnerView) then {
        (_display displayCtrl 80175) ctrlSetText "";
    } else {
        if (_useMils) then {
            (_display displayCtrl 80175) ctrlSetText str ((round (_realElevation * 6400 / 360)) % 6400);
        } else {
            (_display displayCtrl 80175) ctrlSetText str (((round (_realElevation * 100)) / 100) % 360);
        };
    };

    // Update ElevationNeeded Display
    if (_notGunnerView || !GVAR(allowComputerRangefinder)) then {
        (_display displayCtrl 80176) ctrlSetText "";
    } else {
        private _elevDeg = parseNumber ctrlText (_display displayCtrl 176);
        if (_elevDeg <= 0) then { // Bad data means "----" out of range
            (_display displayCtrl 80176) ctrlSetText (ctrlText (_display displayCtrl 176));
        } else {
            _elevDeg = _elevDeg + (_realElevation - (parseNumber ctrlText (_display displayCtrl 175)));
            if (_useMils) then {
                (_display displayCtrl 80176) ctrlSetText str round ((round (_elevDeg * 6400 / 360)) % 6400);
            } else {
                (_display displayCtrl 80176) ctrlSetText str (((round (_elevDeg * 100)) / 100) % 360);
            };
        };
    };
}, 0, _newVehicle] call CBA_fnc_addPerFrameHandler;
