_vehicle = _this select 0;
_vehicleUID = _this select 1;

_vehItemCargo = str formatText ["%1", (getItemCargo _vehicle)];
_vehBachpackCargo = str formatText ["%1", (getBackpackCargo _vehicle)];
_vehMagazineCargo = str formatText ["%1", (getMagazineCargo _vehicle)];
_vehWeaponCargo = str formatText ["%1", (getWeaponCargo _vehicle)];

_sql_res = "extDB2" callExtension format["0:SQL:UPDATE vehicles SET vehicleInvItem = '%1',vehicleInvBackpack = '%2',vehicleInvMagazine = '%3',vehicleInvWeapon = '%4' WHERE id = '%5'",_vehItemCargo,_vehBachpackCargo,_vehMagazineCargo,_vehWeaponCargo,_vehicleUID];