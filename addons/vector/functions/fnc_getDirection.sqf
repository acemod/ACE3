// by commy2
#include "script_component.hpp"

private "_dlgVector";

disableSerialization;
_dlgVector = uiNamespace getVariable ["AGM_dlgVector", displayNull];

[
  round parseNumber ctrlText (_dlgVector displayCtrl 156),
  round parseNumber ctrlText (_dlgVector displayCtrl 182)
]
