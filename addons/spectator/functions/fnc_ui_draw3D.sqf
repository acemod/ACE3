/*
 * Author: Nelson Duarte, AACO, SilentSpike
 * Function used to draw the 3D icons and track the cursor object
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * addMissionEventHandler ["Draw3D", {call ace_spectator_fnc_ui_draw3D}]
 *
 * Public: No
 */

#include "script_component.hpp"
#define HEIGHT_OFFSET 1.5

BEGIN_COUNTER(updateCursor);
private _camTarget = GVAR(camTarget);
private _cursorObject = objNull;

// This function doesn't work for units underwater, due to use of screenToWorld. Would be complicated to work around this.
private _intersections = [getMousePosition select 0, getMousePosition select 1, _camTarget, vehicle _camTarget] call BIS_fnc_getIntersectionsUnderCursor;

if !(_intersections isEqualTo []) then {
    _cursorObject = (_intersections select 0) select 3;
};

if !(_cursorObject isKindOf "Man") then {
    _cursorObject = effectiveCommander _cursorObject;
};

GVAR(cursorObject) = _cursorObject;
END_COUNTER(updateCursor);

if !(GVAR(uiMapVisible)) then {
    if (GVAR(drawUnits)) then {
        BEGIN_COUNTER(drawTags);
        // Groups and Units
        {
            _x params ["_unit", "_type", "_icon"];
            private _position = (_unit modelToWorldVisual (_unit selectionPosition "Head")) vectorAdd [0,0,HEIGHT_OFFSET];

            if (_type == 2 && { _unit distanceSqr GVAR(camera) < DISTANCE_NAMES_SQR } && {_unit in _camTarget || _unit in _cursorObject}) then {
                drawIcon3D [
                    ICON_BACKGROUND_UNIT,
                    [0, 0, 0, [0.4, 0.8] select (_unit in _camTarget)],
                    _position,
                    5,
                    4,
                    0,
                    "",
                    0,
                    0.035,
                    "PuristaMedium",
                    "center"
                ];
            };

            // Apply modifiers
            if (_type == 1 && { time <= GETVAR(_unit,GVAR(highlightTime),0) }) then {
                _icon set [1, [1,1,1, ((_icon select 1) select 3)]];
            };
            _icon set [2, _position];

            // Draw icon
            drawIcon3D _icon;

            nil // Speed loop
        } count GVAR(iconsToDraw);

        // Draw locations
        {
            _x params ["_pos", "_name", "_texture"];

            if (_pos isEqualType objNull) then {
                _pos = (_pos modelToWorldVisual (_pos selectionPosition "Head")) vectorAdd [0,0,2*HEIGHT_OFFSET];
            };

            drawIcon3D [_texture, [1,1,1,0.4], _pos, 0.8, 0.8, 0, _name];

            nil // Speed loop
        } count (GVAR(locationsToDraw));
        END_COUNTER(drawTags);
    };

    // Draw projectiles and grenades paths
    if (GVAR(drawProjectiles)) then {
        BEGIN_COUNTER(drawTracers);
        private _projectilesNew = [];
        private _grenadesNew = [];

        // Draw projectiles if there are any
        {
            _x params [
                ["_projectile", objNull, [objNull]],
                ["_segments", [], [[]]]
            ];

            if !(isNull _projectile) then {
                // Store new segment
                private _newestIndex = _segments pushBack [
                    getPosVisual _projectile,
                    (vectorMagnitude velocity _projectile) call {
                        if (_this < 250) exitWith { [0,0,1,1] };
                        if (_this < 500) exitWith { [0,1,0,1] };
                        [1,0,0,1]
                    }
                ];

                // Clamp number of segments to be drawn
                if (_newestIndex > MAX_PROJECTILE_SEGMENTS) then {
                    _segments deleteAt 0;
                    DEC(_newestIndex);
                };

                // Store projectiles for next frame
                _projectilesNew pushBack [_projectile, _segments];

                // Draw all projectile segments
                private _oldLoc = [];
                {
                    _x params ["_locNew", "_colorNew"];
                    if !(_oldLoc isEqualTo []) then {
                        drawLine3D [_oldLoc, _locNew, _colorNew];
                    };
                    _oldLoc = _locNew;

                    nil // Speed loop
                } count _segments;
            };

            nil // Speed loop
        } count GVAR(projectilesToDraw);
        GVAR(projectilesToDraw) = _projectilesNew;

        {
            if !(isNull _x) then {
                private _grenadeVelocityMagnitude = vectorMagnitude velocity _x;

                // Draw grenade (rotate icon to represent spinning)
                drawIcon3D [ICON_GRENADE, [1,0,0,1], getPosVisual _x, 0.6, 0.6, if (_grenadeVelocityMagnitude > 0) then { time * 100 * _grenadeVelocityMagnitude } else { 0 }, "", 0, 0.05, "TahomaB"];

                // Store grenade for next frame
                _grenadesNew pushBack _x;
            };

            nil // Speed loop
        } count GVAR(grenadesToDraw);

        GVAR(grenadesToDraw) = _grenadesNew;
        END_COUNTER(drawTracers);
    };
};
