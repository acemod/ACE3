/*
 * Author: commy2
 *
 * Draw progress bar and execute given function if succesful.
 *
 * Argument:
 * 0: Duration of the action (Number)
 * 1: Arguments of the callback function (Array)
 * 2: Callback function name (String)
 * 3: Title of the loading bar (String)
 * 4: Name of the function that is called when the action is aborted via ESC (String, optional)
 *
 * Return value:
 * Nothing
 */
#include "\z\ace\addons\core\script_component.hpp"

closeDialog 0;
createDialog QGVAR(ProgressBar_Dialog);

_this spawn {
  _time = _this select 0;
  _arguments = _this select 1;
  _function = call compile (_this select 2);
  _title = _this select 3;
  _function2 = call compile (_this select 4);

  disableSerialization;
  _ctrlProgressBar = uiNamespace getVariable QGVAR(ctrlProgressBar);
  _ctrlProgressBarTitle = uiNamespace getVariable QGVAR(ctrlProgressBarTitle);

  _ctrlProgressBar ctrlSetPosition [
    safezoneX + 0.1 * safezoneW,
    safezoneY + 0.2 * safezoneH,
    0.8 * safezoneW,
    0.01 * safezoneH
  ];
  _ctrlProgressBar ctrlCommit (_time / accTime);

  _ctrlProgressBarTitle ctrlSetText _title;
  //_ctrlProgressBarTitle ctrlSetStructuredText _title;

  _time = time + _time;
  waitUntil {
    //make sure the progressBar is still open, not just any dialog
    (isNull (uiNamespace getVariable [QGVAR(ctrlProgressBar), controlNull])) || {!alive ACE_player} || {time > _time}
  };

  closeDialog 0;

  _progress = 1;
  if (time > _time) then {
    _arguments call _function;
  } else {
    [localize QOUTE(DOUBLES(STR,GVAR(ActionAborted)))] call FUNC(displayTextStructured);
    if (!isNil "_function2") then {
      _progress = 1 - ((_time - time) / (_this select 0)) max 0 min 1;
      _arguments call _function2;
    };
  };
};
