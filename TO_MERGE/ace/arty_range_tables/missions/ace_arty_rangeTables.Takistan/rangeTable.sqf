_dataFile = "tables\m119.sqf";
//_dataFile = "tables\m224_legacy.sqf";
_tableData = call compile preprocessFileLineNumbers _dataFile;
_tableData_tables = _tableData select 0;
_tableData_mags = _tableData select 1;
_tableData_charges = _tableData select 2;

ace_sys_arty_ammunition_selectRangeTable = {
  _dataFile = _this select 0;
  _tableData = call compile preprocessFileLineNumbers _dataFile;
  _tableData_tables = _tableData select 0;
  _tableData_mags = _tableData select 1;
  _tableData_charges = _tableData select 2;
	
	_selectedMag = _tableData_mags select (lbCurSel 4020);
	_selectedCharge = _tableData_charges select (lbCurSel 4021);
	_selectedTable = [];
	
	//scopeName "selectRangeTable_base";
	{ // foreach mags
		_mag = _x;
		_magName = _mag select 0;
		_magClass = _mag select 1;
		if (_magName == _selectedMag) then { // correct mag
			_charges = _mag select 2;
			{ //foreach charges
				_charge = _x;
				_chargeName = _charge select 0;
				_chargeClass = _charge select 1;
				if (_chargeName == _selectedCharge) then { // correct charge
					_table = _charge select 2;
					_selectedTable = _table;
					// breakTo "selectRangeTable_base";
				};
			} foreach _charges;
		};
	} foreach _tableData_tables;

	// apply range table
	lnbClear 4022;
	{
		// 0: range, 1: elevation, 2: altitude -100m elev, 3: altitude -100m time, 4: time of flight
		lnbAddRow [4022, [str (_x select 0), str (_x select 1), str (_x select 2), str (_x select 3), str (_x select 4)]];
	} foreach _selectedTable;
	
};

// create dialog
_dialog = createDialog "ace_sys_arty_rangeTables_RangeTable";
waituntil {_dialog};

with uiNamespace do {
  display = findDisplay 2999;
	
	// fill mags combo
	{
		lbAdd [4020, _x];
	} foreach _tableData_mags;
	lbSetCurSel [4020, 0];

	// fill charges combo
	{
		lbAdd [4021, _x];
	} foreach _tableData_charges;
	lbSetCurSel [4021, 0];
	
	// set onchange event handlers
	combo_round = display displayCtrl 4020;
	combo_round ctrlAddEventHandler ["LBSelChanged", '["'+_dataFile+'"] call ace_sys_arty_ammunition_selectRangeTable'];
	combo_charge = display displayCtrl 4021;
	combo_charge ctrlAddEventHandler ["LBSelChanged", '["'+_dataFile+'"] call ace_sys_arty_ammunition_selectRangeTable'];
};
// fill range table
[_dataFile] call ace_sys_arty_ammunition_selectRangeTable;
