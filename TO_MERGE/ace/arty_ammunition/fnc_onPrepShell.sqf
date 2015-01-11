//#define DEBUG_MODE_FULL
#include "script_component.hpp"

private ["_t","_mag","_maxCharge","_magazineFormat","_magazineClass"];

TRACE_1("", _this);
// dont open the dialog if there are no arty rounds in thebox

PARAMS_1(_shell);
GVAR(currentAmmoCrate) = _shell;

_t = _shell getVariable "ACE_ARTY_PREP";
if (isNil "_t") then {
	private["_magazineFormat", "_magazineClass", "_maxCharge"];
	// gdi, we have to FIND the fucking mag class now and then just default all the data.
	_mag = getText (configFile >> "CfgVehicles" >> typeOf _shell >> "ACE_ARTY_MAGAZINE_CLASS");
	_maxCharge = getNumber (configFile >> "CfgMagazines" >> _mag >> "ACE_ARTY_MAXCHARGE");
	_magazineFormat = getText(configFile >> "CfgMagazines" >> _mag >> "ACE_ARTY_MAGAZINE_FORMAT");
	_fuzes = getArray(configFile >> "CfgMagazines" >> _mag >> "ACE_ARTY_FUZE_TYPES");
	
	_magazineClass = format[_magazineFormat, "pd", _maxCharge];
	_t = [_magazineClass, [200], abs (random 10000), _maxCharge, _fuzes select 0];
	_shell setVariable ["ACE_ARTY_PREP", _t, true];
};

GVAR(currentCharge) = _t select 3;
GVAR(currentFuze) = _t select 4;
GVAR(fuzeTime) = (_t select 1) select 0;

createDialog "ace_arty_ammoprep_Display";
