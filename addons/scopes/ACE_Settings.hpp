class ACE_Settings {
    class GVAR(enabled) {
        movedToSQF = 1;
    };
    // ACE_ScopeAdjust_Vertical and ACE_ScopeAdjust_Horizontal will be populated with default values instead of [0,0]
    class GVAR(forceUseOfAdjustmentTurrets) {
        movedToSQF = 1;
    };
    
    // Auto corrects the zeroing in both vanilla- and advanced ballistics
    class GVAR(correctZeroing) {
        movedToSQF = 1;
    };
    // Enables the use of the 'defaultZeroRange' setting to overwrite the discreteDistance[] config
    class GVAR(overwriteZeroRange) {
        movedToSQF = 1;
    };
    // Only affects scopes with elevation adjustment turrets (ACE_ScopeAdjust_Vertical != [0,0])
    class GVAR(defaultZeroRange) {
        movedToSQF = 1;
    };
    
    // Only relevant when advanced ballistics is enabled
    class GVAR(zeroReferenceTemperature) {
        movedToSQF = 1;
    };
    class GVAR(zeroReferenceBarometricPressure) {
       movedToSQF = 1;
    };
    class GVAR(zeroReferenceHumidity) {
        movedToSQF = 1;
    };
    class GVAR(deduceBarometricPressureFromTerrainAltitude) {
        movedToSQF = 1;
    };
    
    class GVAR(useLegacyUI) {
        movedToSQF = 1;
    };
    
    class GVAR(simplifiedZeroing) {
        movedToSQF = 1;
    };
};
