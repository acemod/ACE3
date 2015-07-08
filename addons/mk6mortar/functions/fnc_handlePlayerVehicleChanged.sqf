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

PARAMS_2(_player,_newVehicle);

private["_tubeWeaponName" ,"_fireModes"];

if (isNull _newVehicle) exitWith {};
if (!(_newVehicle isKindOf "Mortar_01_base_F")) exitWith {};

_tubeWeaponName = (weapons _newVehicle) select 0;
_fireModes = getArray (configFile >> "CfgWeapons" >> _tubeWeaponName >> "modes");

[{
    private["_chargeText", "_currentChargeMode", "_currentFireMode", "_display", "_elevDeg", "_elevationDiff", "_lookVector", "_notGunnerView", "_realAzimuth", "_realElevation", "_upVectorDir", "_useMils", "_weaponDir"];
    PARAMS_2(_args,_pfID);
    EXPLODE_2_PVT(_args,_mortarVeh,_fireModes);

    if ((vehicle ACE_player) != _mortarVeh) then {
        [_pfID] call CBA_fnc_removePerFrameHandler;
    } else {

        _useMils = _mortarVeh getVariable [QGVAR(useMils), true];

        //Compute: 'charge' from weaponstate
        _currentFireMode = (weaponState [_mortarVeh, [0]]) select 2;
        _currentChargeMode = _fireModes find _currentFireMode;

        if (shownArtilleryComputer && {!GVAR(allowComputerRangefinder)}) then {
            //Don't like this solution, but it works
            closeDialog 0;
            [parseText "Computer Disabled"] call EFUNC(common,displayTextStructured);
        };

        _display = uiNamespace getVariable ["ACE_Mk6_RscWeaponRangeArtillery", displayNull];
        if (isNull _display) exitWith {}; //It may be null for the first frame

        _chargeText = format ["<t size='0.8'>%1: %2 <img image='%3'/></t>", (localize LSTRING(rangetable_charge)), _currentChargeMode, QUOTE(PATHTOF(UI\ui_charges.paa))];

        //Hud should hidden in 3rd person
        _notGunnerView = cameraView != "GUNNER";

        //Calc real azimuth/elevation
        //(looking at the sky VS looking at ground will radicaly change fire direction because BIS)
        _realAzimuth = -1;
        _realElevation = -1;
        if ((ctrlText (_display displayCtrl 173)) == "--") then {
            //No range (looking at sky), it will follow weaponDir:
            _weaponDir = _mortarVeh weaponDirection (currentWeapon _mortarVeh);
            _realAzimuth = (_weaponDir select 0) atan2 (_weaponDir select 1);
            _realElevation = asin (_weaponDir select 2);
        } else {
            //Valid range, will fire at camera dir
            _lookVector = (ATLToASL (positionCameraToWorld [0,0,0])) vectorFromTo (ATLToASL (positionCameraToWorld [0,0,10]));
            _realAzimuth = ((_lookVector select 0) atan2 (_lookVector select 1));
            _upVectorDir = (((vectorUp z1) select 0) atan2 ((vectorUp z1) select 1));
            _elevationDiff = (cos (_realAzimuth - _upVectorDir)) * acos ((vectorUp z1) select 2);
            _realElevation = ((180 / PI) * (z1 animationPhase "mainGun")) + 75 - _elevationDiff;
        };

        //Update Heading Display:
        if (_notGunnerView || (!GVAR(allowCompass))) then {
            (_display displayCtrl 80156) ctrlSetText "";
        } else {
            if (_useMils) then {
                (_display displayCtrl 80156) ctrlSetText str (((round (_realAzimuth * 6400 / 360)) + 6400) % 6400);
            } else {
                (_display displayCtrl 80156) ctrlSetText str ((round (_realAzimuth + 360)) % 360);
            };
        };

        //Update CurrentElevation Display and "charge" text
        if (_notGunnerView) then {
            (_display displayCtrl 80085) ctrlSetStructuredText parseText "";
            (_display displayCtrl 80175) ctrlSetText "";
        } else {
            (_display displayCtrl 80085) ctrlSetStructuredText parseText _chargeText;

            if (_useMils) then {
                (_display displayCtrl 80175) ctrlSetText str ((round (_realElevation * 6400 / 360)) % 6400);
            } else {
                (_display displayCtrl 80175) ctrlSetText str (((round (_realElevation * 100)) / 100) % 360);
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
                _elevDeg = _elevDeg + (_realElevation - (parseNumber ctrlText (_display displayCtrl 175)));
                if (_useMils) then {
                    (_display displayCtrl 80176) ctrlSetText str round ((round (_elevDeg * 6400 / 360)) % 6400);
                } else {
                    (_display displayCtrl 80176) ctrlSetText str (((round (_elevDeg * 100)) / 100) % 360);
                };
            };
        };
    };
}, 0, [_newVehicle, _fireModes]] call CBA_fnc_addPerFrameHandler;
