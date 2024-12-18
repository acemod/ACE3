#include "..\script_component.hpp"
/*
 * Author: Cplhardcore
 * Custom wound handler for explosions
 *
 * Arguments:
 * 0: Unit That Was Hit <OBJECT>
 * 1: Damage done to each body part <ARRAY>
 * 2: Type of the damage done <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, [[0.5, "#structural", 1.5]], "vehiclehit"] call ace_medical_damage_fnc_woundsHandlerExplosion
 *
 * Public: No
 */
params ["_unit", "_allDamages", "_typeOfDamage"];
TRACE_3("woundsHandlerExplosion",_unit,_allDamages,_typeOfDamage);

// damage can sometimes be negative (why?)
// damage to structural is low unless it's a very large explosion, in which case it is typically >= 1
private _damageToApply = (abs (_allDamages select 0 select 0));
private _damageMap = createHashMap;
private _allBodyParts = ALL_BODY_PARTS; // micro-optimization here and above, don't recreate this array every time

// use a hashmap so we only create one entry in _newDamages per body part
{
    private _damageData = _x;
    _damageData params ["_engineDamage", "_bodyPart", "_realDamage"];
    switch (true) do {
    case (_bodyPart isEqualTo "LeftArm"): {
        _damageMap set ["LeftArm", _damageToApply * 0.5];
        _damageMap set ["UpperLeftArm", _damageToApply * 0.5];
    };
    case (_bodyPart isEqualTo "RightArm"): {
        _damageMap set ["RightArm", _damageToApply * 0.5];
        _damageMap set ["UpperRightArm", _damageToApply * 0.5];
    };
    case (_bodyPart isEqualTo "LeftLeg"): {
        _damageMap set ["LeftLeg", _damageToApply * 0.5];
        _damageMap set ["UpperLeftLeg", _damageToApply * 0.5];
    };
    case (_bodyPart isEqualTo "RightLeg"): {
        _damageMap set ["RightLeg", _damageToApply * 0.5];
        _damageMap set ["UpperRightLeg",_damageToApply * 0.5];
    };
    default {
        _damageMap set [_bodyPart, _damageToApply];
    };
    TRACE_1("Explosion Damage Map handled, passing damage",_damageMap);
};
    
} forEach _allDamages;

private _newDamages = [];
{
    _newDamages pushBack [_damageMap get _x, _x, _damageToApply];
} forEach (keys _damageMap); // micro-optimization again, two 'get's is still faster than iterating over a hashmap

TRACE_1("Explosion handled, passing damage",_newDamages);
[_unit, _newDamages, _typeOfDamage] //return
