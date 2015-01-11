#define MILPREC 17.7777777777778
#define DEG2MIL(deg) (((deg*MILPREC)) min 6400)
#define MIL2DEG(mil) mil/MILPREC

/*
input
_ownPos = _this select 0;
_targetPos = _this select 1;
_vehicle = _this select 2;
_weapon = _this select 3;
_magazine = _this select 4;
_charge = _this select 5;
*/

// "ace_arty_105mm_m1_m782_pd_chg1"

_m119Data = [
  45, // min elevation
	70, // max elevation
	"m782", // fuze
  [
		[
			"HE", // name
			"m1", // classname
			0, // burst height
			[ // charges: name, class
				["charge 1", "chg1"],	["charge 2", "chg2"],	["charge 3", "chg3"],	["charge 4", "chg4"],	["charge 5", "chg5"],	["charge 6", "chg6"],	["charge 7", "chg7"],	["charge 8", "chg8"]
			]
		],
		[
			"WP",
			"m84a1",
			0,
			[
				["charge 1", "chg1"],	["charge 2", "chg2"],	["charge 3", "chg3"],	["charge 4", "chg4"],	["charge 5", "chg5"],	["charge 6", "chg6"],	["charge 7", "chg7"],	["charge 8", "chg8"]
			]
		],
		[
			"Illum",
			"m314a3",
			500,
			[
				["charge 1", "chg1"],	["charge 2", "chg2"],	["charge 3", "chg3"],	["charge 4", "chg4"],	["charge 5", "chg5"],	["charge 6", "chg6"],	["charge 7", "chg7"],	["charge 8", "chg8"]
			]
		],
	  [
			"DPICM",
			"m916",
			0,
			[
				["charge 1", "chg1"],	["charge 2", "chg2"],	["charge 3", "chg3"],	["charge 4", "chg4"],	["charge 5", "chg5"],	["charge 6", "chg6"],	["charge 7", "chg7"],	["charge 8", "chg8"]
	    ]
	  ]
	]
];

_m224Data = [
  "ACE_M224", // vehicle
  "ACE_M224_Tri", // weapon
  45, // min elev
  85.21875, // max elev
  [["Close",0.27], ["Medium",0.6], ["Far",1]], // charges
  [
    [
      "HE",
      "ACE_1Rnd_60mmHE_M224",
      0 // burst height
    ],
    [
      "WP",
      "ACE_1Rnd_60mmWP_M224",
      0 // burst height
    ],
    [
      "Illum",
      "ACE_1Rnd_60mmILLUM_M224",
      250 // burst height
    ]
  ]
];

_m252Data = [
  "ACE_M224", // vehicle
  "ACE_M224_Tri", // weapon
  45, // min elev
  85.21875, // max elev
  [["Close",0.27], ["Medium",0.6], ["Far",1]], // charges
  [
    [
      "HE",
      "ACE_1Rnd_81mmHE_M252",
      0 // burst height
    ],
    [
      "WP",
      "ACE_1Rnd_81mmWP_M252",
      0 // burst height
    ],
    [
      "Illum",
      "ACE_1Rnd_81mmILLUM_M252",
      250 // burst height
    ]
  ]
];

_2b14Data = [
  "ACE_M224", // vehicle
  "ACE_M224_Tri", // weapon
  45, // min elev
  85, // max elev
  [["Close",0.35], ["Medium",0.7], ["Far",1]], // charges
  [
    [
      "HE",
      "ACE_1Rnd_82mmHE_2B14",
      0 // burst height
    ],
    [
      "WP",
      "ACE_1Rnd_82mmWP_2B14",
      0 // burst height
    ],
    [
      "Illum",
      "ACE_1Rnd_82mmILLUM_2B14",
      250 // burst height
    ]
  ]
];

_m119Data = [
  "ACE_M224", // vehicle
  "ACE_M224_Tri", // weapon
  45, // min elevation
	70, // max elevation
  [["Close",0.67], ["Medium",0.81], ["Far",1]], // charges
  [
    [
      "HE",
      "30Rnd_105mmHE_M119",
      0 // burst height
    ],
    [
      "WP",
      "30Rnd_105mmWP_M119",
      0 // burst height
    ],
    [
      "Illum",
      "30Rnd_105mmILLUM_M119",
      300 // burst height
    ]
  ]
];

_d30Data = [
  "ACE_M224", // vehicle
  "ACE_M224_Tri", // weapon
  45, // min elevation
	70, // max elevation
  [["Close",0.67], ["Medium",0.83], ["Far",1]], // charges
  [
    [
      "HE",
      "30Rnd_122mmHE_D30",
      0 // burst height
    ],
    [
      "WP",
      "30Rnd_122mmWP_D30",
      0 // burst height
    ],
    [
      "Illum",
      "30Rnd_122mmILLUM_D30",
      300 // burst height
    ]
  ]
];


_data = _m119Data;

// start making table
//_mags = [];
//_charges = [];
_tables = [];

