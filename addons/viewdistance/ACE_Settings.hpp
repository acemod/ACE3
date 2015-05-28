class ACE_Settings {
    class GVAR(enabled) {
        typeName = "BOOL";
        value = 1;
        displayName = "Enable ACE viewdistance";
        description = "Enables ACE viewdistance module.";
    };
    class GVAR(viewDistanceOnFoot) {
        typeName = "SCALAR";
        isClientSettable = 1;
        value = 0; // index, NOT value // Can set it to client's actual viewdistance in the init function once ACE_Settings supports numbers (if ever).
        values[] = {"Video settings","500","1000","1500","2000","2500","3000","3500","4000","5000","6000","7000","8000","9000","10000"}; // Values also need to be changed in functions/fnc_returnValue.sqf
        displayName = "Client View Distance (On Foot)";
        description = "Changes in game view distance when the player is on foot.";
    };
    class GVAR(viewDistanceLandVehicle) {
        typeName = "SCALAR";
        isClientSettable = 1;
        value = 0; // index, NOT value
        values[] = {"Video settings","500","1000","1500","2000","2500","3000","3500","4000","5000","6000","7000","8000","9000","10000"}; // Values also need to be changed in functions/fnc_returnValue.sqf
        displayName = "Client View Distance (Land Vehicle)";
        description = "Changes in game view distance when the player is in a land vehicle.";
    };
    class GVAR(viewDistanceAirVehicle) {
        typeName = "SCALAR";
        isClientSettable = 1;
        value = 0; // index, NOT value
        values[] = {"Video settings","500","1000","1500","2000","2500","3000","3500","4000","5000","6000","7000","8000","9000","10000"}; // Values also need to be changed in functions/fnc_returnValue.sqf
        displayName = "Client View Distance (Air Vehicle)";
        description = "Changes in game view distance when the player is in an air vehicle.";
    };
    class GVAR(limitViewDistance) {
        typeName = "SCALAR";
        value = 10000; // Value, NOT index. 10000 is the maximum in A3
        displayName = "View Distance Limit";
        description = "Limit for client's view distance set here and can overridden by module";
    };
    class GVAR(objectViewDistanceCoeff) {
        typeName = "SCALAR";
        isClientSettable = 1;
        value = 0; // index. Actual coefficient is given by functions/fnc_returnObjectCoeff.sqf
        values[] = {"Off","Very Low","Low","Medium","High","Very High"};
        displayName = "Dynamic Object View Distance";
        description = "Sets the object view distance as a coefficient of the view distance.";
    };
};

// To do: include string table style displayName & description.