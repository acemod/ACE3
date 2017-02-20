_object = _this select 0;
_objUID = _this select 1;

clearItemCargoGlobal _object;
clearBackpackCargoGlobal _object;
clearMagazineCargoGlobal _object;
clearWeaponCargoGlobal _object;

_sql = "extDB2" callExtension format["0:SQL:SELECT objInvItem FROM objects WHERE id = '%1'",_objUID];
_aResult = _sql splitString "[,]";

_iCountItems = (count _aResult - 1) / 2;
if(_iCountItems > 0) then {
	for "_i" from 1 to _iCountItems do 
	{
		_item = call compile (_aResult select _i);
		_itemAmount = parseNumber (_aResult select (_i + _iCountItems));
		_object addItemCargoGlobal [_item, _itemAmount];
	};
	
};

_sql = "extDB2" callExtension format["0:SQL:SELECT objInvBackpack FROM objects WHERE id = '%1'",_objUID];
_aResult = _sql splitString "[,]";
_iCountItems = (count _aResult - 1) / 2;
if(_iCountItems > 0) then {
	for "_i" from 1 to _iCountItems do 
	{
		_item = call compile (_aResult select _i);
		_itemAmount = parseNumber (_aResult select (_i + _iCountItems));
		_object addBackpackCargoGlobal [_item, _itemAmount];
	};

};

_sql = "extDB2" callExtension format["0:SQL:SELECT objInvMagazine FROM objects WHERE id = '%1'",_objUID];
_aResult = _sql splitString "[,]";
_iCountItems = (count _aResult - 1) / 2;
if(_iCountItems > 0) then {
	for "_i" from 1 to _iCountItems do 
	{
		_item = call compile (_aResult select _i);
		_itemAmount = parseNumber (_aResult select (_i + _iCountItems));
		_object addMagazineCargoGlobal [_item, _itemAmount];
	};

};

_sql = "extDB2" callExtension format["0:SQL:SELECT objInvWeapon FROM objects WHERE id = '%1'",_objUID];
_aResult = _sql splitString "[,]";
_iCountItems = (count _aResult - 1) / 2;
if(_iCountItems > 0) then {
	for "_i" from 1 to _iCountItems do 
	{
		_item = call compile (_aResult select _i);
		_itemAmount = parseNumber (_aResult select (_i + _iCountItems));
		_object addWeaponCargoGlobal [_item, _itemAmount];
	};

};

