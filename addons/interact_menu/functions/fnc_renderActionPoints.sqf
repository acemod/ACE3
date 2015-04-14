/*
 * Author: NouberNou and esteldunedain
 * Render all action points
 *
 * Argument:
 * None
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

GVAR(currentOptions) = [];

private ["_player","_numInteractObjects","_numInteractions","_actionsVarName","_classActions","_objectActions","_target","_player","_action","_actionData","_active"];
_player = ACE_player;


_fnc_renderNearbyActions = {
    // Render all nearby interaction menus
    #define MAXINTERACTOBJECTS 3

    _numInteractObjects = 0;
    _nearestObjects = nearestObjects [ACE_player, ["All"], 15];
    {
        _target = _x;

        _numInteractions = 0;
        // Prevent interacting with yourself or your own vehicle
        if (_target != ACE_player && {_target != vehicle ACE_player}) then {

            // Iterate through object actions, find base level actions and render them if appropiate
            _actionsVarName = format [QGVAR(Act_%1), typeOf _target];
            GVAR(objectActionList) = _target getVariable [QGVAR(actions), []];
            {
                // Only render them directly if they are base level actions
                if (count (_x select 1) == 0) then {
                    // Try to render the menu
                    _action = _x;
                    if ([_target, _action] call FUNC(renderBaseMenu)) then {
                        _numInteractions = _numInteractions + 1;
                    };
                };
            } forEach GVAR(objectActionList);

            // Iterate through base level class actions and render them if appropiate
            _classActions = missionNamespace getVariable [_actionsVarName, []];
            {
                _action = _x;
                // Try to render the menu
                if ([_target, _action] call FUNC(renderBaseMenu)) then {
                    _numInteractions = _numInteractions + 1;
                };
            } forEach _classActions;

            // Limit the amount of objects the player can interact with
            if (_numInteractions > 0) then {
                _numInteractObjects = _numInteractObjects + 1;
            };
        };
        if (_numInteractObjects >= MAXINTERACTOBJECTS) exitWith {};

    } forEach _nearestObjects;
};



_fnc_renderSelfActions = {
    _target = _this;

    // Iterate through object actions, find base level actions and render them if appropiate
    _actionsVarName = format [QGVAR(SelfAct_%1), typeOf _target];
    GVAR(objectActionList) = _target getVariable [QGVAR(selfActions), []];
    /*
    {
        _action = _x;
        // Only render them directly if they are base level actions
        if (count (_action select 7) == 1) then {
            [_target, _action, 0, [180, 360]] call FUNC(renderMenu);
        };
    } forEach GVAR(objectActionList);
    */

    // Iterate through base level class actions and render them if appropiate
    _actionsVarName = format [QGVAR(SelfAct_%1), typeOf _target];
    _classActions = missionNamespace getVariable [_actionsVarName, []];
    {
        _action = _x;

        _pos = if !(GVAR(useCursorMenu)) then {
            (((positionCameraToWorld [0, 0, 0]) call EFUNC(common,positionToASL)) vectorAdd GVAR(selfMenuOffset)) call EFUNC(common,ASLToPosition)
        } else {
            [0.5, 0.5]
        };
        [_target, _action, _pos] call FUNC(renderBaseMenu);
    } forEach _classActions;
};


// Render nearby actions, unit self actions or vehicle self actions as appropiate
if (GVAR(openedMenuType) == 0) then {

    if (vehicle ACE_player == ACE_player) then {
        call _fnc_renderNearbyActions;
    } else {
        (vehicle ACE_player) call _fnc_renderSelfActions;
    };

} else {
    ACE_player call _fnc_renderSelfActions;
};
