#include "script_component.hpp"

#define ACE_TEXT_RED(Text) ("<t color='#FF0000'>" + ##Text + "</t>")

private ["_helicopter", "_currentAction"];

_helicopter = _this;
_currentAction = _helicopter getVariable [QGVAR(cutAction), -1];

// Prevent double action
if (_currentAction != -1) then { _helicopter removeAction _currentAction };

_action_cut = _helicopter addaction [ACE_TEXT_RED(localize "STR_UA_ACE_RELEASESLING"), QPATHTO_F(ua_release_cargo),_helicopter,99,true,true,"","(driver _target) in _target"]; // err, driver target should always be in target :P
_helicopter setVariable [QGVAR(cutAction), _action_cut];
