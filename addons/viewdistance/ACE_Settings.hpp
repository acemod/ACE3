class ACE_Settings {
    class GVAR(enabled) {
        typeName = "BOOL";
        value = 1;
        displayName = "$STR_ACE_ViewDistance_enabled_DisplayName";
        description = "$STR_ACE_ViewDistance_enabled_Description";
    };
    class GVAR(viewDistanceOnFoot) {
        typeName = "SCALAR";
        isClientSettable = 1;
        value = 11; // index, NOT value // Can set it to client's actual viewdistance in the init function once ACE_Settings supports numbers (if ever).
        values[] = {"1500","2000","2500","3000","3500","4000","5000","6000","7000","8000","9000","10000"}; // Values also need to be changed in functions/fnc_returnValue.sqf
        displayName = "$STR_ACE_ViewDistance_onFoot_DisplayName";
        description = "$STR_ACE_ViewDistance_onFoot_Description";
    };
    class GVAR(viewDistanceLandVehicle) {
        typeName = "SCALAR";
        isClientSettable = 1;
        value = 11; // index, NOT value
        values[] = {"1500","2000","2500","3000","3500","4000","5000","6000","7000","8000","9000","10000"}; // Values also need to be changed in functions/fnc_returnValue.sqf
        displayName = "$STR_ACE_ViewDistance_landVehicle_DisplayName";
        description = "$STR_ACE_ViewDistance_landVehicle_Description";
    };
    class GVAR(viewDistanceAirVehicle) {
        typeName = "SCALAR";
        isClientSettable = 1;
        value = 11; // index, NOT value
        values[] = {"1500","2000","2500","3000","3500","4000","5000","6000","7000","8000","9000","10000"}; // Values also need to be changed in functions/fnc_returnValue.sqf
        displayName = "$STR_ACE_ViewDistance_airVehicle_DisplayName";
        description = "$STR_ACE_ViewDistance_airVehicle_Description";
    };
    class GVAR(limitViewDistance) {
        typeName = "SCALAR";
        value = 10000; // Value, NOT index. 10000 is the maximum in A3
        displayName = "$STR_ACE_ViewDistance_limit_DisplayName";
        description = "$STR_ACE_ViewDistance_limit_setting";
    };
    class GVAR(objectViewDistanceCoeff) {
        typeName = "SCALAR";
        isClientSettable = 1;
        value = 0; // index. Actual coefficient is given by functions/fnc_returnObjectCoeff.sqf
        values[] = {"$STR_ACE_ViewDistance_object_off","$STR_ACE_ViewDistance_object_verylow","$STR_ACE_ViewDistance_object_low","$STR_ACE_ViewDistance_object_medium","$STR_ACE_ViewDistance_object_high","$STR_ACE_ViewDistance_object_veryhigh"};
        displayName = "$STR_ACE_ViewDistance_object_DisplayName";
        description = "$STR_ACE_ViewDistance_object_Description";
    };
};
