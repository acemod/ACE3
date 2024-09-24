class Cfg3DEN {
    class Attributes {
        class Slider;
        class GVAR(slider): Slider {
            #pragma hemtt suppress pw3_padded_arg
            attributeLoad = QUOTE(\
                params ['_ctrlGroup']; \
                private _slider = _ctrlGroup controlsGroupCtrl 100; \
                private _edit = _ctrlGroup controlsGroupCtrl 101; \
                _slider sliderSetPosition _value; \
                _edit ctrlSetText ([ARR_3(_value,1,1)] call CBA_fnc_formatNumber); \
            );
            attributeSave = QUOTE(params ['_ctrlGroup']; sliderPosition (_ctrlGroup controlsGroupCtrl 100));
            #pragma hemtt suppress pw3_padded_arg
            onLoad = QUOTE(\
                params ['_ctrlGroup']; \
                private _slider = _ctrlGroup controlsGroupCtrl 100; \
                private _edit = _ctrlGroup controlsGroupCtrl 101; \
                _slider sliderSetRange [ARR_2(0,MAX_PERFORMANCE_FACTOR)]; \
                _slider ctrlAddEventHandler [ARR_2('SliderPosChanged',{ \
                    params ['_slider']; \
                    private _edit = (ctrlParentControlsGroup _slider) controlsGroupCtrl 101; \
                    private _value = sliderPosition _slider; \
                    _edit ctrlSetText ([ARR_3(_value,1,1)] call CBA_fnc_formatNumber); \
                })]; \
                _edit ctrlAddEventHandler [ARR_2('KillFocus',{ \
                    params ['_edit']; \
                    private _slider = (ctrlParentControlsGroup _edit) controlsGroupCtrl 100; \
                    private _value = ((parseNumber ctrlText _edit) min MAX_PERFORMANCE_FACTOR) max 0; \
                    _slider sliderSetPosition _value; \
                    _edit ctrlSetText str _value; \
                })]; \
            );
        };
    };
    class Object {
        class AttributeCategories {
            class ace_attributes {
                class Attributes {
                    class GVAR(performanceFactor) {
                        property = QGVAR(performanceFactor);
                        control = QGVAR(slider);
                        displayName = CSTRING(PerformanceFactor);
                        tooltip = CSTRING(PerformanceFactor_EdenDescription);
                        expression = QUOTE(_this setVariable [ARR_3(QQGVAR(performanceFactor),_value,true)]);
                        typeName = "NUMBER";
                        condition = "objectControllable";
                        defaultValue = 1;
                    };
                };
            };
        };
    };
};
