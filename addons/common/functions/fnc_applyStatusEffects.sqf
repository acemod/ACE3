/*
Name: applyStatusEffect

Author: Pabst Mirror

Description:
  Sets the status effect on a unit.

Parameters:
  0: OBJECT - Unit

Returns:
  None

*/

#define DEBUG_MODE_FULL

#include "script_component.hpp"

#define HASH_INDEX(hash,key) ((hash select 0) find key)

PARAMS_1(_unit);
DEFAULT_PARAM(1,_isJip, false);
DEFAULT_PARAM(2,_isRespawn, false);

_unitEffects = _unit getVariable ["ACE_statusEffects", 0];
_statusHashList = missionNamespace getVariable ["ACE_statusHashList", []];

if (!local _unit) exitWith {
  ["applyStatusEffects", _unit, _this] call FUNC(targetEvent);
};
if (_unitEffects == 0) exitWith {};
if (!(VALIDHASH(_statusHashList))) exitWith {};

_effectTypeHash = HASHLIST_SELECT(_statusHashList, 0);
_removeOnJipHash = HASHLIST_SELECT(_statusHashList, 1);
_removeOnRespawn = HASHLIST_SELECT(_statusHashList, 2);

_unitStatusBoolArray = [_unitEffects, (count (_effectTypeHash select 0))] call FUNC(binarizeNumber);

_allEffects = [(_effectTypeHash select 1)] call FUNC(uniqueElementsOnly);
_activeEffects = [];
_updated = false;
{
  if (_x) then {
    TRACE_4("wtf", _isJip, _removeOnJipHash select 1 select _forEachIndex, _isRespawn, _removeOnRespawn select 1 select _forEachIndex);
    if ((_isJip && {(_removeOnJipHash select 1) select _forEachIndex}) || {_isRespawn && {(_removeOnRespawn select 1)  select _forEachIndex}}) then {
      _updated = true;
      _unitStatusBoolArray set [_forEachIndex, false];
    } else {
      _effectType = (_effectTypeHash select 1) select _forEachIndex;
      if (!(_effectType in _activeEffects)) then {
        _activeEffects pushBack _effectType;
      };
    };
  };
} forEach _unitStatusBoolArray;
TRACE_2("Updaing unit",_unit,_updated);
if (_updated) then {
  _unitStatusNumber = _unitStatusBoolArray call FUNC(toBitmask);
  _unit setVariable ["ACE_statusEffects", _unitStatusNumber, true];
};

TRACE_3("Updaing All Effects",_unit,_allEffects,_activeEffects);
{
  [_x, [_unit, (_x in _activeEffects)]] call FUNC(localEvent);
} forEach _allEffects;
