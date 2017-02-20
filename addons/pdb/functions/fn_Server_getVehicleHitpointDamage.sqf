_oVehicle = _this select 0;
_iVehicleUID = _this select 1;

_sql = "extDB2" callExtension format["0:SQL:SELECT vehicleHitpoints FROM vehicles WHERE id = '%1'",_iVehicleUID];
_aResult = _sql splitString "[,]";

_iCountItems = (count _aResult - 1) / 3;

if(_iCountItems > 0) then {

	for "_i" from 0 to _iCountItems do 
	{
		_iCurrentHitIndex = _i;
		_iCurrentHitIndexDamage = parseNumber (_aResult select (_i + (_iCountItems * 2)));
		if(_iCurrentHitIndexDamage > 0) then {
			
			[_oVehicle, [_iCurrentHitIndex - 1, _iCurrentHitIndexDamage]] remoteExecCall ["setHitIndex", _oVehicle];

		};
	};
	
};
