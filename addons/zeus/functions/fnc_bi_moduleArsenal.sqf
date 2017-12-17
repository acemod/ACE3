/*
 * Author: Bohemia Interactive
 * Module function to open a full arsenal on a unit
 * Edited to use ACE arsenal when present, moved isPlayer check
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: Not used
 * 2: activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC, nil, true] call ace_zeus_fnc_bi_moduleArsenal
 *
 * Public: No
*/

#include "script_component.hpp"

params ["_logic", "", "_activated"];

if (_activated && local _logic) then {
    _unit = _logic getvariable ["bis_fnc_curatorAttachObject_object",objnull];

    //--- Check if the unit is suitable
    _error = "";
    switch true do {
        case (isnull _unit): {_error = localize "str_a3_BIS_fnc_showCuratorFeedbackMessage_506";};
        case !(alive _unit): {_error = localize "str_a3_BIS_fnc_moduleArsenal_errorDead";};
        case (isnull group _unit || !(side group _unit in [east,west,resistance,civilian])): {_error = localize "str_a3_BIS_fnc_moduleArsenal_errorBrain";};
        case (vehicle _unit != _unit || effectivecommander _unit != _unit): {_error = localize "str_a3_BIS_fnc_moduleArsenal_errorVehicle";};
    };

    if (_error == "") then {
        if (["ACE_Arsenal"] call EFUNC(common,isModLoaded)) then {
            if (!isPlayer _unit || {player == _unit}) then {

                [{
                    params ["_unit"];

                    [_unit, _unit, true] call EFUNC(arsenal,openBox);
                }, [_unit]] call CBA_fnc_directCall;
            } else {

                [objNull, localize "str_a3_BIS_fnc_moduleArsenal_errorDead"] call bis_fnc_showCuratorFeedbackMessage;
            };
        } else {
            if !(isPlayer _unit) then {

                ([] call bis_fnc_rscLayer) cuttext ["","black out",0.5];
                ["#(argb,8,8,3)color(0,0,0,1)",false,nil,0,[0.5,0]] call bis_fnc_textTiles;
                ["Open",[true,nil,_unit]] call bis_fnc_arsenal;
                ([] call bis_fnc_rscLayer) cuttext ["","plain"];
            } else {

                [objNull, localize "str_a3_BIS_fnc_moduleArsenal_errorDead"] call bis_fnc_showCuratorFeedbackMessage;
            };
        };
    } else {

        [objNull,_error] call bis_fnc_showCuratorFeedbackMessage;
    };
    deleteVehicle _logic;
};
