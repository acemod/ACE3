/*
*	From Arma 3 Unit to Database
*/


sleep 2;

{
	_vehicleType = typeOf _x;
	_vehicleClass = getText (configFile >> "CfgVehicles" >> _vehicleType >> "vehicleClass");
	_vehicleName = getText (configFile >> "CfgVehicles" >> _vehicleType >> "displayName");
	_disableFlag = _x getVariable "sru_disable_pdb";
	
	if(isNil "_disableFlag" && _vehicleClass in sru_allowed_veh) then {
		
		_vehicleUID = _x getVariable "vehicleuid";
		_vehiclePos = format ["%1",(getPosWorld _x)];
		_vehicleDir = format ["%1",(round getDir _x)];
		_vehicleDamage = format ["%1",(damage _x)];
		_vehicleHitpointDamage = format["%1",(getAllHitPointsDamage _x)];
		_vehicleFuel = format ["%1",(fuel _x)];
		_vehicleCrew = crew _x;
		

		if(isNil "_vehicleUID") then {
			_sql_res = call compile ("extDB2" callExtension format["0:SQL:INSERT INTO vehicles SET vehicleType = '%1', vehiclePos = '%2', vehicleDir = '%3',vehicleFuel = '%5', vehicleDamage = '%6', mission_FK = '%4', vehicleClass = '%7', vehicleName = '%8'",_vehicleType,_vehiclePos,_vehicleDir,sru_pdb_mission_fk,_vehicleFuel,_vehicleDamage,_vehicleClass,_vehicleName]);
			
			_sql_res = "extDB2" callExtension format["0:SQL:SELECT id FROM vehicles ORDER BY id DESC LIMIT 0,1"];
			_sql_res = _sql_res splitString "[,]";
			_vehicleUID = _sql_res select 1;
			
			_x addEventHandler ["GetOut", {[_this select 0, _this select 2,_this select 1] execVM "\sru_pdb\functions\fn_Server_setSingleVehicle.sqf";}];
			_x setVariable["vehicleuid",[_vehicleUID],true];
		};

		_vehicleUIDArray = _x getVariable "vehicleuid";
		_vehicleUID = _vehicleUIDArray select 0;
		
		_null = [_x,_vehicleUID] execVM "\sru_pdb\functions\fn_Server_setVehicleInventory.sqf";
		
		
		if(count _vehicleCrew > 0) then {
			_vehicleCrew = 1;
		}
		else{
			_vehicleCrew = 0;
		};

		_sql_res = call compile ("extDB2" callExtension format["1:SQL:UPDATE vehicles SET vehicleType = '%1', vehiclePos = '%2', vehicleDir = '%3',vehicleFuel = '%5', vehicleDamage = '%6', mission_FK = '%4', vehicleClass = '%7', vehicleName = '%8',vehicleHitpoints = '%10',vehicleCrew = '%11', rec_date = NOW() WHERE id = '%9'",_vehicleType,_vehiclePos,_vehicleDir,sru_pdb_mission_fk,_vehicleFuel,_vehicleDamage,_vehicleClass,_vehicleName,_vehicleUID,_vehicleHitpointDamage,_vehicleCrew]);

	};
		
} forEach (vehicles);
