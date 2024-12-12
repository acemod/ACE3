#include "..\script_component.hpp"
/*
 * Author: NouberNou and esteldunedain
 * Render all action points
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ACE_interact_menu_fnc_renderActionPoints
 *
 * Public: No
 */

GVAR(currentOptions) = [];

private _player = ACE_player;

GVAR(cameraPosASL) = AGLToASL (positionCameraToWorld [0, 0, 0]);
GVAR(cameraDir) = (AGLToASL (positionCameraToWorld [0, 0, 1])) vectorDiff GVAR(cameraPosASL);

private _fnc_renderNearbyActions = {
    // Render all nearby interaction menus
    #define MAXINTERACTOBJECTS 3

    GVAR(foundActions) = [];
    GVAR(lastTimeSearchedActions) = diag_tickTime;

    QGVAR(renderNearbyActions) call CBA_fnc_localEvent;

    private _numInteractObjects = 0;
    private _nearestObjects = nearestObjects [ACE_player, ["All"], 13];
    {
        private _target = _x;

        // Quick oclussion test. Skip objects more than 1 m behind the camera plane
        private _lambda = getPosASL _target vectorDiff GVAR(cameraPosASL) vectorDotProduct GVAR(cameraDir);
        if (
            _lambda <= -1
            || {isObjectHidden _target}
            // Prevent interacting with yourself or your own vehicle
            || {_target in [ACE_player, vehicle ACE_player]}
        ) then {continue};

        private _hasInteractions = false;

        // Iterate through object actions, find base level actions and render them if appropiate
        GVAR(objectActionList) = _target getVariable [QGVAR(actions), []];
        {
            // Only render them directly if they are base level actions
            if (_x select 1 isNotEqualTo []) then {continue};
            // Try to render the menu
            private _action = _x;
            if ([_target, _action] call FUNC(renderBaseMenu)) then {
                _hasInteractions = true;
                GVAR(foundActions) pushBack [_target, _action, GVAR(objectActionList)];
            };
        } forEach GVAR(objectActionList);

        // Iterate through base level class actions and render them if appropiate
        private _classActions = GVAR(ActNamespace) getOrDefault [typeOf _target, []];
        {
            private _action = _x;
            // Try to render the menu
            if ([_target, _action] call FUNC(renderBaseMenu)) then {
                _hasInteractions = true;
                GVAR(foundActions) pushBack [_target, _action, GVAR(objectActionList)];
            };
        } forEach _classActions;

        // Limit the amount of objects the player can interact with
        if (_hasInteractions) then {
            INC(_numInteractObjects);
            if (_numInteractObjects >= MAXINTERACTOBJECTS) then {break};
        };
    } forEach _nearestObjects;
};

private _fnc_renderLastFrameActions = {
    {
        _x params ["_target", "_action", "_objectActionList"];

        GVAR(objectActionList) = _objectActionList;
        [_target, _action] call FUNC(renderBaseMenu);
    } forEach GVAR(foundActions);
};

private _fnc_renderSelfActions = {
    private _target = _this;

    // Set object actions for collectActiveActionTree
    GVAR(objectActionList) = _target getVariable [QGVAR(selfActions), []];

    // Iterate through base level class actions and render them if appropiate
    private _classActions = GVAR(ActSelfNamespace) get typeOf _target;

    private _pos = if (GVAR(useCursorMenu)) then {
        [0.5, 0.5]
    } else {
        //Convert to ASL, add offset and then convert back to AGL (handles waves when over water)
        ASLToAGL ((AGLToASL (positionCameraToWorld [0, 0, 0])) vectorAdd GVAR(selfMenuOffset));
    };

    {
        private _action = _x;
        [_target, _action, _pos] call FUNC(renderBaseMenu);
    } forEach _classActions;
};

private _fnc_renderZeusActions = {
    {
        private _action = _x;
        [_this, _action, [0.5, 0.5]] call FUNC(renderBaseMenu);
    } forEach GVAR(ZeusActions);
};


GVAR(collectedActionPoints) resize 0;

// Render nearby actions, unit self actions or vehicle self actions as appropiate
if (GVAR(openedMenuType) == 0) then {
    if (isNull curatorCamera) then {
        if (isNull (ACE_controlledUAV select 0)) then {
            if (vehicle ACE_player == ACE_player) then {
                if (diag_tickTime > GVAR(lastTimeSearchedActions) + 0.20) then {
                    // Once every 0.2 secs, collect nearby objects active and visible action points and render them
                    call _fnc_renderNearbyActions;
                } else {
                    // The rest of the frames just draw the same action points rendered the last frame
                    call _fnc_renderLastFrameActions;
                };
            } else {
                // Render vehicle self actions when in vehicle
                (vehicle ACE_player) call _fnc_renderSelfActions;
            };
        } else {
            // Render UAV self actions when in control of UAV AI
            (ACE_controlledUAV select 0) call _fnc_renderSelfActions;

        };
    } else {
        // Render zeus actions when zeus open
        (getAssignedCuratorLogic player) call _fnc_renderZeusActions;
    };
} else {
    ACE_player call _fnc_renderSelfActions;
};

if (count GVAR(collectedActionPoints) > 1) then {
    // Do the oclusion pass

    // Order action points according to z
    GVAR(collectedActionPoints) sort true;

    for [{private _i = count GVAR(collectedActionPoints) - 1}, {_i > 0}, {_i = _i - 1}] do {
        for [{private _j = _i - 1}, {_j >= 0}, {_j = _j - 1}] do {
            // Check if action point _i is ocluded by _j
            private _delta = vectorNormalized ((GVAR(collectedActionPoints) select _i select 1) vectorDiff (GVAR(collectedActionPoints) select _j select 1));

            // If _i is inside a cone with 20º half angle with origin on _j
            if ((_delta select 2 > 0.94) && {((GVAR(collectedActionPoints) select _i select 1) distance2D (GVAR(collectedActionPoints) select _j select 1)) < 0.1}) exitWith {
                GVAR(collectedActionPoints) deleteAt _i;
            };
        };
    };
};

// Render the non-ocluded points
{
    _x params ["_z", "_sPos", "_activeActionTree"];
    [[], _activeActionTree, _sPos, [180,360]] call FUNC(renderMenu);
} forEach GVAR(collectedActionPoints);