_vehicle      = _data select 0;
_weapon       = _data select 1;
_minElevation = _data select 2;
_maxElevation = _data select 3;
_charges      = _data select 4;
_rounds       = _data select 5;
{ // foreach rounds
	_roundArray = _x;
	_roundName = _roundArray select 0;
	_round = _roundArray select 1;
	_roundBurstingHeight = _roundArray select 2;

  _initSpeed = getNumber (configFile >> "CfgMagazines" >> _round >> "initspeed");
  
  _tables_round = [_roundName, _round, []]; // building tables array
  {
    _charge = _x;
    diag_log(_charge);
    _chargeName = _charge select 0;
    _chargeMultiplier = _charge select 1;
    diag_log(_initSpeed);
    diag_log(_chargeMultiplier);
    _velocity = _initSpeed * _chargeMultiplier;

		// make btab
    _btab = [_round, _minElevation, _maxElevation +2, 1, -200, _roundBurstingHeight +100, 100, _velocity] call DEMO_fnc_getBTable;
    
    // make range table
    _tables_table = [];
    _range = 100;
    _step = 100;
    if (_velocity < 100) then {
      _step = 25;
    } else {
      if (_velocity < 200) then {
        _step = 50;
      }
    };
    _belowMinRange = true;
    _belowMaxRange = true;
    while {_belowMaxRange} do {
    diag_log (str _range); // debug
      _fs         = [_range, _roundBurstingHeight,    _btab] call DEMO_fnc_calcFiringSolution;
      _fsAltitude = [_range, _roundBurstingHeight -100, _btab] call DEMO_fnc_calcFiringSolution;
      
      if (count _fs > 0) then { // valid result
        if (_fs select 0 <= _maxElevation) then { // within elevation limit
          _belowMinRange = false;

          //save range table
          _elevation = _fs select 0;
          _elevation = round(DEG2MIL(_elevation));

          _flightTime = _fs select 2;
          _flightTime = (round (_flightTime * 10)) / 10;

          _elevationAltitude = (_fsAltitude select 0) - (_fs select 0);
          _elevationAltitude = round(DEG2MIL(_elevationAltitude));
          
          _flightTimeAltitude = (_fsAltitude select 2) - (_fs select 2);
          _flightTimeAltitude = (round (_flightTimeAltitude * 10)) / 10;
            
          _tables_table = _tables_table + [[_range, _elevation, _elevationAltitude, _flightTimeAltitude, _flightTime]];
        };
      } else { // invalid result
        if (!_belowMinRange) then { // if past min range
          _belowMaxRange = false; // end loop
        };
      };
      _range = _range + _step;
    }; // end ranges loop
    _tables_charge = [_chargeName, "", _tables_table]; // building tables array
    _tables_round set [2, (_tables_round select 2) + [_tables_charge]]; // building tables array
      
      
  } foreach _charges;

	_tables = _tables + [_tables_round];
} foreach _rounds;


  /*_charges = [];
  _configCharges = getArray (configFile >> "CfgWeapons" >> _weapon >> "modes");
  {
    _charge = _x;
    _showToPlayer = getArray (configFile >> "CfgWeapons" >> _weapon >> _charge >> "showtoplayer");
    if (_showToPlayer == 1) then {
      _artilleryCharge = getArray (configFile >> "CfgWeapons" >> _weapon >> _charge >> "artillerycharge");
      _charges = _charges + [[_displayName, _artilleryCharge]];
    }

  } foreach _configCharges;*/
  
  
// output, need to add newlines
_tablesString = "_tables = [" + toString[10];
_roundIndex = 1;
{ // foreach round
  _roundArray = _x;
	_tablesString = _tablesString + format ['["%1","%2",[', _roundArray select 0, _roundArray select 1] + toString[10];
	_charges = _x select 2;
	_chargeIndex = 1;
	{ // foreach charge
	  _chargeArray = _x;
		
		if (_chargeIndex < count _charges) then {
			_tablesString = _tablesString + (str _chargeArray) + "," + toString[10];
		} else {
		  _tablesString = _tablesString + (str _chargeArray) + toString[10];
		};
		_chargeIndex = _chargeIndex + 1;
	} foreach _charges;
	
	if (_roundIndex < count _tables) then {
		_tablesString = _tablesString + "]]," + toString[10];
	} else {
		_tablesString = _tablesString + "]]" + toString[10];
	};
  
	_roundIndex = _roundIndex + 1;
} foreach _tables;
 _tablesString = _tablesString + "];" + toString[10];
	
diag_log  _tablesString;
copyToClipboard  _tablesString;

hint "table generation done";
/*
hint "generate 1";
_mags = ["ace_arty_105mm_m1_m782_pd_chg1", "ace_arty_105mm_m1_m782_pd_chg2", "ace_arty_105mm_m1_m782_pd_chg3", "ace_arty_105mm_m1_m782_pd_chg4", "ace_arty_105mm_m1_m782_pd_chg5", "ace_arty_105mm_m1_m782_pd_chg6", "ace_arty_105mm_m1_m782_pd_chg7", "ace_arty_105mm_m1_m782_pd_chg8"];
{
	_mag = _x;
  
	//hint format ["%1", DEMO_fnc_calcBallistics];
	_btab = [_mag, 45, 70, 1, -200, 100, 100] call DEMO_fnc_getBTable;
	
  //copyToClipboard format ["%1", _btab];
	diag_log "btab:";
  diag_log (format ["%1", _btab]);
	diag_log "ranges:";
	_range = 0;
	for "_range" from 25 to 20000 step 25 do {
	  hintSilent format ["%1", _range];
	  _fs         = [_range, 0,    _btab] call DEMO_fnc_calcFiringSolution;
		_fsAltitude = [_range, -100, _btab] call DEMO_fnc_calcFiringSolution;
    diag_log (format ["%1", _fs]);
    diag_log (format ["%1", _fsAltitude]);
		
		if (count _fs > 0) then {
		  _elevation = _fs select 0;
		  _flightTime = _fs select 2;
		  _elevationAltitude = (_fsAltitude select 0) - (_fs select 0);
      diag_log (format ["[%1,%2,%3,%4]", _range, _elevation, _elevationAltitude, _flightTime]);
		};
	};
} foreach _mags;

//copyToClipboard format ["%1", _table];
*/