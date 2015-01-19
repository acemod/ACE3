#define DEBUG_MODE_FULL

#include "script_component.hpp"

#define HASH_INDEX(hash,key) ((hash select 0) find key)


PARAMS_2(_unit,_effectType);

_unitEffects = _unit getVariable ["ACE_statusEffects", 0];
_statusHashList = missionNamespace getVariable ["ACE_statusHashList", []];

if (!(VALIDHASH(_statusHashList))) exitWith {[]};

_effectTypeHash = HASHLIST_SELECT(_statusHashList, 0);
_unitStatusBoolArray = [_unitEffects] call EFUNC(common,binarizeNumber); //create bool array

_returnValue = [];

{
	if ((_unitStatusBoolArray select _forEachIndex) && {((_effectTypeHash select 1) select _forEachIndex) == _effectType}) then {
		_returnValue pushBack _x;
	};
} forEach (_effectTypeHash select 0);

TRACE_3("Effects:", _unit, _effectType, _returnValue);

_returnValue
