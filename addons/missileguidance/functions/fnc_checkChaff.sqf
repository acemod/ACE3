#include "..\script_component.hpp"
/*
 * Author: Snow(Dryden)
 * Whether chaff takes a Doppler radar off its target. Each radar countermeasure in the radar's resolution cell around
 * the target has RADAR_CHAFF_CHANCE, times the missile's chaff effectiveness and the chaff effectiveness setting, of
 * being taken for it. The cell reaches RADAR_CHAFF_RANGE_GATE either side of the target's range, and across the beam
 * RADAR_CHAFF_SEEKER_BEAM for a missile seeker or RADAR_BEAM_HALF_ANGLE for a launcher's radar, never less than
 * RADAR_CHAFF_CELL. Chaff all but stops, so the chance is full while the target is no faster along the line of sight
 * than the Doppler filter, falling to none at RADAR_CHAFF_DOPPLER_LIMIT. A missile seeker must have it in its cone and
 * in sight.
 * For debugging it can instead draw the chaff without rolling: green with a chance, red without.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Radar: the projectile, or the launcher guiding it <OBJECT>
 * 2: Minimum speed for Doppler return to filter out <NUMBER>
 * 3: Seeker angle, or -1 for a launcher's radar <NUMBER> (default: -1)
 * 4: Only draw the chaff <BOOL> (default: false)
 * 5: Chaff effectiveness of the missile, 0 is immune <NUMBER> (default: 0.5)
 *
 * Return Value:
 * The chaff taken for the target, or objNull <OBJECT>
 *
 * Example:
 * [cursorTarget, _projectile, 5, 50, false, 0.5] call ace_missileguidance_fnc_checkChaff
 *
 * Public: No
 */

params ["_target", "_radar", "_minimumSpeed", ["_seekerAngle", -1], ["_drawOnly", false], ["_chaffEffectiveness", 0.5]];

if (isNull _target || {isNull _radar}) exitWith {objNull};

private _radarPos = getPosASLVisual _radar;
private _targetPos = getPosASLVisual _target;
private _range = _radarPos vectorDistance _targetPos;
private _lineOfSight = _radarPos vectorFromTo _targetPos;
private _radialSpeed = abs ((velocity _target) vectorDotProduct _lineOfSight);
private _chance = RADAR_CHAFF_CHANCE * _chaffEffectiveness * GVAR(chaffEffectivenessCoef) * linearConversion [_minimumSpeed, RADAR_CHAFF_DOPPLER_LIMIT max (_minimumSpeed + 1), _radialSpeed, 1, 0, true];
if (_chance <= 0 && {!_drawOnly}) exitWith {objNull};

// how far across the beam the radar's resolution cell reaches at the target
private _crossGate = RADAR_CHAFF_CELL max (_range * tan ([RADAR_CHAFF_SEEKER_BEAM, RADAR_BEAM_HALF_ANGLE] select (_seekerAngle < 0)));

private _chaff = objNull;
{
    private _type = typeOf _x;
    private _isChaff = GVAR(chaffTypes) getOrDefaultCall [_type, {
        private _config = configFile >> "CfgAmmo" >> _type;
        // 8 = radar blocking
        isClass _config && {getText (_config >> "simulation") == "shotCM"} && {([getNumber (_config >> "weaponLockSystem"), 4] call EFUNC(common,binarizeNumber)) select 3}
    }, true];
    if (!_isChaff) then { continue };
    private _chaffPos = getPosASLVisual _x;
    private _relativePos = _chaffPos vectorDiff _radarPos;
    private _offAxis = vectorMagnitude (_relativePos vectorDiff (_lineOfSight vectorMultiply (_relativePos vectorDotProduct _lineOfSight)));
    private _considered = _chance > 0 && {abs ((vectorMagnitude _relativePos) - _range) < RADAR_CHAFF_RANGE_GATE} && {_offAxis < _crossGate} && {_seekerAngle < 0 || {
        [_radar, _chaffPos, _seekerAngle] call FUNC(checkSeekerAngle) && {[_radar, _x, false] call FUNC(checkLos)}
    }};
    if (_drawOnly) then {
        drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [[1, 0, 0, 1], [0, 1, 0, 1]] select _considered, ASLToAGL _chaffPos, 0.75, 0.75, 0, "C", 1, 0.025, "TahomaB"];
        continue;
    };
    if (!_considered) then { continue };
    if (random 1 < _chance) exitWith {
        _chaff = _x;
    };
} forEach (_target nearObjects ["Default", RADAR_CHAFF_RANGE_GATE + _crossGate]);

TRACE_3("chaff",_target,_chance,_chaff);
_chaff
