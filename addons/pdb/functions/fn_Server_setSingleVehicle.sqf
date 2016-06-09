/*
*	From Arma 3 Unit to Database
*/


_unitPosition = _this select 2;

if(_unitPosition == "Driver") then {
	_vehicle = _this select 0;
	_lastDriver = format ["%1",name (_this select 1)];
	_vehicleUIDArray = _vehicle getVariable "vehicleuid";
	_vehicleUID = _vehicleUIDArray select 0;
	_vehicleType = typeOf _vehicle;
	_vehiclePos = format ["%1",(getPosWorld _vehicle)];
	_vehicleDir = format ["%1",(round getDir _vehicle)];
	_vehicleDamage = format ["%1",(damage _vehicle)];
	_vehicleHitpointDamage = format["%1",(getAllHitPointsDamage _vehicle)];
	_vehicleFuel = format ["%1",(fuel _vehicle)];
	_vehicleClass = getText (configFile >> "CfgVehicles" >> _vehicleType >> "vehicleClass");
	
	if(isNil {(_x getVariable "sru_disable_pdb")}) then	{
		_sql = call compile ("extDB2" callExtension format["0:SQL:UPDATE vehicles SET vehiclePos = '%1', vehicleDir = '%2',vehicleFuel = '%5', vehicleDamage = '%6', vehicleLastDriver = '%7',vehicleHitpoints = '%8',vehicleLastRide = NOW(),vehicleCrew = 0, rec_date = NOW() WHERE id = '%4' AND mission_FK = '%3'",_vehiclePos,_vehicleDir,sru_pdb_mission_fk,_vehicleUID,_vehicleFuel,_vehicleDamage,_lastDriver,_vehicleHitpointDamage]);
		_null = [_vehicle,_vehicleUID] execVM "\sru_pdb\functions\fn_Server_setVehicleInventory.sqf";
	};
};