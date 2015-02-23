#include "script_component.hpp"

PARAMS_1(_target);

_allItems = ((weapons _target) + (magazines _target) + (items _target) + (assignedItems _target));

if ((backpack _target) != "") then {
    _allItems pushBack (backpack _target);
};
if ((vest _target) != "") then {
    _allItems pushBack (vest _target);
};
if ((uniform _target) != "") then {
    _allItems pushBack (uniform _target);
};
if ((headgear _target) != "") then {
    _allItems pushBack (headgear _target);
};

_uniqueClassnames = [];
_classnamesCount = [];
//Filter unique and count
{
    _index = _uniqueClassnames find _x;
    if (_index != -1) then {
        _classnamesCount set [_index, ((_classnamesCount select _index) + 1)];
    } else {
        _uniqueClassnames pushBack _x;
        _classnamesCount pushBack 1;
    };
} forEach _allItems;

[_uniqueClassnames, _classnamesCount]
