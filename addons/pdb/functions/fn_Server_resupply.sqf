_sql_res = "extDB2" callExtension format["0:SQL:SELECT wr.r_id AS id,wo.ro_blockRadius AS blockRadius,wo.ro_class AS class,m.markerPos AS pos,m.markerDir AS dir, r_template_id as template_id FROM wi_request wr JOIN marker m ON (m.`id` = wr.`r_marker_id`) JOIN wi_reqobj wo ON (wo.`id` = wr.`r_object_id`) WHERE r_status IN (1, 5) AND r_date < NOW() AND r_mission = '%1' GROUP BY r_pos ",sru_pdb_mission_fk];
_sql_res = _sql_res splitString "[,]";

if(count _sql_res > 2 ) then {
	
	for "_i" from 0 to ((count _sql_res)-8) step 8 do 
	{
		_requestId = call compile (_sql_res select (_i+1));
		diag_log format ["SRU PDB - Resupply inbound with ID %1", _requestId];
		_blockRadius = format["%1",(_sql_res select (_i+2))];
		_blockRadius2 = parseNumber _blockRadius;
		_objectType = (_sql_res select (_i+3));
		_objectPosX = call compile (_sql_res select (_i+4));
		_objectPosY = call compile (_sql_res select (_i+5));
		_objectPosZ = call compile (_sql_res select (_i+6));
		_objectTemplateId = call compile (_sql_res select (_i+8));
		
		_nearestObject = nearestObjects  [[_objectPosX,_objectPosY,_objectPosZ],["Car","Tank","Air","Thing"], _blockRadius2];
		if(count _nearestObject > 0) then {
			_sql_res_final = "extDB2" callExtension format["0:SQL:UPDATE wi_request SET r_status = 5, r_date = NOW() + INTERVAL 10 MINUTE WHERE r_id = '%1'",_requestId];
		} else {
			_objectDir = call compile (_sql_res select (_i+7));
			_obj = _objectType createVehicle [_objectPosX,_objectPosY,_objectPosZ];
			_obj setPos [_objectPosX,_objectPosY,_objectPosZ];
			_obj addEventHandler ["GetOut", {[_this select 0, _this select 2,_this select 1] execVM "\sru_pdb\functions\fn_Server_setSingleobject.sqf";}];
			
			clearItemCargoGlobal _obj;
			clearBackpackCargoGlobal _obj;
			clearMagazineCargoGlobal _obj;
			clearWeaponCargoGlobal _obj;
			
			if(_objectTemplateId > 0) then {
				sleep 1;
				diag_log format ["SRU PDB - Resupply with ID %1 is using inventory template %2", _requestId, _objectTemplateId];
				_sql = "extDB2" callExtension format["0:SQL:SELECT invItem FROM wi_inventory_templates WHERE id = '%1'",_objectTemplateId];
				_aResult = _sql splitString "[,]";

				_iCountItems = (count _aResult - 1) / 2;
				if(_iCountItems > 0) then {
					for "_i" from 1 to _iCountItems do 
					{
						_item = call compile (_aResult select _i);
						_itemAmount = parseNumber (_aResult select (_i + _iCountItems));
						_obj addItemCargoGlobal [_item, _itemAmount];
					};
					
				};

				_sql = "extDB2" callExtension format["0:SQL:SELECT invBackpack FROM wi_inventory_templates WHERE id = '%1'",_objectTemplateId];
				_aResult = _sql splitString "[,]";
				_iCountItems = (count _aResult - 1) / 2;
				if(_iCountItems > 0) then {
					for "_i" from 1 to _iCountItems do 
					{
						_item = call compile (_aResult select _i);
						_itemAmount = parseNumber (_aResult select (_i + _iCountItems));
						_obj addBackpackCargoGlobal [_item, _itemAmount];
					};

				};

				_sql = "extDB2" callExtension format["0:SQL:SELECT invMagazine FROM wi_inventory_templates WHERE id = '%1'",_objectTemplateId];
				_aResult = _sql splitString "[,]";
				_iCountItems = (count _aResult - 1) / 2;
				if(_iCountItems > 0) then {
					for "_i" from 1 to _iCountItems do 
					{
						_item = call compile (_aResult select _i);
						_itemAmount = parseNumber (_aResult select (_i + _iCountItems));
						_obj addMagazineCargoGlobal [_item, _itemAmount];
					};

				};

				_sql = "extDB2" callExtension format["0:SQL:SELECT invWeapon FROM wi_inventory_templates WHERE id = '%1'",_objectTemplateId];
				_aResult = _sql splitString "[,]";
				_iCountItems = (count _aResult - 1) / 2;
				if(_iCountItems > 0) then {
					for "_i" from 1 to _iCountItems do 
					{
						_item = call compile (_aResult select _i);
						_itemAmount = parseNumber (_aResult select (_i + _iCountItems));
						_obj addWeaponCargoGlobal [_item, _itemAmount];
					};

				};

			};
			
			_sql_res_final = "extDB2" callExtension format["0:SQL:UPDATE wi_request SET r_status = 9 WHERE r_id = '%1'",_requestId];
			
		};
		
		sleep 10;
		
	};
	
};