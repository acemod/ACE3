// by commy2

0 spawn {
	waitUntil {player getVariable ["AGM_Name", ""] != ""};

	_name = player getVariable ["AGM_Name", ""];
	_name = toArray _name;

	_index = _name find (toArray "]" select 0);

	if (_index != -1) then {
		for "_index" from 0 to _index do {
			_name set [_index, -1];
		};
		_name = _name - [-1];
		_name = toString _name;
		player setVariable ["AGM_Name", _name, true];
	};
};
