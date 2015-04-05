/*
 * Author: PabstMirror
 *
 *
 * Arguments:
 *
 * Return Value:
 *
 * Example:
 *
 * Public: No
 */
#include "script_component.hpp"

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

[{
    PARAMS_2(_args,_pfID);
    EXPLODE_2_PVT(_args,_veh,_chargeText);

    if ((vehicle ACE_player) != _veh) then {
        [_pfID] call CBA_fnc_removePerFrameHandler;
        ctrlDelete _chargeText;
    } else {
        _text = format ["<t size='0.8'>%1: %2 <img image='%3'/></t>", "Charge", 1, QUOTE(PATHTOF(UI\ui_charges.paa))];
        _chargeText ctrlSetStructuredText parseText _text;
        if (shownArtilleryComputer && GVAR(disableComputerRangefinder)) then {
            //Don't like this solution, but it works
            closeDialog 0;
            [parseText "Computer Disabled"] call EFUNC(common,displayTextStructured);
        };
        _display = uiNamespace getVariable ["ACE_Mk6_RscWeaponRangeArtillery", displayNull];
        if (isNull _display) exitWith {systemChat "null";};

        _elevDeg = parseNumber ctrlText (_display displayCtrl 175);
        if (GVAR(useMils)) then {
            (_display displayCtrl 80175) ctrlSetText str round (_elevDeg * 6400 / 360);
        } else {
            (_display displayCtrl 80175) ctrlSetText str _elevDeg;
        };

        if (GVAR(disableComputerRangefinder)) then {
            (_display displayCtrl 80176) ctrlSetText "";
        } else {
            _elevDeg = parseNumber ctrlText (_display displayCtrl 176);
            if (_elevDeg <= 0) then {
                (_display displayCtrl 80176) ctrlSetText (ctrlText (_display displayCtrl 176));
            } else {
                if (GVAR(useMils)) then {
                    (_display displayCtrl 80176) ctrlSetText str round (_elevDeg * 6400 / 360);
                } else {
                    (_display displayCtrl 80176) ctrlSetText str _elevDeg;
                };
            };
        };
    };
}, 0, [_newVehicle, _chargeText]] call CBA_fnc_addPerFrameHandler;