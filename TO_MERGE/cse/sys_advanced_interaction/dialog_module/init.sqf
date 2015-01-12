

if (Isnil ("cse_stance_systemBlufor")) then {cse_stance_systemBlufor = 10;};
if (Isnil ("cse_stance_systemOpfor")) then {cse_stance_systemOpfor = 10;};
if (Isnil ("cse_stance_systemRes")) then {cse_stance_systemRes = 10; };

[format["AIM - Conversation Component initialisation completed"],3] call cse_fnc_debug;


if (!isnil "CSE_SYS_AIM_DIALOG_MODULE_TALKTO_AIM") then {
	player removeAction CSE_SYS_AIM_DIALOG_MODULE_TALKTO_AIM;
	CSE_SYS_AIM_DIALOG_MODULE_TALKTO_AIM = nil;
};
CSE_SYS_AIM_DIALOG_MODULE_TALKTO_AIM = player addAction ["Talk to", {[cursorTarget, _this select 1] call cse_fnc_playerStartConverationWith_AIM;}, [], 1, false, false, "", "((cursortarget isKindOf 'CAManBase') && [cursortarget] call cse_fnc_isAwake && !(IsPlayer cursorTarget))"];


["cse_profile_information_aim", [], true, "aim"] call cse_fnc_defineVariable;
["cse_dialog_recorded_conversation_aim", [], false, "aim"] call cse_fnc_defineVariable;

CSE_PERFORMING_TALKING_ACTION_AIM = false;