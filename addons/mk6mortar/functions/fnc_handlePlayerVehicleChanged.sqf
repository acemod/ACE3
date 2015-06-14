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

private ["_chargeText", "_tubeWeaponName", "_fireModes"];

PARAMS_2(_player,_newVehicle);

if (isNull _newVehicle) exitWith {};
if (!(_newVehicle isKindOf "Mortar_01_base_F")) exitWith {};

_tubeWeaponName = (weapons _newVehicle) select 0;
_fireModes = getArray (configFile >> "CfgWeapons" >> _tubeWeaponName >> "modes");

[{
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

        //Get a precise rotation from the vehicle / animation
        _rotationDegrees = ((getDir _mortarVeh) + (((-180 / PI) * (_mortarVeh animationPhase "mainTurret")) + 360)) % 360;

        //BIS Fucked up math:
        _upAngleOffset = asin ((vectorUp _mortarVeh) vectorDotProduct [sin _rotationDegrees, cos _rotationDegrees, 0]);
        hintSilent format ["%1\n%2", _rotationDegrees, _upAngleOffset];

        //Update Heading Display:
        if (_notGunnerView || (!GVAR(allowCompass))) then {
            (_display displayCtrl 80156) ctrlSetText "";
        } else {
            if (_useMils) then {
                (_display displayCtrl 80156) ctrlSetText str ((round (_rotationDegrees * 6400 / 360)) % 6400);
            } else {
                (_display displayCtrl 80156) ctrlSetText (ctrlText (_display displayCtrl 156));
            };
        };

        //Update CurrentElevation Display and "charge" text
        if (_notGunnerView) then {
            (_display displayCtrl 80085) ctrlSetStructuredText parseText "";
            (_display displayCtrl 80175) ctrlSetText "";
        } else {
            (_display displayCtrl 80085) ctrlSetStructuredText parseText _chargeText;
            _elevDeg = parseNumber ctrlText (_display displayCtrl 175);

            //Apply the offset (from vectorUp):
            _elevDeg = _elevDeg - _upAngleOffset;

            if (_useMils) then {
                (_display displayCtrl 80175) ctrlSetText str ((round (_elevDeg * 6400 / 360)) % 6400);
            } else {
                (_display displayCtrl 80175) ctrlSetText str (((round (_elevDeg * 100)) / 100) % 360);
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
            
                //Apply the offset (from vectorUp):
                _elevDeg = _elevDeg - _upAngleOffset;

                if (_useMils) then {
                    (_display displayCtrl 80176) ctrlSetText str round ((round (_elevDeg * 6400 / 360)) % 6400);
                } else {
                    (_display displayCtrl 80176) ctrlSetText str (((round (_elevDeg * 100)) / 100) % 360);
                };
            };
        };
    };
}, 0, [_newVehicle, _fireModes]] call CBA_fnc_addPerFrameHandler;
