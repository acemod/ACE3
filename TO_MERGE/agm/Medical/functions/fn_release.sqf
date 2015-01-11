/*
 * Author: KoffeinFlummi
 *
 * Releases the given unit.
 *
 * Argument:
 * 0: Unit to be released (Object)
 *
 * Return value:
 * none
 */

#define ANIM_DRAG ["amovpercmstpslowwrfldnon_acinpknlmwlkslowwrfldb_2", "amovpercmstpsraswpstdnon_acinpknlmwlksnonwpstdb_2", "amovpercmstpsnonwnondnon_acinpknlmwlksnonwnondb_2", "acinpknlmstpsraswrfldnon", "acinpknlmstpsnonwpstdnon", "acinpknlmstpsnonwnondnon"]

private ["_unit", "_target"];

_unit = _this select 0;
_target = _this select 1;

_unit removeWeapon "AGM_FakePrimaryWeapon";
_unit setVariable ["AGM_Transporting", objNull, True];
_unit setVariable ["AGM_canTreat", true, false];
_target setVariable ["AGM_isTreatable", True, True];

detach _target;

_unit removeAction (_unit getVariable "AGM_Medical_ReleaseID");

// animation was already handled by fnc_loadIntoVehicle
if (vehicle _target != _target) exitWith {};

if (vehicle _unit == _unit) then {
  if (animationState _unit in ANIM_DRAG) then {
    _unit playAction "released";
  } else {
    [_unit, "", 2, True] call AGM_Core_fnc_doAnimation;
  };
};
if (_target getVariable ["AGM_isUnconscious", False]) then {
  [_target, "Unconscious", 2, True] call AGM_Core_fnc_doAnimation;
};
