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

[{
    PARAMS_2(_args,_pfID);
    EXPLODE_1_PVT(_args,_veh);

    if ((vehicle ACE_player) != _veh) then {
        [_pfID] call CBA_fnc_removePerFrameHandler;
    } else {
        _display = uiNamespace getVariable ["ACE_Mk6_RscWeaponRangeArtillery", displayNull];
        if (isNull _display) exitWith {systemChat "null";};

        _elevDeg = parseNumber ctrlText (_display displayCtrl 175);
        if (GVAR(useMils)) then {
            (_display displayCtrl 80175) ctrlSetText str round (_elevDeg * 6400 / 360);
        } else {
            (_display displayCtrl 80175) ctrlSetText str _elevDeg;
        };

        if (GVAR(noComputer)) then {
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
}, 0, [_newVehicle]] call CBA_fnc_addPerFrameHandler;