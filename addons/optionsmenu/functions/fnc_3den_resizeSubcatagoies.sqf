/*
 * Author: PabstMirror
 * Resize the 3den control groups (on minimize event)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ACE_optionsmenu_fnc_3den_resizeSubcatagoies
 *
 * Public: No
 */
#include "script_component.hpp"

private _dsp = uiNamespace getVariable [QGVAR(3denDisplay), displayNull];
private _base = _dsp displayCtrl 201;

private _yHeight = 0;
private _index = 10;
private _categoryBase = controlNull;
while {
    _categoryBase = _base controlsGroupCtrl _index;
    _index = _index + 1;
    !isNull _categoryBase
} do {
    private _categoryMinimize = _categoryBase controlsGroupCtrl 7001;
    private _categoryControlGroup = _categoryBase controlsGroupCtrl 7003;

    private _height = if (cbChecked _categoryMinimize) then {_categoryControlGroup getVariable QGVAR(height)} else {0};
    private _addedHeight = (25 * pixelH) + _height;


    //enable and Resize the category sub control group to based on it's minimize check box status:
    private _catCGPos = ctrlPosition _categoryControlGroup;
    _catCGPos set [3, _height];
    _categoryControlGroup ctrlSetPosition _catCGPos;
    _categoryControlGroup ctrlCommit 0;
    _categoryControlGroup ctrlShow (cbChecked _categoryMinimize);
    _categoryControlGroup ctrlEnable (cbChecked _categoryMinimize);

    //resize and reposition the Main Category control based on it's effective size
    private _cPos = ctrlPosition _categoryBase;
    _cPos set [1, _yHeight];
    _cPos set [3, _addedHeight];
    _categoryBase ctrlSetPosition _cPos;
    _categoryBase ctrlCommit 0;

    //Set the total height to the height of hte main category + 5 pixle buffer
    _yHeight = _yHeight + _addedHeight + 5 * pixelH;
};

TRACE_1("totalHeight",_yHeight);
