_oVehicle = _this select 0;
_iVehicleUID = _this select 1;

clearItemCargoGlobal _oVehicle;
clearBackpackCargoGlobal _oVehicle;
clearMagazineCargoGlobal _oVehicle;
clearWeaponCargoGlobal _oVehicle;

_sql = "extDB2" callExtension format["0:SQL:SELECT vehicleInvItem FROM vehicles WHERE id = '%1'",_iVehicleUID];
_aResult = _sql splitString "[,]";

_iCountItems = (count _aResult - 1) / 2;
if(_iCountItems > 0) then {
	for "_i" from 1 to _iCountItems do 
	{
		_item = call compile (_aResult select _i);
		_itemAmount = parseNumber (_aResult select (_i + _iCountItems));
		_oVehicle addItemCargoGlobal [_item, _itemAmount];
	};
	
};

_sql = "extDB2" callExtension format["0:SQL:SELECT vehicleInvBackpack FROM vehicles WHERE id = '%1'",_iVehicleUID];
_aResult = _sql splitString "[,]";
_iCountItems = (count _aResult - 1) / 2;
if(_iCountItems > 0) then {
	for "_i" from 1 to _iCountItems do 
	{
		_item = call compile (_aResult select _i);
		_itemAmount = parseNumber (_aResult select (_i + _iCountItems));
		_oVehicle addBackpackCargoGlobal [_item, _itemAmount];
	};

};

_sql = "extDB2" callExtension format["0:SQL:SELECT vehicleInvMagazine FROM vehicles WHERE id = '%1'",_iVehicleUID];
_aResult = _sql splitString "[,]";
_iCountItems = (count _aResult - 1) / 2;
if(_iCountItems > 0) then {
	for "_i" from 1 to _iCountItems do 
	{
		_item = call compile (_aResult select _i);
		_itemAmount = parseNumber (_aResult select (_i + _iCountItems));
		_oVehicle addMagazineCargoGlobal [_item, _itemAmount];
	};

};

_sql = "extDB2" callExtension format["0:SQL:SELECT vehicleInvWeapon FROM vehicles WHERE id = '%1'",_iVehicleUID];
_aResult = _sql splitString "[,]";
_iCountItems = (count _aResult - 1) / 2;
if(_iCountItems > 0) then {
	for "_i" from 1 to _iCountItems do 
	{
		_item = call compile (_aResult select _i);
		_itemAmount = parseNumber (_aResult select (_i + _iCountItems));
		_oVehicle addWeaponCargoGlobal [_item, _itemAmount];
	};

};

