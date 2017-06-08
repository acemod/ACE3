/*
 * Author: PabstMirror
 * When interact_menu starts rendering (from "interact_keyDown" event)
 *
 * Arguments:
 * Interact Menu Type (0 - world, 1 - self) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [0] call ace_logistics_wirecutter_fnc_interactEH
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_interactionType"];

//Ignore self-interaction menu or mounted vehicle interaction
if ((_interactionType != 0) || {(vehicle ACE_player) != ACE_player}) exitWith {};

//for performance only do stuff it they have a wirecutter item
//(if they somehow get one durring keydown they'll just have to reopen)
if (!("ACE_wirecutter" in (items ace_player))) exitWith {};

TRACE_1("Starting wire-cut action PFEH",_interactionType);

[{
    private ["_fncStatement", "_attachedFence", "_fncCondition", "_helper", "_action"];
    params ["_args", "_pfID"];
    _args params ["_setPosition", "_addedHelpers", "_fencesHelped"];

    if (!EGVAR(interact_menu,keyDown)) then {
        {deleteVehicle _x; nil} count _addedHelpers;
        [_pfID] call CBA_fnc_removePerFrameHandler;
    } else {
        // Prevent Rare Error when ending mission with interact key down:
        if (isNull ace_player) exitWith {};

        //If player moved >5 meters from last pos, then rescan
        if (((getPosASL ace_player) distance _setPosition) > 5) then {

            _fncStatement = {
                params ["", "_player", "_attachedFence"];
                [_player, _attachedFence] call FUNC(cutDownFence);
            };
            _fncCondition = {
                params ["_helper", "_player", "_attachedFence"];
                if (!([_player, _attachedFence, []] call EFUNC(common,canInteractWith))) exitWith {false};
                ((!isNull _attachedFence) && {(damage _attachedFence) < 1} && {("ACE_wirecutter" in (items _player))} && {
                    //Custom LOS check for fence
                    private _headPos = ACE_player modelToWorldVisual (ACE_player selectionPosition "pilot");
                    ((!(lineIntersects [AGLtoASL _headPos, AGLtoASL (_helper modelToWorldVisual [0,0,1.25]), _attachedFence, ACE_player])) ||
                    {!(lineIntersects [AGLtoASL _headPos, getPosASL _attachedFence, _attachedFence, ACE_player])})
                })
            };

            {
                if (!(_x in _fencesHelped)) then {
                    if ([_x] call FUNC(isFence)) then {
                        _fencesHelped pushBack _x;
                        _helper = "ACE_LogicDummy" createVehicleLocal (getpos _x);
                        _action = [QGVAR(helperCutFence), (localize LSTRING(CutFence)), QPATHTOF(ui\wirecutter_ca.paa), _fncStatement, _fncCondition, {}, _x, {[0,0,0]}, 5.5, [false, false, false, false, true]] call EFUNC(interact_menu,createAction);
                        [_helper, 0, [],_action] call EFUNC(interact_menu,addActionToObject);
                        _helper setPosASL ((getPosASL _x) vectorAdd [0,0,1.25]);
                        _addedHelpers pushBack _helper;
                    };
                };
                nil
            } count nearestObjects [ace_player, [], 15];

            _args set [0, (getPosASL ace_player)];
        };
    };
}, 0.1, [((getPosASL ace_player) vectorAdd [-100,0,0]), [], []]] call CBA_fnc_addPerFrameHandler;
