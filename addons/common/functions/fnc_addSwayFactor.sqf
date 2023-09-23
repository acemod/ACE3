#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Adds a factor to player sway calculation
 *
 * Arguments:
 * 0: Type of factor, "baseline" or "multiplier" <STRING>
 * 1: Factor function, must return number <CODE>
 * 2: Factor ID, unique to type <STRING>
 *
 * Return Value:
 * Factor added <BOOLEAN>
 *
 * Example:
 * ["baseline", {1}, "ace_common"] call ace_common_fnc_addSwayFactor
 *
 * Public: Yes
*/
params ["_type", "_code", "_id"];

_type = toLower _type;

if !(_type in ["baseline", "multiplier"]) exitWith { ERROR_2("%1-%2 type unsupported",_type,_id); false };

if !((call _code) isEqualType 0) exitWith { ERROR_2("%1-%2 bad return type",_type,_id); false };

[missionNamespace, format ["ACE_setCustomAimCoef_%1", _type], _id, _code] call FUNC(arithmeticSetSource);

if (_type isEqualTo "baseline") then {
    GVAR(swayFactorsBaseline) pushBackUnique [_id];
} else {
    GVAR(swayFactorsMultiplier) pushBackUnique [_id];
};

true
