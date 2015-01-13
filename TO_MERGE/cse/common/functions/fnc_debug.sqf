/**
 * fn_debug.sqf
 * @Descr: Print logging messages through the CSE framework.
 * @Author: Glowbal
 *
 * @Arguments: [message ANY, level NUMBER (Optional)]
 * @Return:  BOOL True if message has been printed
 * @PublicAPI: true
 */
#include "script_component.hpp"

#define ERROR 0
#define WARN 1
#define DEBUG 2
#define INFO 3
#define NONE 4

#define DEFAULTLOGLEVEL NONE
#define DEFAULTTEXTDISPLAY WARN

private ["_msg", "_level", "_prefix", "_defaultLoglevel","_defaultLogDisplayLevel", "_message", "_from"];
_msg = _this select 0;
_level = _this select 1;

if (isNil QGVAR(LOGLEVEL)) then {
	_defaultLoglevel = DEFAULTLOGLEVEL;
} else {
	_defaultLoglevel = GVAR(LOGLEVEL);
};

if (isnil QGVAR(LOGDISPLAY_LEVEL)) then {
	_defaultLogDisplayLevel = DEFAULTTEXTDISPLAY;
} else {
	_defaultLogDisplayLevel = GVAR(LOGDISPLAY_LEVEL);
};

if (isNil "_level") then {
	_level = DEBUG;
};
if (_defaultLoglevel == 4) exitwith {false};
if (_level <= _defaultLoglevel) then {
	switch (_level) do {
		case ERROR: { _prefix = "ACE Error" };
		case WARN: { _prefix = "ACE Warn" };
		case DEBUG: { _prefix = "ACE Debug" };
		case INFO: { _prefix = "ACE Info" };
		default { _prefix = "ACE Unknown" };
	};
	_message = format["[%1] %2",_prefix,_msg];

	if (isnil QGVAR(LOGIC_OBJECT)) then {
		_group = createGroup sideLogic;
		GVAR(LOGIC_OBJECT) = _group createUnit ["logic", [1,1,1], [], 0, "FORM"];
	};
	if (isNull GVAR(LOGIC_OBJECT)) then {
		_group = createGroup sideLogic;
		GVAR(LOGIC_OBJECT) = _group createUnit ["logic", [1,1,1], [], 0, "FORM"];
	};


	if (_level <= _defaultLogDisplayLevel) then {
		showChat true;
		GVAR(LOGIC_OBJECT) globalChat _message;
	};
	diag_log _message;
};
true