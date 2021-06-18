#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Manually triggers punji trap damage.
 *
 * Arguments:
 * 0: Punji trap <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [trap] call ace_compat_sog_fnc_handlePunjiTrapDamage
 *
 * Public: No
 */
params ["_trap"];

if (isNull (configFile >> "CfgPatches" >> "ace_medical")) exitWith {};

private _radius = getNumber (configOf _trap >> "indirectHitRange");
private _affectedUnits = (_trap nearEntities ["CAManBase", _radius]) select {local _x};
(getShotParents _trap) params ["", "_instigator"];

if (_affectedUnits isEqualTo []) exitWith {};

private _bodyParts = [];
private _stabCount = 0;

switch (typeOf _trap select [0, 16]) do {
    // Large trap
    case "vn_mine_punji_01": {
        _bodyParts = ["LeftLeg", "RightLeg", "Body"];
        _stabCount = random [7, 10, 13];
    };
    // Small trap
    case "vn_mine_punji_02": {
        _bodyParts = ["LeftLeg", "RightLeg"];
        _stabCount = random [3, 5, 7];
    };
    // Whip trap
    case "vn_mine_punji_03": {
        _bodyParts = ["LeftLeg", "RightLeg", "Body"];
        _stabCount = random [3, 5, 7];
    };
};

{
    for "_i" from 0 to _stabCount do {
        [_x, random [1, 2, 3], selectRandom _bodyParts, "stab", _instigator] call EFUNC(medical,addDamageToUnit);
    };
} forEach _affectedUnits;
