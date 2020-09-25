#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineResincl.inc"
#include "\a3\ui_f\hpp\defineResinclDesign.inc"
/*
 * Author: Freddo
 * Reads view distance setting and applies a
 * slider eventhandler to monitor for changes.
 *
 * Arguments:
 * 0: Video options display <DISPLAY>
 *
 * Return Value:
 * Nothing
 *
 * Public: No
 */

if !(GVAR(enabled)) exitWith {
    setViewDistance (viewDistance min GVAR(limitViewDistance));
};

params ["_display", "_mode"];

switch _mode do {
    case "onLoad": {
        private _settingsCtrlGrp = _display displayCtrl IDC_RSCCOMMMENUITEMS_RSCCOMMMENUITEMS;
        private _viewdistSliderCtrl = _settingsCtrlGrp controlsGroupCtrl IDC_OPTIONS_VISIBILITY_SLIDER;
        private _viewdistValueCtrl = _settingsCtrlGrp controlsGroupCtrl IDC_OPTIONS_VISIBILITY_VALUE;
        private _objViewdistSliderCtrl = _settingsCtrlGrp controlsGroupCtrl IDC_OPTIONS_OBJECT_VISIBILITY_SLIDER;
        private _objViewdistValueCtrl = _settingsCtrlGrp controlsGroupCtrl IDC_OPTIONS_OBJECT_VISIBILITY_VALUE;

        TRACE_5("Loaded video options display",_display,_settingsCtrlGrp,_viewdistSliderCtrl,_objViewdistSliderCtrl,_objViewdistValueCtrl);

        if !(0 in [GVAR(viewDistanceOnFoot), GVAR(viewDistanceLandVehicle), GVAR(viewDistanceAirVehicle)]) then {
            _viewdistSliderCtrl ctrlEnable false;
            _viewdistSliderCtrl ctrlSetTooltip LLSTRING(videosettings_disabled);
            _viewdistValueCtrl ctrlShow false;
            _viewdistValueCtrl ctrlSetTooltip LLSTRING(videosettings_disabled);
        };

        if (GVAR(objectViewDistanceCoeff) != 0) then {
            _objViewdistSliderCtrl ctrlEnable false;
            _objViewdistSliderCtrl ctrlSetTooltip LLSTRING(videosettings_disabled);
            _objViewdistValueCtrl ctrlShow false;
            _objViewdistValueCtrl ctrlSetTooltip LLSTRING(videosettings_disabled);
        };
    };
    case "onUnload": {
        [false] call FUNC(adaptViewDistance);
    };
};

nil
