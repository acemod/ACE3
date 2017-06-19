class ACE_Settings {
    class GVAR(enabled) {
        category = CSTRING(Module_DisplayName);
        typeName = "BOOL";
        value = 1;
        displayName = CSTRING(enabled_DisplayName);
        description = CSTRING(enabled_Description);
    };
    class GVAR(viewDistanceOnFoot) {
        category = CSTRING(Module_DisplayName);
        typeName = "SCALAR";
        isClientSettable = 1;
        value = 0; // index, NOT value // Can set it to client's actual viewdistance in the init function once ACE_Settings supports numbers (if ever).
        values[] = {CSTRING(videosettings), "500", "1000", "1500", "2000", "2500", "3000", "3500", "4000", "5000", "6000", "7000", "8000", "9000", "10000"}; // Values also need to be changed in functions/fnc_returnValue.sqf
        displayName = CSTRING(onFoot_DisplayName);
        description = CSTRING(onFoot_Description);
    };
    class GVAR(viewDistanceLandVehicle) {
        category = CSTRING(Module_DisplayName);
        typeName = "SCALAR";
        isClientSettable = 1;
        value = 0; // index, NOT value
        values[] = {CSTRING(videosettings), "500", "1000", "1500", "2000", "2500", "3000", "3500", "4000", "5000", "6000", "7000", "8000", "9000", "10000"}; // Values also need to be changed in functions/fnc_returnValue.sqf
        displayName = CSTRING(landVehicle_DisplayName);
        description = CSTRING(landVehicle_Description);
    };
    class GVAR(viewDistanceAirVehicle) {
        category = CSTRING(Module_DisplayName);
        typeName = "SCALAR";
        isClientSettable = 1;
        value = 0; // index, NOT value
        values[] = {CSTRING(videosettings), "500", "1000", "1500", "2000", "2500", "3000", "3500", "4000", "5000", "6000", "7000", "8000", "9000", "10000"}; // Values also need to be changed in functions/fnc_returnValue.sqf
        displayName = CSTRING(airVehicle_DisplayName);
        description = CSTRING(airVehicle_Description);
    };
    class GVAR(limitViewDistance) {
        category = CSTRING(Module_DisplayName);
        typeName = "SCALAR";
        value = 10000; // Value, NOT index. 10000 is the maximum in A3
        displayName = CSTRING(limit_DisplayName);
        description = CSTRING(limit_setting);
    };
    class GVAR(objectViewDistanceCoeff) {
        category = CSTRING(Module_DisplayName);
        typeName = "SCALAR";
        isClientSettable = 1;
        value = 0; // index. Actual coefficient is given by functions/fnc_returnObjectCoeff.sqf
        values[] = {CSTRING(object_off), CSTRING(object_verylow), CSTRING(object_low), CSTRING(object_medium),CSTRING(object_high), CSTRING(object_veryhigh), CSTRING(object_fovBased)};
        displayName = CSTRING(object_DisplayName);
        description = CSTRING(object_Description);
    };
};
