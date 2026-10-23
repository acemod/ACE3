#include "..\script_component.hpp"
/*
 * Author: Yethe Samartaka
 * Queues a wound event for a dead unit, to be raised over the next frames (see QEGVAR(medical,deadUnitDamage)).
 * Bodies handled less than DEAD_UNIT_QUEUE_INTERVAL seconds ago wait for that time to be over.
 * Hits with the same ammo are combined while they wait, if their damage type wounds every damaged body part.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Damage done to each body part <ARRAY>
 * 2: Shooter <OBJECT>
 * 3: Ammo classname or damage type <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, [[0.5, "Body", 1]], player, "G_40mm_HE"] call ace_medical_engine_fnc_queueDeadUnitDamage
 *
 * Public: No
 */

params ["_unit", "_allDamages", "_shooter", "_ammo"];
TRACE_4("queueDeadUnitDamage",_unit,_allDamages,_shooter,_ammo);

private _queued = _unit getVariable QGVAR(queuedDamage);

if (isNil "_queued") then {
    _queued = [];
    _unit setVariable [QGVAR(queuedDamage), _queued];

    // Bodies can be hit again and again (e.g. by every explosion near them), so further hits wait and are combined
    if (CBA_missionTime < _unit getVariable [QGVAR(queueWaitUntil), -1]) then {
        _unit setVariable [QGVAR(queuedDamageWaiting), true];
    } else {
        GVAR(deadUnitQueue) pushBack _unit;
    };

    if (GVAR(deadUnitQueuePFH) == -1) then {
        GVAR(deadUnitQueuePFH) = [LINKFUNC(processDeadUnitDamage), 0] call CBA_fnc_addPerFrameHandler;
    };
};

// Combining only changes how the damage is split into wounds when every damaged body part gets wounded (e.g. explosives)
// Other damage types only wound the most damaged body part (e.g. bullets), so combining would lose wounds
private _index = _queued findIf {(_x select 3) == _ammo};
if (_index == -1 || {
    private _typeOfDamage = _ammo call EFUNC(medical_damage,getTypeOfDamage);
    (EGVAR(medical_damage,damageTypeDetails) getOrDefault [_typeOfDamage, [[], 1]]) select 1 > 0
}) exitWith {
    _queued pushBack [_unit, _allDamages, _shooter, _ammo];
};

private _event = _queued select _index;
private _combined = _event select 1;
{
    _x params ["_damage", "_bodyPart", "_realDamage"];
    private _bodyPartIndex = _combined findIf {(_x select 1) == _bodyPart};
    if (_bodyPartIndex == -1) then {
        _combined pushBack [_damage, _bodyPart, _realDamage];
    } else {
        (_combined select _bodyPartIndex) params ["_combinedDamage", "", "_combinedRealDamage"];
        _combined set [_bodyPartIndex, [_combinedDamage + _damage, _bodyPart, _combinedRealDamage + _realDamage]];
    };
} forEach _allDamages;

// Keep the most damaged body part first, like handleDamage does
_combined = _combined apply {[_x select 2, _x select 0, _x select 1]};
_combined sort false;
_event set [1, _combined apply {[_x select 1, _x select 2, _x select 0]}];
_event set [2, _shooter];
