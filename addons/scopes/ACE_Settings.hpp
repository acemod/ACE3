class ACE_Settings {
    class GVAR(enabled) {
        category = CSTRING(DisplayName);
        typeName = "BOOL";
        value = 1;
        displayName = CSTRING(enabled_displayName);
        description = CSTRING(enabled_description);
    };
    // ACE_ScopeAdjust_Vertical and ACE_ScopeAdjust_Horizontal will be populated with default values instead of [0,0]
    class GVAR(forceUseOfAdjustmentTurrets) {
        category = CSTRING(DisplayName);
        typeName = "BOOL";
        value = 0;
        displayName = CSTRING(forceUseOfAdjustmentTurrets_displayName);
        description = CSTRING(forceUseOfAdjustmentTurrets_description);
    };
    
    // Auto corrects the zeroing in both vanilla- and advanced ballistics
    class GVAR(correctZeroing) {
        category = CSTRING(DisplayName);
        typeName = "BOOL";
        value = 1;
        displayName = CSTRING(correctZeroing_displayName);
        description = CSTRING(correctZeroing_description);
    };
    // Enables the use of the 'defaultZeroRange' setting to overwrite the discreteDistance[] config
    class GVAR(overwriteZeroRange) {
        category = CSTRING(DisplayName);
        typeName = "BOOL";
        value = 0;
        displayName = CSTRING(overwriteZeroRange_displayName);
        description = CSTRING(overwriteZeroRange_description);
    };
    // Only affects scopes with elevation adjustment turrets (ACE_ScopeAdjust_Vertical != [0,0])
    class GVAR(defaultZeroRange) {
        category = CSTRING(DisplayName);
        typeName = "SCALAR";
        value = 100;
        displayName = CSTRING(defaultZeroRange_displayName);
        description = CSTRING(defaultZeroRange_description);
        sliderSettings[] = {0, 1000, 100, 0};
    };
    
    // Only relevant when advanced ballistics is enabled
    class GVAR(zeroReferenceTemperature) {
        category = CSTRING(DisplayName);
        typeName = "SCALAR";
        value = 15;
        displayName = CSTRING(zeroReferenceTemperature_displayName);
        description = CSTRING(zeroReferenceTemperature_description);
        sliderSettings[] = {-55, 55, 15, 0};
    };
    class GVAR(zeroReferenceBarometricPressure) {
        category = CSTRING(DisplayName);
        typeName = "SCALAR";
        value = 1013.25;
        displayName = CSTRING(zeroReferenceBarometricPressure_displayName);
        description = CSTRING(zeroReferenceBarometricPressure_description);
        sliderSettings[] = {0, 1013.25, 1013.25, 2};
    };
    class GVAR(zeroReferenceHumidity) {
        category = CSTRING(DisplayName);
        typeName = "SCALAR";
        value = 0.0;
        displayName = CSTRING(zeroReferenceHumidity_displayName);
        description = CSTRING(zeroReferenceHumidity_description);
        sliderSettings[] = {0, 1, 0, 2};
    };
    class GVAR(deduceBarometricPressureFromTerrainAltitude) {
        category = CSTRING(DisplayName);
        typeName = "BOOL";
        value = 0;
        displayName = CSTRING(deduceBarometricPressureFromTerrainAltitude_displayName);
        description = CSTRING(deduceBarometricPressureFromTerrainAltitude_description);
    };
    
    class GVAR(useLegacyUI) {
        category = CSTRING(DisplayName);
        typeName = "BOOL";
        value = 0;
        isClientSettable = 1;
        displayName = CSTRING(useLegacyUI_displayName);
        description = CSTRING(useLegacyUI_description);
    };
    
    class GVAR(simplifiedZeroing) {
        category = CSTRING(DisplayName);
        typeName = "BOOL";
        value = 0;
        displayName = CSTRING(simplifiedZeroing_displayName);
        description = CSTRING(simplifiedZeroing_description);
    };
};
