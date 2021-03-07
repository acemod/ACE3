class Cfg3DEN {
    class Attributes {
        class Slider;
        class GVAR(slider): Slider {
            attributeLoad = "params [""_ctrlGroup""];\
            private _slider = _ctrlGroup controlsGroupCtrl 100;\
            private _edit = _ctrlGroup controlsGroupCtrl 101;\
            _slider sliderSetPosition _value;\
            _edit ctrlSetText (if (_value < 0.1) then {localize ""str_disp_default""} else {[_value, 1, 1] call CBA_fnc_formatNumber});";
            attributeSave = "params [""_ctrlGroup""];\
            sliderPosition (_ctrlGroup controlsGroupCtrl 100); ";
            onLoad = "params [""_ctrlGroup""];\
            private _slider = _ctrlGroup controlsGroupCtrl 100;\
            private _edit = _ctrlGroup controlsGroupCtrl 101;\
            _slider sliderSetRange [0, 10];\
            _slider ctrlAddEventHandler [""SliderPosChanged"", {\
                params [""_slider""];\
                private _edit = (ctrlParentControlsGroup _slider) controlsGroupCtrl 101;\
                private _value = sliderPosition _slider;\
                _edit ctrlSetText (if (_value < 0.1) then {localize ""str_disp_default""} else {[_value, 1, 1] call CBA_fnc_formatNumber});\
            }];\
            _edit ctrlAddEventHandler [""KillFocus"", {\
                params [""_edit""];\
                private _slider = (ctrlParentControlsGroup _edit) controlsGroupCtrl 100;\
                private _value = ((parseNumber ctrlText _edit) min 10) max 0;\
                _slider sliderSetPosition _value;\
                _edit ctrlSetText (if (_value < 0.1) then { localize ""str_disp_default"" } else {[_value, 1, 1] call CBA_fnc_formatNumber});\
            }];";
        };
    };
    class Object {
        class AttributeCategories {
            class ace_attributes {
                class Attributes {
                    class GVAR(threshold) {
                        property = QUOTE(threshold);
                        control = QGVAR(slider);
                        displayName = CSTRING(Eden_threshold_DisplayName);
                        tooltip = CSTRING(Eden_threshold_Description);
                        expression = QUOTE(if (_value >= 0.1) then {_this setVariable [ARR_3(QQEGVAR(medical,damageThreshold),_value,true)]});
                        typeName = "NUMBER";
                        condition = "objectControllable";
                        defaultValue = 0;
                    };
                };
            };
        };
    };
};
