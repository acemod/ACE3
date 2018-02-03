class CfgACEArsenalStats {
    class statBase {
        scope = 1;
        stats[]= {};
        displayName= "";
        showBar= 0;
        showText= 0;
        arguments[]= {};
        barStatement = "";
        textStatement = "";
        condition = "true";
        tabs[]= {{}, {}};
    };
    class bananaPotassium: statBase {
        scope = 2;
        displayName= CSTRING(statPotassium);
        showBar= 1;
        showText= 0;
        barStatement = "1";
        condition = "((configName (_this select 1)) == 'ACE_Banana')";
        tabs[]= {{}, {7}};
    };
};
