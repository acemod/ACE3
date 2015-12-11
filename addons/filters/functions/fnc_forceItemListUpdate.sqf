// by commy2
#include "script_component.hpp"

disableSerialization;
params ["_display"];

private _index = GVAR(selectedFilterIndex);
private _itemList = _display call FUNC(currentItemListBox);
private _filterFunction = missionNamespace getVariable ((_display displayCtrl 6554) lbData _index);

if (_filterFunction isEqualType {}) then {
    private _i = 0;

    while {_i < lbSize _itemList} do {
        private _config = uiNamespace getVariable [
            format [QGVAR(ItemKey:%1), _itemList lbText _i, _itemList lbPicture _i],
            configNull
        ];

        if (!isNull _config && {!(_config call _filterFunction)}) then {
            _itemList lbDelete _i;

            // in case the filter function returns nil. Otherwise could lock up the game.
            _i = _i - 1;
        };

        _i = _i + 1;
    };
};
