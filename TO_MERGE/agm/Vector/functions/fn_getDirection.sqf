// by commy2

private "_dlgVectorOptics";

disableSerialization;
_dlgVectorOptics = uiNamespace getVariable ['AGM_dlgVectorOptics', displayNull];

[
  round parseNumber ctrlText (_dlgVectorOptics displayCtrl 156),
  round parseNumber ctrlText (_dlgVectorOptics displayCtrl 182)
]
