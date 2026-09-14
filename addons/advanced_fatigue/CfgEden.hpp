#define CUSTOM_SLIDER(ID,MIN,MAX) \
    class GVAR(ID): Slider { \
        #pragma hemtt suppress pw3_padded_arg \
        attributeLoad = QUOTE( \
            params ['_ctrlGroup']; \
            private _slider = _ctrlGroup controlsGroupCtrl 100; \
            private _edit = _ctrlGroup controlsGroupCtrl 101; \
            _slider sliderSetPosition _value; \
            _edit ctrlSetText ([ARR_3(_value,1,1)] call CBA_fnc_formatNumber); \
        ); \
        attributeSave = QUOTE(params ['_ctrlGroup']; sliderPosition (_ctrlGroup controlsGroupCtrl 100)); \
        #pragma hemtt suppress pw3_padded_arg \
        onLoad = QUOTE( \
            params ['_ctrlGroup']; \
            private _slider = _ctrlGroup controlsGroupCtrl 100; \
            private _edit = _ctrlGroup controlsGroupCtrl 101; \
            _slider sliderSetRange [ARR_2(MIN,MAX)]; \
            _slider ctrlAddEventHandler [ARR_2('SliderPosChanged',{ \
                params ['_slider']; \
                private _edit = (ctrlParentControlsGroup _slider) controlsGroupCtrl 101; \
                private _value = sliderPosition _slider; \
                _edit ctrlSetText ([ARR_3(_value,1,1)] call CBA_fnc_formatNumber); \
            })]; \
            _edit ctrlAddEventHandler [ARR_2('KillFocus',{ \
                params ['_edit']; \
                private _slider = (ctrlParentControlsGroup _edit) controlsGroupCtrl 100; \
                private _value = ((parseNumber ctrlText _edit) min MAX) max MIN; \
                _slider sliderSetPosition _value; \
                _edit ctrlSetText str _value; \
            })]; \
        ); \
    }

class Cfg3DEN {
    class Attributes {
        class Slider;
        CUSTOM_SLIDER(slider_performanceFactor,0,MAX_PERFORMANCE_FACTOR);
        CUSTOM_SLIDER(slider_recoveryFactor,0,10);
        CUSTOM_SLIDER(slider_loadFactor,0,5);
        CUSTOM_SLIDER(slider_terrainGradientFactor,0,5);
    };
    class Object {
        class AttributeCategories {
            class ace_attributes {
                class Attributes {
                    class GVAR(performanceFactor) {
                        property = QGVAR(performanceFactor);
                        control = QGVAR(slider_performanceFactor);
                        displayName = CSTRING(PerformanceFactor);
                        tooltip = CSTRING(PerformanceFactor_EdenDescription);
                        expression = QUOTE(_this setVariable [ARR_3(QQGVAR(performanceFactor),_value,true)]);
                        typeName = "NUMBER";
                        condition = "objectControllable";
                        defaultValue = 1;
                    };
                    class GVAR(recoveryFactor) {
                        property = QGVAR(recoveryFactor);
                        control = QGVAR(slider_recoveryFactor);
                        displayName = CSTRING(RecoveryFactor);
                        tooltip = CSTRING(RecoveryFactor_EdenDescription);
                        expression = QUOTE(_this setVariable [ARR_3(QQGVAR(recoveryFactor),_value,true)]);
                        typeName = "NUMBER";
                        condition = "objectControllable";
                        defaultValue = 1;
                    };
                    class GVAR(loadFactor) {
                        property = QGVAR(loadFactor);
                        control = QGVAR(slider_loadFactor);
                        displayName = CSTRING(LoadFactor);
                        tooltip = CSTRING(LoadFactor_EdenDescription);
                        expression = QUOTE(_this setVariable [ARR_3(QQGVAR(loadFactor),_value,true)]);
                        typeName = "NUMBER";
                        condition = "objectControllable";
                        defaultValue = 1;
                    };
                    class GVAR(terrainGradientFactor) {
                        property = QGVAR(terrainGradientFactor);
                        control = QGVAR(slider_terrainGradientFactor);
                        displayName = CSTRING(TerrainGradientFactor);
                        tooltip = CSTRING(TerrainGradientFactor_EdenDescription);
                        expression = QUOTE(_this setVariable [ARR_3(QQGVAR(terrainGradientFactor),_value,true)]);
                        typeName = "NUMBER";
                        condition = "objectControllable";
                        defaultValue = 1;
                    };
                };
            };
        };
    };
};
