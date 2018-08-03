/*
 * Author: PabstMirror, mharis001
 * Dynamically adds "Cut Fence" actions to nearby fences when interact_menu is opened.
 * Called by the "ace_interactMenuOpened" event.
 *
 * Arguments:
 * Interact Menu Type (0 - World, 1 - Self) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [0] call ace_logistics_wirecutter_fnc_interactEH
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_interactionType"];

// Ignore self-interaction menu or mounted vehicle interaction
// For performance reasons only add PFH if player has wirecutter item
// If player somehow gets a wirecutter during keyDown, they will just have to reopen menu
if (
    _interactionType != 0
    || {vehicle ACE_player != ACE_player}
    || {!HAS_WIRECUTTER(ACE_player)}
) exitWith {};

TRACE_1("Starting wirecuter interact PFH",_interactionType);

[{
    BEGIN_COUNTER(interactEH);
    params ["_args", "_pfhID"];
    _args params ["_setPosition", "_addedHelpers", "_fencesHelped"];

    if (!EGVAR(interact_menu,keyDown)) then {
        {deleteVehicle _x} forEach _addedHelpers;
        [_pfhID] call CBA_fnc_removePerFrameHandler;
    } else {
        // Prevent rare error when ending mission with interact key down
        if (isNull ACE_player) exitWith {};

        // Rescan if player has moved more than 5 meters from last position
        if (getPosASL ACE_player distanceSqr _setPosition > 25) then {
            private _fncStatement = {
                params ["", "_player", "_attachedFence"];

                [_player, _attachedFence] call FUNC(cutDownFence);
            };
            private _fncCondition = {
                params ["_helper", "_player", "_attachedFence"];

                !isNull _attachedFence
                && {damage _attachedFence < 1}
                && {HAS_WIRECUTTER(_player)}
                && {[_player, _attachedFence, ["isNotSwimming"]] call EFUNC(common,canInteractWith)}
                && {
                    // Custom LOS check for fence
                    private _headPos = AGLtoASL (_player modelToWorldVisual (_player selectionPosition "pilot"));
                    !lineIntersects [_headPos, AGLtoASL (_helper modelToWorldVisual [0, 0, 1.25]), _attachedFence, _player]
                    || {!lineIntersects [_headPos, getPosASL _attachedFence, _attachedFence, _player]}
                }
            };
            {
                if (!(_x in _fencesHelped) && {_x call FUNC(isFence)}) then {
                    _fencesHelped pushBack _x;
                    private _helper = "ACE_LogicDummy" createVehicleLocal [0, 0, 0];
                    private _action = [QGVAR(helperCutFence), localize LSTRING(CutFence), QPATHTOF(ui\wirecutter_ca.paa), _fncStatement, _fncCondition, {}, _x, {[0, 0, 0]}, 5.5, [false, false, false, false, true]] call EFUNC(interact_menu,createAction);
                    [_helper, 0, [], _action] call EFUNC(interact_menu,addActionToObject);
                    _helper setPosASL (getPosASL _x vectorAdd [0, 0, 1.25]);
                    _addedHelpers pushBack _helper;
                };
            } forEach nearestObjects [ACE_player, [], 15];

            _args set [0, getPosASL ACE_player];
        };
    };
    END_COUNTER(interactEH);
}, 0.5, [getPosASL ACE_player vectorAdd [-100, 0, 0], [], []]] call CBA_fnc_addPerFrameHandler;
