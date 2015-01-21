/**
* fnc_onSliderPosChanged.sqf
* @Descr: N/A
* @Author: PabstMirror
*
* @Arguments: []
* @Return:
* @PublicAPI: false
*/
#include "script_component.hpp"

systemChat format ["slide %1", _this];


disableSerialization;
_slider = _this select 0;
_pos = _this select 1;
_idc = ctrlIDC _slider;

_index = _idc % 4; //[410, 411, 412, 413];

 _settingsMenu = uiNamespace getVariable 'ACE_settingsMenu';
_optionSelected = lbCurSel 400;

// switch (GVAR(optionMenu_openTab)) do {
// case (MENU_TAB_COLORS): {
		// if (_selectedSetting > (count GVAR(clientSideColors))) then {
			// _selectedSetting = (count GVAR(clientSideColors)) - 1;
		// };
		// if (_selectedSetting < 0) then {
			// _selectedSetting = 0;
		// };
		// _nameOfSetting = (GVAR(clientSideColors) select _selectedSetting) select 0;
		// [MENU_TAB_COLORS, _nameOfSetting, _optionSelected] call FUNC(updateSetting);
		// [false] call FUNC(settingsMenuUpdateList);
	// };
// };


// private ["_settingsMenu", "_optionSelected", "_onChangeCode", "_selectedSetting", "_nameOfSetting"];
//

// 
// _selectedSetting =  lbCurSel 200;

// if (_optionSelected < 0) then {_optionSelected = 0;};


