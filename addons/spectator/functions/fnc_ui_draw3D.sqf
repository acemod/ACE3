/*
 * Author: Nelson Duarte, AACO, SilentSpike
 * Function used to draw the 3D icons and track the cursor object
 *
 * Public: No
 */

#include "script_component.hpp"
#define HEIGHT_OFFSET 1.5
#define GRENADE_ICON "A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_connect_ca.paa"
#define ICON_BACKGROUND_UNIT "a3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\UnitName_ca.paa"

BEGIN_COUNTER(updateCursor);
private _camTarget = GVAR(camTarget);
private _cursorObject = objNull;

// TODO: This function doesn't work for units underwater, perhaps a solution can be found
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

            if (_type == 2 && { _unit distance GVAR(camera) < DISTANCE_NAMES } && {_unit in _camTarget || _unit in _cursorObject}) then {
                drawIcon3D [
                    ICON_BACKGROUND_UNIT,
                    [0, 0, 0, [0.4, 0.8] select (_unit in _camTarget)],
                    _position,
                    5.0,
                    4,
                    0.0,
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
        } count GVAR(thingsToDraw);
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

                // Store projectiles for next frame
                _projectilesNew pushBack [_projectile, _segments];
            };

            nil // Speed loop
        } count GVAR(projectiles);
        GVAR(projectiles) = _projectilesNew;

        {
            if !(isNull _x) then {
                private _grenadeVelocityMagnitude = vectorMagnitude velocity _x;

                // Draw grenade (rotate icon to represent spinning)
                drawIcon3D [GRENADE_ICON, [1,0,0,1], getPosVisual _x, 0.6, 0.6, if (_grenadeVelocityMagnitude > 0) then { time * 100 * _grenadeVelocityMagnitude } else { 0 }, "", 0, 0.05, "TahomaB"];

                // Store grenade for next frame
                _grenadesNew pushBack _x;
            };

            nil // Speed loop
        } count GVAR(grenades);

        GVAR(grenades) = _grenadesNew;
        END_COUNTER(drawTracers);
    };
};
