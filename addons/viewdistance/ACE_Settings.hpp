class ACE_Settings {
    class GVAR(changeAllowed) {
        typeName = "BOOL";
        value = 1;
        displayName = "Allow View Distance Changing";
        description = "Enables changing in game view distance";
    };
    class GVAR(top_limit) {
        typeName = "SCALAR";
        values[] = {0,1,2,3,4,5,6,7,8,9,10,11}; // correspond to the index values
        displayName = "View Distance Limit";
        description = "Sets the top limit for all clients";
    };
    class GVAR(newViewDistance) {
        typeName = "SCALAR";
        isClientSettable = 1;
        //value = 1;
        values[] = {"1500","2000","2500","3000","3500","4000","5000","6000","7000","8000","9000","10000"};
        displayName = "Change View Distance";
        description = "Changes in game view distance";
    };
};

// To do: include string table style displayName & description.