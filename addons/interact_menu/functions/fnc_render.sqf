/*
 * Author: NouberNou and esteldunedain
 * Render all available nearby interactions
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

BEGIN_COUNTER(fnc_render);

private _foundTarget = false;

if (GVAR(openedMenuType) >= 0) then {
    BEGIN_COUNTER(fnc_renderMenuOpen);

    private _cursorPos2 = positionCameraToWorld [0, 0, 2];

    // Render all available nearby interactions
    call FUNC(renderActionPoints);

    // Draw the red selector only when there's no cursor
    if !(uiNamespace getVariable [QGVAR(cursorMenuOpened),false]) then {
        [[0.5,0.5], "\a3\ui_f\data\IGUI\Cfg\Cursors\selected_ca.paa"] call FUNC(renderSelector);
    };

    private _cursorScreenPos = [worldToScreen _cursorPos2, GVAR(cursorPos)] select (uiNamespace getVariable [QGVAR(cursorMenuOpened),false]);

    private _closestDistance = 1000000;
    private _closestSelection = -1;
    {
        _x params ["", "_sPos"];
        private _distanceFromCursor = _cursorScreenPos distance2d _sPos;
        if ((_distanceFromCursor < 0.1118) && {_distanceFromCursor < _closestDistance}) then {
            _closestDistance = _distanceFromCursor;
            _closestSelection = _forEachIndex;
        };
    } forEach GVAR(currentOptions);

    if(_closestSelection == -1) exitWith {};

    private _closest = GVAR(currentOptions) select _closestSelection;
    _closest params ["_action", "_sPos", "_hoverPath"];

    private _cTime = ACE_diagTime;
    private _delta = _cTime - GVAR(lastTime);
    GVAR(lastTime) = _cTime;

    GVAR(rotationAngle) = (GVAR(rotationAngle) + (270*_delta)) mod 360;
    [_sPos, format [QUOTE(PATHTOF(ui\selector%1.paa)), floor (((abs GVAR(rotationAngle)) mod 90) / 6)]] call FUNC(renderSelector);

    _foundTarget = true;
    GVAR(actionSelected) = true;
    GVAR(selectedAction) = _action select 1;
    GVAR(selectedTarget) = (GVAR(selectedAction)) select 2;

    private _misMatch = !(GVAR(lastPath) isEqualTo _hoverPath);

    if(_misMatch && {ACE_diagTime-GVAR(expandedTime) > linearConversion [0, 2, GVAR(menuAnimationSpeed), 0.25, 0.08333333]}) then {
        GVAR(startHoverTime) = ACE_diagTime;
        GVAR(lastPath) = _hoverPath;
        GVAR(expanded) = false;
    } else {
        if(!GVAR(expanded) && {ACE_diagTime-GVAR(startHoverTime) > linearConversion [0, 2, GVAR(menuAnimationSpeed), 0.25, 0.08333333]}) then {
            GVAR(expanded) = true;

            // Start the expanding menu animation only if the user is not going up the menu
            if !([GVAR(menuDepthPath),GVAR(lastPath)] call FUNC(isSubPath)) then {
                GVAR(expandedTime) = ACE_diagTime;
            };
            GVAR(menuDepthPath) = +GVAR(lastPath);

            // Execute the current action if it's run on hover
            private _tmp = ((GVAR(selectedAction) select 0) select 9) select 3;
            private _runOnHover = true;
            if ((typeName _tmp) == "CODE" ) then {
                _runOnHover = call _tmp;
            } else {
                if ((typeName _tmp) == "BOOL" ) then {
                    _runOnHover = _tmp;
                } else {
                    _runOnHover = _tmp > 0;
                };
            };
            if (_runOnHover) then {
                this = GVAR(selectedTarget);
                private _player = ACE_Player;
                private _target = GVAR(selectedTarget);

                // Clear the conditions caches
                ["clearConditionCaches", []] call EFUNC(common,localEvent);

                // Check the action conditions
                private _actionData = GVAR(selectedAction) select 0;
                if ([_target, _player, _actionData select 6] call (_actionData select 4)) then {
                    // Call the statement
                    [_target, _player, _actionData select 6] call (_actionData select 3);

                    // Clear the conditions caches again if the action was performed
                    ["clearConditionCaches", []] call EFUNC(common,localEvent);
                };
            };
        };
    };
    END_COUNTER(fnc_renderMenuOpen);
};

if(!_foundTarget && GVAR(actionSelected)) then {
    GVAR(actionSelected) = false;
    GVAR(expanded) = false;
    GVAR(lastPath) = [];
};
for "_i" from GVAR(iconCount) to (count GVAR(iconCtrls))-1 do {
    ctrlDelete (GVAR(iconCtrls) select _i);
    GVAR(ParsedTextCached) set [_i, ""];
};
GVAR(iconCtrls) resize GVAR(iconCount);
GVAR(iconCount) = 0;

END_COUNTER(fnc_render);
