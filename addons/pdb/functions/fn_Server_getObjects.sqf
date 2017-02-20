/*
*	From Database to Arma 3 Object
*/

sleep 2;
sru_debug_obj = "initializing loading..";
publicVariable "sru_debug_obj";

_sql_res = "extDB2" callExtension format["0:SQL:SELECT count(id) FROM objects WHERE mission_FK = '%1'",sru_pdb_mission_fk];  
_sql_res = _sql_res splitString "[,]";  
_objCnt = parseNumber (_sql_res select 1); 
if(_objCnt > 0) then {
_cnt = 0;
	{
		_disableFlag = _x getVariable "sru_disable_pdb";
		_objType = typeOf _x;
		_objClass = getText (configFile >> "CfgVehicles" >> _objType >> "vehicleClass");					
		
		if(_objClass in sru_allowed_Obj && isNil "_disableFlag" && !(_objType in sru_blacklist_Obj)) then {
			_cnt = _cnt + 1;
			deleteVehicle _x;
			sru_debug_obj = format["deleting objects | %1 / %2 -> %3",_cnt,_objCnt,_objType];
			publicVariable "sru_debug_obj";
		};
	} forEach allMissionObjects "All";
	
	for "_i" from 1 to (_objCnt - 1) step 1 do 
	{
		
		_sql_res = "extDB2" callExtension format["0:SQL:SELECT id,objClass,objPos,objDir,objDamage,objInit FROM objects WHERE mission_FK = '%1' LIMIT %2, 1",sru_pdb_mission_fk,_i];
		_sql_res = _sql_res splitString "[,]";
		
		_objUID = (_sql_res select 1);
		_objType = (_sql_res select 2);
		_objPosX = call compile (_sql_res select 3);
		_objPosY = call compile (_sql_res select 4);
		_objPosZ = call compile (_sql_res select 5);
		_objDir = call compile (_sql_res select 6);
		_objDamage = call compile (_sql_res select 7);
		_objInit = (_sql_res select 8);
		
		sru_debug_obj = format["loading objects | %1 / %2 -> %3",_i,_objCnt,_objType];
		publicVariable "sru_debug_obj";
		
		_obj = _objType createVehicle [0,0,0];
		_obj enableSimulation false;
		_obj allowDamage false;
		

		if(_objDamage < 0.1) then {
			_obj setDamage 0; 
		} else {
			_obj setDamage _objDamage;
		};
		
		_obj setVariable["sru_objectUID",_objUID,true];
		
		_obj setVelocity [0, 0, 0];
		_obj setDir _objDir;
		_obj setPosWorld [_objPosX,_objPosY,_objPosZ];
		_obj allowDamage true;
		

		_get_inv = [_obj,_objUID] execVM "\sru_pdb\functions\fn_Server_getObjectInventory.sqf";
		waitUntil{scriptDone _get_inv}
	};
	
};

sleep 10;

_cnt = 0;
{
		_disableFlag = _x getVariable "sru_disable_pdb";
		_objType = typeOf _x;
		_objClass = getText (configFile >> "CfgVehicles" >> _objType >> "vehicleClass");					
		
		if(_objClass in sru_allowed_Obj && isNil "_disableFlag") then {
			_cnt = _cnt + 1;
			_x enableSimulation true;
			_x allowDamage true;
			sru_debug_obj = format["enabling objects | %1 / %2 -> %3",_cnt,_objCnt,_objType];
			publicVariable "sru_debug_obj";
		};
		
		if(_objType in sru_blacklist_Obj) then {
			_x setVariable["R3F_LOG_disabled",true,true];
		};
} forEach allMissionObjects "All";

sru_debug_obj = "loading done..";
publicVariable "sru_debug_obj";