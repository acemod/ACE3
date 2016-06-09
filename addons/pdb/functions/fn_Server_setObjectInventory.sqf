_object = _this select 0;
_objUID = _this select 1;

_objItemCargo = str formatText ["%1", (getItemCargo _object)];
_objBachpackCargo = str formatText ["%1", (getBackpackCargo _object)];
_objMagazineCargo = str formatText ["%1", (getMagazineCargo _object)];
_objWeaponCargo = str formatText ["%1", (getWeaponCargo _object)];

_sql_res = "extDB2" callExtension format["0:SQL:UPDATE objects SET objInvItem = '%1',objInvBackpack = '%2',objInvMagazine = '%3',objInvWeapon = '%4' WHERE id = '%5'",_objItemCargo,_objBachpackCargo,_objMagazineCargo,_objWeaponCargo,_objUID];