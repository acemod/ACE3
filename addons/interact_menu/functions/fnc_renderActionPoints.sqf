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

private ["_player","_numInteractObjects","_numInteractions","_actionsVarName","_classActions","_target","_player","_action","_cameraPos","_cameraDir", "_lambda", "_nearestObjects", "_pos", "_virtualPoint", "_wavesAtOrigin", "_wavesAtVirtualPoint"];
_player = ACE_player;

_fnc_renderNearbyActions = {
    // Render all nearby interaction menus
    #define MAXINTERACTOBJECTS 3

    _cameraPos = (positionCameraToWorld [0, 0, 0]) call EFUNC(common,positionToASL);
    _cameraDir = ((positionCameraToWorld [0, 0, 1]) call EFUNC(common,positionToASL)) vectorDiff _cameraPos;

    GVAR(foundActions) = [];
    GVAR(lastTimeSearchedActions) = diag_tickTime;

    _numInteractObjects = 0;
    _nearestObjects = nearestObjects [ACE_player, ["All"], 13];
    {
        _target = _x;

        // Quick oclussion test. Skip objects more than 1 m behind the camera plane
        _lambda = ((getPosASL _x) vectorDiff _cameraPos) vectorDotProduct _cameraDir;
        if (_lambda > -1) then {
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
                            GVAR(foundActions) pushBack [_target, _action];
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
                        GVAR(foundActions) pushBack [_target, _action];
                    };
                } forEach _classActions;

                // Limit the amount of objects the player can interact with
                if (_numInteractions > 0) then {
                    _numInteractObjects = _numInteractObjects + 1;
                };
            };
        };
        if (_numInteractObjects >= MAXINTERACTOBJECTS) exitWith {};

    } forEach _nearestObjects;
};

_fnc_renderLastFrameActions = {
    {
        _x call FUNC(renderBaseMenu);
    } forEach GVAR(foundActions);
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
    
    _pos = if !(GVAR(useCursorMenu)) then {
        _virtualPoint = (((positionCameraToWorld [0, 0, 0]) call EFUNC(common,positionToASL)) vectorAdd GVAR(selfMenuOffset)) call EFUNC(common,ASLToPosition);
        _wavesAtOrigin = [(positionCameraToWorld [0, 0, 0])] call EFUNC(common,waveHeightAt);
        _wavesAtVirtualPoint = [_virtualPoint] call EFUNC(common,waveHeightAt);
        _virtualPoint set [2, ((_virtualPoint select 2) - _wavesAtOrigin + _wavesAtVirtualPoint)];
        _virtualPoint
    } else {
        [0.5, 0.5]
    };
    
    {
        _action = _x;
        [_target, _action, _pos] call FUNC(renderBaseMenu);
    } forEach _classActions;
};


// Render nearby actions, unit self actions or vehicle self actions as appropiate
if (GVAR(openedMenuType) == 0) then {

    if (vehicle ACE_player == ACE_player) then {
        if (diag_tickTime > GVAR(lastTimeSearchedActions) + 0.20) then {
            // Once every 0.2 secs, collect nearby objects active and visible action points and render them
            call _fnc_renderNearbyActions;
        } else {
            // The rest of the frames just draw the same action points rendered the last frame
            call _fnc_renderLastFrameActions;
        };
    } else {
        (vehicle ACE_player) call _fnc_renderSelfActions;
    };

} else {
    ACE_player call _fnc_renderSelfActions;
};
