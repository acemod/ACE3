/**
 * fn_getReactionLinesOfPerson_AIM.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#define MEET_AND_GREET 0
#define ASK_ABOUT_OCCUPATION 1
#define ASK_ABOUT_STANCE 2
#define ASK_ABOUT_HOME 3
#define ASK_ABOUT_CULTURE 4
#define ASK_ABOUT_DOB 5
#define ASK_ABOUT_INTEL 6
#define ASK_ABOUT_ENEMY 7
#define GIVE_MONEY 8
#define GIVE_AID_PACKAGE 9
#define OFFER_MEDICAL_AID 10

#define ALL_LOCATIONS ["Strategic","StrongpointArea","FlatArea","FlatAreaCity","FlatAreaCitySmall","CityCenter","Airport","NameMarine","NameCityCapital","NameCity","NameVillage","NameLocal","Hill","ViewPoint","RockArea","BorderCrossing","VegetationBroadleaf","VegetationFir","VegetationPalm","VegetationVineyard"]
#define NEAREST_LOCATION_RADIUS 700


// TODO clean up this file. To massive, so split it up into multiple functions

private ["_target", "_caller","_spokenLineType","_reactionType"];
_target = _this select 0; // civilian
_caller = _this select 1; // usually the player
_spokenLineType = _this select 2;
_reactionType = _this select 3;

switch (_reactionType) do {
	case "agressive": {
		switch (_spokenLineType) do {
			case MEET_AND_GREET: { // meet & greet
				["Go away...","We don't need you here!", "I won't talk to you", "GO AWAY!"]
			};
			case ASK_ABOUT_OCCUPATION: {
				["Non of your business!"]
			};
			case ASK_ABOUT_STANCE: {
				["Non of your business!", "I am warning you!"]
			};
			case ASK_ABOUT_HOME: {
				["So you can destroy that?","Pfft.. someone should do something about you.."]
			};
			case ASK_ABOUT_CULTURE: {
				["HA! You should die", "What..."]
			};
			case ASK_ABOUT_DOB: {
				["Non of your business!"]
			};
			case ASK_ABOUT_INTEL: {
				["As if I will help you!"]
			};
			case ASK_ABOUT_ENEMY: {
				if !([_target] call cse_fnc_isArrested) then {
					["I will not tell you anything!"]
				} else {
					_nearEntities = _target nearEntities ["CaManBase", 1000];
					_enemyResults = [];
					{
						if (side _x != side _caller && {random(1)>0.8} && {side _x != side _target}) then {
							_foundLocations = (nearestLocations  [getPos _x, ALL_LOCATIONS, NEAREST_LOCATION_RADIUS]);
							if !(_foundLocations isEqualTo []) then {
								_enemyResults pushback format["Alright! Perhaps something can be found near %2", side _x, text(_foundLocations select 0)];
							};
						};
					}foreach _nearEntities;
					if (_enemyResults isEqualTo []) then {
						_enemyResults = ["I will never tell you anything!", "You won't get anything from me..", "I do not know anything!", "hmmph!"];
					};
					_enemyResults;
				};
			};
			case GIVE_MONEY: {
				["I DONT NEED YOUR MONEY","So you are going to buy my favour?"]
			};
			case GIVE_AID_PACKAGE: {
				["Go away!","I dont want this!"]
			};
			case OFFER_MEDICAL_AID: {
				["I dont need your help"]
			};
			default {
				["Go","Leave me!","Someone should do something about you.."]
			};
		};
	};
	case "friendly": {
		switch (_spokenLineType) do {
			case MEET_AND_GREET: { // meet & greet
				["Hello...",format["Hello, I am %1",[_target] call cse_fnc_getName], "Hi", "How are you, sir?"]
			};
			case ASK_ABOUT_OCCUPATION: {
				[format["My occupation is %1",[_target, "Occupation"] call cse_fnc_getProfileInformation_AIM]]
			};
			case ASK_ABOUT_STANCE: {
				[format["I support %1", str ([_target, "SupportedSides"] call cse_fnc_getProfileInformation_AIM)]]
			};
			case ASK_ABOUT_HOME: {
				["Sorry, I won't answer that", format["I live near %1, that is nearby %2",str (([_target, "homeTown"] call cse_fnc_getProfileInformation_AIM) select 0), str (([_target, "homeTown"] call cse_fnc_getProfileInformation_AIM) select 1)]]
			};
			case ASK_ABOUT_CULTURE: {
				["Sorry, I will not answer that"]
			};
			case ASK_ABOUT_DOB: {
				["Sorry, I will not answer that"]
			};
			case ASK_ABOUT_INTEL: {
				["Sorry, I don't know"]
			};
			case ASK_ABOUT_ENEMY: {
				_nearEntities = _target nearEntities ["CaManBase", 1000];
				_enemyResults = [];
				{
					if (side _x != side _caller && {random(1)>0.2} && {side _x != side _target}) then {
						_foundLocations = (nearestLocations  [getPos _x, ALL_LOCATIONS, NEAREST_LOCATION_RADIUS]);
						if !(_foundLocations isEqualTo []) then {
							_enemyResults pushback format["There might be some from side %1 near %2", side _x, text(_foundLocations select 0)];
						};
					};
				}foreach _nearEntities;
				if (_enemyResults isEqualTo []) then {
					_enemyResults pushback "I'm afraid I cannot tell you anything";
				};
				_enemyResults;
			};
			case GIVE_MONEY: {
				["Thank you"]
			};
			case GIVE_AID_PACKAGE: {
				["Thank you"]
			};
			case OFFER_MEDICAL_AID: {
				["Thank you"]
			};
			default {
				["Hello"]
			};
		};
	};
	case "neutral": {
		switch (_spokenLineType) do {
			case MEET_AND_GREET: { // meet & greet
				["Hello...",format["Hello, I am %1",[_target] call cse_fnc_getName], "Hi", "How are you, sir?"]
			};
			case ASK_ABOUT_OCCUPATION: {
				[format["My occupation is %1",[_target, "Occupation"] call cse_fnc_getProfileInformation_AIM]]
			};
			case ASK_ABOUT_STANCE: {
				[format["I support %1",str ([_target, "SupportedSides"] call cse_fnc_getProfileInformation_AIM)]]
			};
			case ASK_ABOUT_HOME: {
				["Sorry, I won't answer that", format["I live near %1, that is nearby %2",str (([_target, "homeTown"] call cse_fnc_getProfileInformation_AIM) select 0), str (([_target, "homeTown"] call cse_fnc_getProfileInformation_AIM) select 1)]]
			};
			case ASK_ABOUT_CULTURE: {
				["Sorry, I will not answer that"]
			};
			case ASK_ABOUT_DOB: {
				["Sorry, I will not answer that"]
			};
			case ASK_ABOUT_INTEL: {
				["Sorry, I don't know"]
			};
			case ASK_ABOUT_ENEMY: {
				_nearEntities = _target nearEntities ["CaManBase", 1000];
				_enemyResults = [];
				{
					if (side _x != side _caller && {random(1)>0.2} && {side _x != side _target}) then {
						_foundLocations = (nearestLocations  [getPos _x, ALL_LOCATIONS, NEAREST_LOCATION_RADIUS]);
						if !(_foundLocations isEqualTo []) then {
							_enemyResults pushback format["There might be some from side %1 near %2", side _x, text(_foundLocations select 0)];
						};
					};
				}foreach _nearEntities;
				if (_enemyResults isEqualTo []) then {
					_enemyResults pushback "I'm afraid I cannot tell you anything";
				};
				_enemyResults;
			};
			case GIVE_MONEY: {
				["Thank you"]
			};
			case GIVE_AID_PACKAGE: {
				["Thank you"]
			};
			case OFFER_MEDICAL_AID: {
				["Thank you"]
			};
			default {
				["Hello"]
			};
		};
	};
	case "careless": {
		switch (_spokenLineType) do {
			case MEET_AND_GREET: { // meet & greet
				["Hello...",format["Hello, I am %1",[_target] call cse_fnc_getName], "Hi", "How are you, sir?"]
			};
			case ASK_ABOUT_OCCUPATION: {
				[format["My occupation is %1",[_target, "Occupation"] call cse_fnc_getProfileInformation_AIM]]
			};
			case ASK_ABOUT_STANCE: {
				[format["I support %1",str ([_target, "SupportedSides"] call cse_fnc_getProfileInformation_AIM)]]
			};
			case ASK_ABOUT_HOME: {
				["Sorry, I won't answer that", format["I live near %1, that is nearby %2",str (([_target, "homeTown"] call cse_fnc_getProfileInformation_AIM) select 0), str (([_target, "homeTown"] call cse_fnc_getProfileInformation_AIM) select 1)]]
			};
			case ASK_ABOUT_CULTURE: {
				["Sorry, I will not answer that"]
			};
			case ASK_ABOUT_DOB: {
				["Sorry, I will not answer that"]
			};
			case ASK_ABOUT_INTEL: {
				["Sorry, I don't know"]
			};
			case ASK_ABOUT_ENEMY: {
				_nearEntities = _target nearEntities ["CaManBase", 1000];
				_enemyResults = [];
				{
					if (side _x != side _caller && {random(1)>0.2} && {side _x != side _target}) then {
						_foundLocations = (nearestLocations  [getPos _x, ALL_LOCATIONS, NEAREST_LOCATION_RADIUS]);
						if !(_foundLocations isEqualTo []) then {
							_enemyResults pushback format["There might be some from side %1 near %2", side _x, text(_foundLocations select 0)];
						};
					};
				}foreach _nearEntities;
				if (_enemyResults isEqualTo []) then {
					_enemyResults pushback "I'm afraid I cannot tell you anything";
				};
				_enemyResults;
			};
			case GIVE_MONEY: {
				["Thank you"]
			};
			case GIVE_AID_PACKAGE: {
				["Thank you"]
			};
			case OFFER_MEDICAL_AID: {
				["Thank you"]
			};
			default {
				["Hello"]
			};
		};
	};
	case "hostile": {
		switch (_spokenLineType) do {
			case MEET_AND_GREET: { // meet & greet
				["Go away...","We don't need you here!", "I won't talk to you", "GO AWAY!"]
			};
			case ASK_ABOUT_OCCUPATION: {
				["Non of your business!", "What are you still doing here"]
			};
			case ASK_ABOUT_STANCE: {
				["Non of your business!", "I am warning you!", "Should I push you in the face?"]
			};
			case ASK_ABOUT_HOME: {
				["So you can destroy that?","Pfft.. someone should do something about you..", "Where do you live? Perhaps I should visit there.."]
			};
			case ASK_ABOUT_CULTURE: {
				["HA! You should die", "What..."]
			};
			case ASK_ABOUT_DOB: {
				["Non of your business!"]
			};
			case ASK_ABOUT_INTEL: {
				["As if I will help you!"]
			};
			case ASK_ABOUT_ENEMY: {
				if !([_target] call cse_fnc_isArrested) then {
					["I will not tell you anything!"]
				} else {
					_nearEntities = _target nearEntities ["CaManBase", 1000];
					_enemyResults = [];
					{
						if (side _x != side _caller && {random(1)>0.8} && {side _x != side _target}) then {
							_foundLocations = (nearestLocations  [getPos _x, ALL_LOCATIONS, NEAREST_LOCATION_RADIUS]);
							if !(_foundLocations isEqualTo []) then {
								_enemyResults pushback format["Alright! Perhaps something can be found near %2", side _x, text(_foundLocations select 0)];
							};
						};
					}foreach _nearEntities;
					if (_enemyResults isEqualTo []) then {
						_enemyResults = ["I will never tell you anything!", "You won't get anything from me..", "I do not know anything!", "hmmph!"];
					};
					_enemyResults;
				};
			};
			case GIVE_MONEY: {
				["I DONT NEED YOUR MONEY","So you are going to buy my favour?"]
			};
			case GIVE_AID_PACKAGE: {
				["Go away!","I dont want this!"]
			};
			case OFFER_MEDICAL_AID: {
				["I dont need your help"]
			};
			default {
				["Go","Leave me!","Someone should do something about you.."]
			};
		};
	};
	case default {
		switch (_spokenLineType) do {
			case MEET_AND_GREET: { // meet & greet
				["Hello...",format["Hello, I am %1",[_target] call cse_fnc_getName], "Hi", "How are you, sir?"]
			};
			case ASK_ABOUT_OCCUPATION: {
				[format["My occupation is %1",[_target, "Occupation"] call cse_fnc_getProfileInformation_AIM]]
			};
			case ASK_ABOUT_STANCE: {
				[format["I support %1",str ([_target, "SupportedSides"] call cse_fnc_getProfileInformation_AIM)]]
			};
			case ASK_ABOUT_HOME: {
				["Sorry, I won't answer that"]
			};
			case ASK_ABOUT_CULTURE: {
				["Sorry, I will not answer that"]
			};
			case ASK_ABOUT_DOB: {
				["Sorry, I will not answer that"]
			};
			case ASK_ABOUT_INTEL: {
				_nearEntities = _target nearEntities ["CaManBase", 1000];
				_enemyResults = [];
				{
					if (side _x != side _caller && {random(1)>0.2} && {side _x != side _target}) then {
						_foundLocations = (nearestLocations  [getPos _x, ALL_LOCATIONS, NEAREST_LOCATION_RADIUS]);
						if !(_foundLocations isEqualTo []) then {
							_enemyResults pushback format["There might be some from side %1 near %2", side _x, text(_foundLocations select 0)];
						};
					};
				}foreach _nearEntities;
				if (_enemyResults isEqualTo []) then {
					_enemyResults pushback "I'm afraid I cannot tell you anything";
				};
				_enemyResults;
			};
			case ASK_ABOUT_ENEMY: {
				["I am afraid I can't tell you anything"]
			};
			case GIVE_MONEY: {
				["Thank you"]
			};
			case GIVE_AID_PACKAGE: {
				["Thank you"]
			};
			case OFFER_MEDICAL_AID: {
				["Thank you"]
			};
			default {
				["Hello"]
			};
		};
	};
};