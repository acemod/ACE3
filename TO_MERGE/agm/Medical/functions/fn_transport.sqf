/*
 * Author: KoffeinFlummi
 *
 * Start dragging the given unit.
 *
 * Argument:
 * 0: Unit to do the dragging (Object)
 * 1: Unit to be dragged (Object)
 * 2: Type of transportation
 *    - "drag"
 *    - "carry"
 *
 * Return value:
 * none
 */

#define ANIM_DRAG ["amovpercmstpslowwrfldnon_acinpknlmwlkslowwrfldb_2", "amovpercmstpsraswpstdnon_acinpknlmwlksnonwpstdb_2", "amovpercmstpsnonwnondnon_acinpknlmwlksnonwnondb_2", "acinpknlmstpsraswrfldnon", "acinpknlmstpsnonwpstdnon", "acinpknlmstpsnonwnondnon"]

_this spawn {
  _unit = _this select 0;
  _target = _this select 1;
  _type = _this select 2;

  _target setVariable ["AGM_isTreatable", False, True];
  _unit setVariable ["AGM_canTreat", False, False];

  // Everything but the rifle animation is fucked
  if (primaryWeapon _unit == "") then {
    _unit addWeapon "AGM_FakePrimaryWeapon";
  };
  _unit selectWeapon (primaryWeapon _unit);

  if (_type == "drag") then {
    _target setDir (getDir _unit + 180) % 360;
    _target setPos ((getPos _unit) vectorAdd ((vectorDir _unit) vectorMultiply 1.5));

    _unit playActionNow "grabDrag";
    [_target, "{_this playActionNow 'grabDragged'}", _target] call AGM_Core_fnc_execRemoteFnc;
    waitUntil {animationState _unit in ANIM_DRAG};
  } else {
    _target setDir (getDir _unit + 180) % 360;
    _target setPos ((getPos _unit) vectorAdd (vectorDir _unit));
    [_unit, "AcinPknlMstpSnonWnonDnon_AcinPercMrunSnonWnonDnon", 2, True] call AGM_Core_fnc_doAnimation;
    [_target, "AinjPfalMstpSnonWrflDnon_carried_Up", 2, True] call AGM_Core_fnc_doAnimation;
    sleep 15;

    /*_unit playActionNow "grabCarry";
    [_target, "{_this playActionNow 'grabCarried'}", _target] call AGM_Core_fnc_execRemoteFnc;
    waitUntil {animationState _unit in ANIM_CARRY};*/
  };

  _unit setVariable ["AGM_Transporting", _target, False];
  _releaseID = _unit addAction [format ["<t color='#FF0000'>%1</t>", localize "STR_AGM_Medical_Release"], "[(_this select 1), ((_this select 1) getVariable ['AGM_Transporting', objNull])] call AGM_Medical_fnc_release;", nil, 20, false, true, "", "!isNull (_this getVariable ['AGM_Transporting', objNull])"];
  _unit setVariable ["AGM_Medical_ReleaseID", _releaseID];

  // unit woke up while picking him up, abandon ship
  if !(_target getVariable ["AGM_isUnconscious", False] || {isNull (_unit getVariable ["AGM_Transporting", objNull])}) exitWith {
    detach _target;
    _target setVariable ["AGM_isTreatable", True, True];
    _unit setVariable ["AGM_canTreat", True, False];
    _unit removeWeapon "AGM_FakePrimaryWeapon";
    [_unit, "", 2, True] call AGM_Core_fnc_doAnimation;
    _unit removeAction (_unit getVariable "AGM_Medical_ReleaseID");
    _unit setVariable ["AGM_Transporting", objNull, False];
  };

  if (_type == "drag") then {
    _target attachTo [_unit, [0, 1.1, 0.092]];
    [_target, "{_this setDir 180;}", _target] call AGM_Core_fnc_execRemoteFnc;
    [_target, "AinjPpneMrunSnonWnonDb_still", 2, True] call AGM_Core_fnc_doAnimation;
  } else {
    _target attachTo [_unit, [0.4, -0.1, -1.25], "LeftShoulder"];
    [_target, "{_this setDir 195;}", _target] call AGM_Core_fnc_execRemoteFnc;
    [_unit, "AcinPercMstpSnonWnonDnon", 2, True] call AGM_Core_fnc_doAnimation;
    [_target, "AinjPfalMstpSnonWnonDf_carried_dead", 2, True] call AGM_Core_fnc_doAnimation;
  };

  // catch weird stuff happening
  // (player getting in vehicle, either person dying etc.)
  waitUntil {sleep 0.5;
    vehicle _unit != _unit or
    isNull (_unit getVariable ["AGM_Transporting", objNull]) or
    !(alive _unit) or
    !(alive _target) or
    (_unit getVariable ["AGM_isUnconscious", False]) or
    !(_target getVariable ["AGM_isUnconscious", False])
  };
  // release was properly done, do nothing
  if (isNull (_unit getVariable ["AGM_Transporting", objNull])) exitWith {};
  // weird shit happened, properly release unit
  [_unit, _unit getVariable ["AGM_Transporting", objNull]] call AGM_Medical_fnc_release;
};
