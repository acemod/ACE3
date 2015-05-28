/*
 * Author: PabstMirror
 * Handles player getting into new vehicle.  Loads PFEG for mortar display if it is a mortar.
 *
 * Arguments:
 * 0:Player <OBJECT>
 * 1: New Vehicle <OBJECT>
 *
 * Return Value:
 * No
 *
 * Example:
 * [bob, mortar] call ace_mk6mortar_fnc_handlePlayerVehicleChanged;
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_chargeText", "_xPos", "_yPos", "_wPos", "_hPos", "_tubeWeaponName", "_fireModes"];

PARAMS_2(_player,_newVehicle);

if (isNull _newVehicle) exitWith {};
if (!(_newVehicle isKindOf "Mortar_01_base_F")) exitWith {};

_chargeText = (findDisplay 46) ctrlCreate ["RscStructuredText", 80085];

_xPos = (profilenamespace getvariable ["IGUI_GRID_WEAPON_X", ((safezoneX + safezoneW) - (12.4 * (((safezoneW / safezoneH) min 1.2) / 40)) - 0.5 * (((safezoneW / safezoneH) min 1.2) / 40))]);
_yPos = 2.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (profilenamespace getvariable ["IGUI_GRID_WEAPON_Y", (safezoneY + 0.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))]);
_wPos = 10 * (((safezoneW / safezoneH) min 1.2) / 40);
_hPos = 1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25);

_chargeText ctrlSetPosition [_xPos, _yPos, _wPos, _hPos];
_chargeText ctrlCommit 0;

_tubeWeaponName = (weapons _newVehicle) select 0;
_fireModes = getArray (configFile >> "CfgWeapons" >> _tubeWeaponName >> "modes");

[{
    PARAMS_2(_args,_pfID);
    EXPLODE_3_PVT(_args,_mortarVeh,_chargeText,_fireModes);

    if ((vehicle ACE_player) != _mortarVeh) then {
        [_pfID] call CBA_fnc_removePerFrameHandler;
        ctrlDelete _chargeText;
    } else {

        _useMils = _mortarVeh getVariable [QGVAR(useMils), true];

        //Compute: 'charge' from weaponstate
        _currentFireMode = (weaponState [_mortarVeh, [0]]) select 2;
        _currentChargeMode = _fireModes find _currentFireMode;

        _text = format ["<t size='0.8'>%1: %2 <img image='%3'/></t>", (localize LSTRING(rangetable_charge)), _currentChargeMode, QUOTE(PATHTOF(UI\ui_charges.paa))];
        _chargeText ctrlSetStructuredText parseText _text;
        if (shownArtilleryComputer && {!GVAR(allowComputerRangefinder)}) then {
            //Don't like this solution, but it works
            closeDialog 0;
            [parseText "Computer Disabled"] call EFUNC(common,displayTextStructured);
        };

        _display = uiNamespace getVariable ["ACE_Mk6_RscWeaponRangeArtillery", displayNull];
        if (isNull _display) exitWith {}; //It may be null for the first frame

        //Hud should hidden in 3rd person
        _notGunnerView = cameraView != "GUNNER";

        //Update CurrentElevation Display:
        if (_notGunnerView) then {
            (_display displayCtrl 80175) ctrlSetText "";
        } else {
            _elevDeg = parseNumber ctrlText (_display displayCtrl 175);
            if (_useMils) then {
                (_display displayCtrl 80175) ctrlSetText str round (_elevDeg * 6400 / 360);
            } else {
                (_display displayCtrl 80175) ctrlSetText str _elevDeg;
            };
        };

        //Update ElevationNeeded Display:
        if (_notGunnerView || (!GVAR(allowComputerRangefinder))) then {
            (_display displayCtrl 80176) ctrlSetText "";
        } else {
            _elevDeg = parseNumber ctrlText (_display displayCtrl 176);
            if (_elevDeg <= 0) then { //Bad data means "----" out of range
                (_display displayCtrl 80176) ctrlSetText (ctrlText (_display displayCtrl 176));
            } else {
                if (_useMils) then {
                    (_display displayCtrl 80176) ctrlSetText str round (_elevDeg * 6400 / 360);
                } else {
                    (_display displayCtrl 80176) ctrlSetText str _elevDeg;
                };
            };
        };

        //Update Heading Display:
        if (_notGunnerView || (!GVAR(allowCompass))) then {
            (_display displayCtrl 80156) ctrlSetText "";
        } else {
            _rotationDegrees = ((getDir _mortarVeh) + (((-180 / PI) * (_mortarVeh animationPhase "mainTurret")) + 360)) % 360;
            if (_useMils) then {
                (_display displayCtrl 80156) ctrlSetText str round (_rotationDegrees * 6400 / 360);
            } else {
                (_display displayCtrl 80156) ctrlSetText (ctrlText (_display displayCtrl 156));
            };
        };
    };
}, 0, [_newVehicle, _chargeText,_fireModes]] call CBA_fnc_addPerFrameHandler;
