#include "..\script_component.hpp"
/*
 * Author: PabstMirror, mharis001
 * Dynamically adds actions to nearby water sources when interact_menu is opened.
 * Called by the "ace_interactMenuOpened" event.
 *
 * Arguments:
 * Interact Menu Type (0 - World, 1 - Self) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [0] call ace_field_rations_fnc_addWaterSourceInteractions
 *
 * Public: No
 */

params ["_interactionType"];

// Ignore during self-interaction or when water source actions are disabled
if (
    _interactionType != 0
    || {XGVAR(waterSourceActions) == 0}
) exitWith {};

TRACE_1("Starting interact PFH",_interactionType);

[{
    BEGIN_COUNTER(interactEH);
    params ["_args", "_pfhID"];
    _args params ["_setPosition", "_addedHelpers", "_sourcesHelped"];

    if (!EGVAR(interact_menu,keyDown)) then {
        TRACE_1("Ending interact PFH",_pfhID);
        {detach _x; deleteVehicle _x} forEach _addedHelpers;
        [_pfhID] call CBA_fnc_removePerFrameHandler;
    } else {
        // Prevent rare error when ending mission with interact key down
        if (isNull ACE_player) exitWith {};

        // Rescan if player has moved more than 5 meters from last position
        if (getPosASL ACE_player distanceSqr _setPosition > 25) then {
            BEGIN_COUNTER(updatePosition);
            {
                if (!(_x in _sourcesHelped) && {XGVAR(terrainObjectActions) || {!(_x call CBA_fnc_isTerrainObject)}}) then {
                    private _waterRemaining = [_x] call FUNC(getRemainingWater);

                    if (_waterRemaining != REFILL_WATER_DISABLED) then {
                        private _offset = [_x] call FUNC(getActionOffset);
                        if (_offset isEqualTo [0, 0, 0]) then {
                            if !(_x getVariable [QGVAR(waterSourceActionsAdded), false]) then {
                                private _vehicle = _x;
                                _vehicle setVariable [QGVAR(waterSource), _vehicle];
                                _sourcesHelped pushBack _vehicle;
                                // Add water source actions to the vehicle itself
                                private _mainAction = [_vehicle, 0, ["ACE_MainActions"], GVAR(mainAction)] call EFUNC(interact_menu,addActionToObject);
                                private _selfAction = [_vehicle, 1, ["ACE_SelfActions"], GVAR(mainAction)] call EFUNC(interact_menu,addActionToObject);
                                {
                                    [_vehicle, 0, _mainAction, _x] call EFUNC(interact_menu,addActionToObject);
                                    [_vehicle, 1, _selfAction, _x] call EFUNC(interact_menu,addActionToObject);
                                } forEach GVAR(subActions);
                                _vehicle setVariable [QGVAR(waterSourceActionsAdded), true];
                                TRACE_3("Added interaction to vehicle",_x,typeOf _x,_waterRemaining);
                            };
                        } else {
                            private _helper = QGVAR(helper) createVehicleLocal [0, 0, 0];
                            _helper setVariable [QGVAR(waterSource), _x];
                            _helper attachTo [_x, _offset];

                            _addedHelpers pushBack _helper;
                            _sourcesHelped pushBack _x;
                            TRACE_3("Added interaction helper",_x,typeOf _x,_waterRemaining);
                        };
                    };
                };
            } forEach nearestObjects [ACE_player, [], 15];

            _args set [0, getPosASL ACE_player];
            END_COUNTER(updatePosition);
        };
    };
    END_COUNTER(interactEH);
}, 0.5, [[0, 0, -100], [], []]] call CBA_fnc_addPerFrameHandler;
