//Create a location type that won't be drawn on the map
//Ref: https://community.bistudio.com/wiki/Location

class CfgLocationTypes {
    class ACE_HashLocation {
        color[] = {0,0,0,0};
        drawStyle = "WARNING-ACE_HashLocation_is_deprecated"; // Replaced by CBA_fnc_createNamespace
        font = "RobotoCondensed";
        importance = 5;
        name = "HashLocation";
        shadow = 0;
        size = 0;
        textSize = 0.0;
        texture = "";
    };
};
