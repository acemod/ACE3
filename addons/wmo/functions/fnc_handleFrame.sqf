#include "..\script_component.hpp"
/*
 * Author: Bloodwyn, LinkIsGrim
 * Keeps the unit glued to whatever it is standing on. Runs every frame, because the
 * transformation has to track the anchor's movement without a visible gap.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_wmo_fnc_handleFrame
 *
 * Public: No
 */

if (!alive ACE_player || {!isNull objectParent ACE_player}) exitWith {
    if (!isNull GVAR(anchor)) then {call FUNC(detach)};
};

private _unit = ACE_player;
private _posWorld = getPosWorld _unit;

// Cheap gate: on flat terrain the feet sit at terrain level, so there is nothing to
// anchor to and the probe below can be skipped. Buildings and rocks are false
// positives, which only costs the probe we would have run anyway.
if (isNull GVAR(anchor) && {(getPosATL _unit select 2) < GROUND_SNAP_HEIGHT}) exitWith {};

private _hits = lineIntersectsSurfaces [
    _posWorld vectorAdd [0, 0, SEARCH_HEIGHT],
    _posWorld vectorAdd [0, 0, SEARCH_DEPTH],
    _unit,
    GVAR(roadwayHelper),
    true,
    -1,
    "GEOM",
    "VIEW"
] select {!isNull (_x select 3)};

if (_hits isEqualTo []) exitWith {
    if (!isNull GVAR(anchor)) then {[true] call FUNC(detach)};
    GVAR(roadwayHelper) setPos [0, 0, 0];
};

(_hits select 0) params ["_hitPos", "_hitNormal", "_hitObject"];

if !([_hitObject] call FUNC(hasRoadway)) exitWith {
    call FUNC(detach);
    GVAR(roadwayHelper) setPos [0, 0, 0];
};

// Float the helper above the hit point proportionally to how fast the anchor is
// coming up at the unit, so a fast vehicle does not pass through it between frames.
private _helperPos = _hitPos;

if (!isNull GVAR(anchor)) then {
    private _closing = 0 max (_hitNormal vectorDotProduct (velocity GVAR(anchor)));
    _helperPos = _hitPos vectorAdd (_hitNormal vectorMultiply (_closing * HELPER_OFFSET_SCALE + HELPER_OFFSET_BASE));
};

GVAR(roadwayHelper) setPosASL _helperPos;
GVAR(roadwayHelper) setVectorUp [0, 0, 1];

private _anchor = [_hitObject] call FUNC(getAnchorParent);

if (_anchor isNotEqualTo GVAR(anchor)) exitWith {
    // Standing on something new. Release the old anchor before taking the new one.
    if (!isNull GVAR(anchor)) then {call FUNC(detach)};

    if !([_anchor] call FUNC(isWalkable)) exitWith {};

    GVAR(anchor) = _anchor;

    if (isMultiplayer && {!local _anchor}) then {
        [_unit, _anchor] remoteExecCall ["disableCollisionWith", _anchor];
    };

    [_anchor, false] call FUNC(setCollision);
    GVAR(collisionEnabled) = false;

    GVAR(prevOffset) = _anchor worldToModelVisual ([getPosASLW _unit, getPosATL _unit] select (getTerrainHeightASL _posWorld > 0));
    GVAR(prevPos) = _posWorld;
    GVAR(prevDir) = getDir _anchor;

    [QGVAR(anchored), [_unit, _anchor]] call CBA_fnc_localEvent;
};

// Still on the same anchor. Move the unit by however far the anchor moved.
private _target = _posWorld vectorAdd ((_anchor modelToWorldVisualWorld GVAR(prevOffset)) vectorDiff GVAR(prevPos));

private _velocity = velocity _unit;
_velocity set [2, 0];

// During a vault the feet are not where the probe expects, so probe from the eyes.
private _probeFrom = eyePos _unit;

if !((animationState _unit) in VAULT_ANIMATIONS) then {
    _probeFrom = _posWorld vectorAdd [0, 0, SEARCH_HEIGHT];
};

// Fan three rays around the movement vector, plus one straight ahead from the eyes,
// to catch walls and superstructure before being pushed into them.
private _obstructions = (lineIntersectsSurfaces [_probeFrom, _probeFrom vectorAdd _velocity, _unit, objNull, true, 1, "GEOM"])
    + (lineIntersectsSurfaces [_probeFrom, _probeFrom vectorAdd ([_velocity, -COLLISION_PROBE_ANGLE] call BIS_fnc_rotateVector2D), _unit, objNull, true, 1, "GEOM"])
    + (lineIntersectsSurfaces [_probeFrom, _probeFrom vectorAdd ([_velocity, COLLISION_PROBE_ANGLE] call BIS_fnc_rotateVector2D), _unit, objNull, true, 1, "GEOM"])
    + (lineIntersectsSurfaces [eyePos _unit, (eyePos _unit) vectorAdd _velocity, _unit, objNull, true, 1, "GEOM"]);

private _blocked = _obstructions findIf {
    !isNull (_x select 2)
    && {(_x select 0) distance _probeFrom < COLLISION_DISTANCE}
    && {((_x select 1) select 2) < COLLISION_NORMAL_MAX}
} > -1;

if (_blocked) then {
    // Ladders are walked through deliberately, so they must not block.
    private _toCentre = (_anchor worldToModelVisual _posWorld) select 0;
    private _inward = _anchor vectorModelToWorld [-_toCentre, 0, 0];

    private _ladderAhead = ([_anchor, "GEOM"] intersect [_probeFrom, _probeFrom vectorAdd _velocity]) findIf {(_x select 0) find "ladder_" > -1};
    private _ladderInward = ([_anchor, "GEOM"] intersect [_probeFrom, _probeFrom vectorAdd _inward]) findIf {(_x select 0) find "ladder_" > -1};

    if (_ladderAhead isEqualTo -1 && {_ladderInward isEqualTo -1}) then {
        _target = _target vectorAdd (_velocity vectorMultiply COLLISION_PUSHBACK);
    };
};

// Snap down onto the surface if close, otherwise let the unit fall towards it.
private _surfaceHeight = _helperPos select 2;

if ((_target select 2) - _surfaceHeight < GROUND_SNAP_HEIGHT) then {
    _target set [2, _surfaceHeight + GROUND_SNAP_OFFSET];
} else {
    _target set [2, (_target select 2) - FALL_SPEED / diag_fps];
};

private _dir = (getDir _unit) - (GVAR(prevDir) - getDir _anchor);

if (vectorMagnitude (velocity _anchor) < SMOOTH_SPEED_LIMIT) then {
    // Interpolated, which looks smoother to other players.
    _unit setVelocityTransformation [
        _target, _target,
        [0, 0, 0], [0, 0, ANCHOR_VELOCITY_Z],
        vectorDir _unit, [sin _dir, cos _dir, 0],
        [0, 0, 1], [0, 0, 1],
        1
    ];
} else {
    // Too fast to interpolate without drifting, so place the unit outright.
    _unit setPosWorld _target;
    _unit setDir _dir;
    _unit setVelocity [0, 0, ANCHOR_VELOCITY_Z];
};

GVAR(prevOffset) = _anchor worldToModelVisual ([getPosASLW _unit, getPosATL _unit] select (getTerrainHeightASL _posWorld > 0));
GVAR(prevPos) = _target;
GVAR(prevDir) = getDir _anchor;
