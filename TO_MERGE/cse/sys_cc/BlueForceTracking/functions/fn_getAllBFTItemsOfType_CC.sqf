
private["_unit","_return","_toCheck"];
_unit = _this select 0;
_item = _this select 1;
_return = [];


_itemArray = toArray _item;
{
	_compArray = toArray _x;
	if (_compArray select 0 == _itemArray select 0) then {
		if ([_item,_x] call BIS_fnc_inString) then {
			_return pushback _x;
		};
	};
}foreach ([_unit] call cse_fnc_getAllBFTItems_CC);
_return