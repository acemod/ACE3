#define DEBUG_MODE_FULL

#include "script_component.hpp"

#define HASH_INDEX(hash,key) ((hash select 0) find key)

PARAMS_4(_unit,_effectName,_effectType,_isEnabled);
DEFAULT_PARAM(4,_removeOnJIP, false);
DEFAULT_PARAM(5,_removeOnRespawn, false);

_unitEffects = _unit getVariable ["ACE_statusEffects", 0];
_statusHashList = missionNamespace getVariable ["ACE_statusHashList", []];

if (!(VALIDHASH(_statusHashList))) then {
	_statusHashList = HASHLIST_CREATELIST([]);
	HASHLIST_PUSH(_statusHashList, HASHLIST_CREATEHASH(_statusHashList));
	HASHLIST_PUSH(_statusHashList, HASHLIST_CREATEHASH(_statusHashList));
	HASHLIST_PUSH(_statusHashList, HASHLIST_CREATEHASH(_statusHashList));
};

_effectTypeHash = HASHLIST_SELECT(_statusHashList, 0);
_removeOnJipHash = HASHLIST_SELECT(_statusHashList, 1);
_removeOnRespawnHash = HASHLIST_SELECT(_statusHashList, 2);


if ((!HASH_HASKEY(_effectTypeHash,_effectType)) || {!HASH_HASKEY(_effectTypeHash,_effectType)}) then {
	// If effect name isn't in hashList
	HASH_SET(_effectTypeHash,_effectName,_effectType);
	HASHLIST_SET(_statusHashList, 0, _effectTypeHash);
	HASH_SET(_removeOnJipHash,_effectName,_removeOnJIP);
	HASHLIST_SET(_statusHashList, 1, _removeOnJipHash);
	HASH_SET(_removeOnRespawnHash,_effectName,_removeOnRespawn);
	HASHLIST_SET(_statusHashList, 2, _removeOnRespawnHash);
	
	missionNamespace setVariable ["ACE_statusHashList", _statusHashList];
	publicVariable "ACE_statusHashList";
};

_effectIndex = HASH_INDEX(_statusHashList, _effectName);

_unitStatusBoolArray = [_unitEffects, (count (_effectTypeHash select 0))] call EFUNC(common,binarizeNumber); //create bool array

_unitStatusBoolArray set [_effectIndex, _isEnabled]; //set new status
_unitStatusNumber = _unitStatusBoolArray call EFUNC(common,toBitmask);

_unit setVariable ["ACE_statusEffects", _unitStatusNumber, true];

[_unit, false, false] call EFUNC(common,applyStatusEffects);
