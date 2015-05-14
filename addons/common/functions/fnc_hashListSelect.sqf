//fnc_hashListSelect.sqf
#include "script_component.hpp"

private ["_hash", "_keys", "_hashes", "_values"];

PARAMS_2(_hashList,_index);
ERRORDATA(2);
_hash = nil;
try {
    if(VALIDHASH(_hashList)) then {
        _keys = _hashList select 0;
        _hashes = _hashList select 1;
        if(_index < (count _hashes)) then {
            _values = _hashes select _index;

            _hash = [_keys, _values, 1];
        } else {
            ERROR("Index of hashlist is out of range");
        };
    } else {
        ERROR("Input hashlist is not valid");
    };
} catch {
    HANDLECATCH;
};
_hash;
