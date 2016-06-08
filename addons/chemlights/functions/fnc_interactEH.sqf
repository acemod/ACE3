/*
 * Author: PabstMirror, voiper
 * When interact_menu starts rendering (from "interact_keyDown" event)
 *
 * Arguments:
 * Interact Menu Type (0 - world, 1 - self) <NUMBER>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [0] call ace_chemlights_fnc_interactEH
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_interactionType"];

//Ignore self-interaction menu or mounted vehicle interaction
if ((_interactionType != 0) || {(vehicle ACE_player) != ACE_player}) exitWith {};

[{
    params ["_args", "_eh"];
    _args params ["_setPosition", "_addedHelpers", "_chemlightsHelped"];
    private ["_statement", "_condition", "_attachedChemlight", "_helper", "_action", "_objects"];

    if (!EGVAR(interact_menu,keyDown)) then {
        {deleteVehicle _x; nil} count _addedHelpers;
        [_eh] call CBA_fnc_removePerFrameHandler;
    } else {

        // Prevent Rare Error when ending mission with interact key down:
        if (isNull ACE_player) exitWith {};

        //If player moved >5 meters from last pos, then rescan
        if (((getPosASL ACE_player) distance _setPosition) > 5) then {

            _statement = {
                params ["", "_player", "_attachedChemlight"];
                [_player, _attachedChemlight] call FUNC(pickUp);
            };
            
            _condition = {
                params ["", "_player", "_attachedChemlight"];
                ([_player, _attachedChemlight, []] call EFUNC(common,canInteractWith)) && {!isNull _attachedChemlight} && {isNull attachedTo _attachedChemlight}
            };

            _objects = (ACE_player nearObjects ["Chemlight_base", 1.75]);
            _objects append (nearestObjects [ACE_player, ["ACE_Chemlight_IR_X"], 1.75]);
            {
                if !(_x in _chemlightsHelped) then {
                    _chemlightsHelped pushBack _x;
                    _helper = "ACE_LogicDummy" createVehicleLocal [0,0,0];
                    _helper setPosASL (getPosASL _x);
                    _action = [QGVAR(helperChemlight), localize LSTRING(Action_PickUp), "\A3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_takemine_ca.paa", _statement, _condition, {}, _x, {[0,0,0]}, 1.75] call EFUNC(interact_menu,createAction);
                    [_helper, 0, [], _action] call EFUNC(interact_menu,addActionToObject);
                    _addedHelpers pushBack _helper;
                };
                nil
            } count _objects;

            _args set [0, (getPosASL ACE_player)];
        };
    };
}, 0.1, [((getPosASL ACE_player) vectorAdd [-100,0,0]), [], []]] call CBA_fnc_addPerFrameHandler;