class ACE_Settings {
    class GVAR(enabled) {
        typeName = "BOOL";
        value = 1;
        displayName = CSTRING(enabled_displayName);
        description = CSTRING(enabled_description);
    };
    // ACE_ScopeAdjust_Vertical and ACE_ScopeAdjust_Horizontal will be populated with default values instead of [0,0]
    class GVAR(forceUseOfAdjustmentTurrets) {
        typeName = "BOOL";
        value = 0;
        displayName = CSTRING(forceUseOfAdjustmentTurrets_displayName);
        description = CSTRING(forceUseOfAdjustmentTurrets_description);
    };
    
    // Auto corrects the zeroing in both vanilla- and advanced ballistics
    class GVAR(correctZeroing) {
        typeName = "BOOL";
        value = 1;
        displayName = CSTRING(correctZeroing_displayName);
        description = CSTRING(correctZeroing_description);
    };
    // Enables the use of the 'defaultZeroRange' setting to overwrite the discreteDistance[] config
    class GVAR(overwriteZeroRange) {
        typeName = "BOOL";
        value = 0;
        displayName = CSTRING(overwriteZeroRange_displayName);
        description = CSTRING(overwriteZeroRange_description);
    };
    // Only affects scopes with elevation adjustment turrets (ACE_ScopeAdjust_Vertical != [0,0])
    class GVAR(defaultZeroRange) {
        typeName = "SCALAR";
        value = 100;
        displayName = CSTRING(defaultZeroRange_displayName);
        description = CSTRING(defaultZeroRange_description);
    };
    
    // Only relevant when advanced ballistics is enabled
    class GVAR(zeroReferenceTemperature) {
        typeName = "SCALAR";
        value = 15;
        displayName = CSTRING(zeroReferenceTemperature_displayName);
        description = CSTRING(zeroReferenceTemperature_description);
    };
    class GVAR(zeroReferenceBarometricPressure) {
        typeName = "SCALAR";
        value = 1013.25;
        displayName = CSTRING(zeroReferenceBarometricPressure_displayName);
        description = CSTRING(zeroReferenceBarometricPressure_description);
    };
    class GVAR(zeroReferenceHumidity) {
        typeName = "SCALAR";
        value = 0.5;
        displayName = CSTRING(zeroReferenceHumidity_displayName);
        description = CSTRING(zeroReferenceHumidity_description);
    };
    class GVAR(deduceBarometricPressureFromTerrainAltitude) {
        typeName = "BOOL";
        value = 0;
        displayName = CSTRING(deduceBarometricPressureFromTerrainAltitude_displayName);
        description = CSTRING(deduceBarometricPressureFromTerrainAltitude_description);
    };
};
