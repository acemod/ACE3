/**
 * fn_getPlayerSpokenLineType_AIM.sqf
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

private ["_target","_caller","_spokenLineType", "_spot", "_enemySide", "_allSides"];
_target = _this select 0;
_caller = _this select 1;
_spokenLineType = _this select 2;

_allSides = [west, independent, east, civilian];
_spot = 0;
{
	if ((_x getFriend side _caller) < ((_allSides select _spot) getFriend side _caller)) then {
		_spot = _foreachIndex;
	};
}foreach _allSides;
_enemySide = _allSides select _spot;

switch (_spokenLineType) do {
	case MEET_AND_GREET: { // meet & greet
		["Hello, how are you?",format["Hello, I am %1",[_caller] call cse_fnc_getName], "Hi", "Hello.."]
	};
	case ASK_ABOUT_OCCUPATION: {
		["What do you do for a living?", "What is it that you do?", "What is your occupation?"]
	};
	case ASK_ABOUT_STANCE: {
		["Who do you support?", "What do you think of our cause?"]
	};
	case ASK_ABOUT_HOME: {
		["Where do you live?","Do you live nearby?","Where are you from?","What is your place?"]
	};
	case ASK_ABOUT_CULTURE: {
		["From what area are you from?"]
	};
	case ASK_ABOUT_DOB: {
		["How old are you?","From when are you?"]
	};
	case ASK_ABOUT_INTEL: {
		["Do you know any information that could be of use for us?","Have you got any information for us?","Have you seen something suspicious?"]
	};
	case ASK_ABOUT_ENEMY: {
		[format["Have you seen %1 side?", _enemySide], format["Can you tell me anything about %1 side movements?", _enemySide]]
	};
	case GIVE_MONEY: {
		["Sir, please accept this"]
	};
	case GIVE_AID_PACKAGE: {
		["Sir, please accept this"]
	};
	case OFFER_MEDICAL_AID: {
		["Do you need medical assistance?"]
	};
	default {
		["Hello"]
	};
};