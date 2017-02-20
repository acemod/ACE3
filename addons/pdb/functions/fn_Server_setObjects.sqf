/*
*	From Arma 3 Object to Database
*/
sru_debug_obj = "initializing saving..";
publicVariable "sru_debug_obj";

_objCntNew = 0;
_objCntUpd = 0;
_objCnt = count (allMissionObjects "All");
_cnt = 0;
{
	_cnt = _cnt + 1;
	_disableFlag = _x getVariable "sru_disable_pdb";
	_objType = typeOf _x;
	_objClass = getText (configFile >> "CfgVehicles" >> _objType >> "vehicleClass");
	_objName = getText (configFile >> "CfgVehicles" >> _objType >> "displayName");
	_objPos = format ["%1",(getPosWorld _x)];
	_objDir = format ["%1",(round getDir _x)];
	_objDamage = (damage _x);
	_objInit = format["%1",_x getVariable "sru_pdb_init"];
	
	if(isNil "_objInit") then {
		_objInit = "NULL";
	};
	
	if(_objDamage < 0.1) then {
		_objDamage = "0";
	};
	
	if(isNil "_disableFlag") then {
		
		if(_objClass in sru_allowed_Obj && !(_objType in sru_blacklist_Obj)) then {
			_objUID = _x getVariable "sru_objectUID";
			if(isNil "_objUID") then {
				"extDB2" callExtension format["0:SQL:INSERT INTO objects SET objName = '%1', objClass = '%2', objPos = '%3', objDir = '%4',objDamage = '%5',mission_FK = '%6',objRecDate = NOW(), objCategory = '%7', objInit = '%8'", _objName,_objType,_objPos,_objDir,_objDamage,sru_pdb_mission_fk,_objClass,_objInit];
				
				_sql_res = "extDB2" callExtension "0:SQL:SELECT id FROM objects ORDER BY id DESC LIMIT 0,1";
				_sql_res = _sql_res splitString "[,]";
				_objUID = _sql_res select 1;
				_x setVariable ["sru_objectUID", _objUID, true];
				
				_save_inv = [_x,_objUID] execVM "\sru_pdb\functions\fn_Server_setObjectInventory.sqf";
				waitUntil{scriptDone _save_inv};
				
				sru_debug_obj = format["saving objects | (new) %1 / %2 -> %3",_cnt,_objCnt,_objType];
				publicVariable "sru_debug_obj";
				
				_objCntNew = _objCntNew + 1;
				
			}
			else
			{
				"extDB2" callExtension format["0:SQL:UPDATE objects SET objPos = '%1', objDir = '%2',objDamage = '%3', objRecDate = NOW() WHERE id = '%4'",_objPos,_objDir,_objDamage,_objUID];
				_save_inv = [_x,_objUID] execVM "\sru_pdb\functions\fn_Server_setObjectInventory.sqf";
				waitUntil{scriptDone _save_inv};
				sru_debug_obj = format["saving objects | (update) %1 / %2 -> %3",_cnt,_objCnt,_objType];
				publicVariable "sru_debug_obj";
				_objCntUpd = _objCntUpd + 1;
			};
		};
	};
		
} forEach allMissionObjects "All";

sru_debug_obj = format["saving done | new: %1 | updated: %2",_objCntNew,_objCntUpd];
publicVariable "sru_debug_obj";