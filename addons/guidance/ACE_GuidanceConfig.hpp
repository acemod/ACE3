
class GVAR(flightProfileTypes) {

    class flightProfileDefault {
        name = "Default";
        
        function = QFUNC(flightProfileDefault);
    };
    
    class flightProfileDirect {
        name = "Direct";
        
        function = QFUNC(flightProfileDirect);
    };
    
    class flightProfileIndirect {
        name = "Indirect";
        
        function = QFUNC(flightProfileIndirect);
    };
    
    class flightProfileGBU {
        name = "Guided Bomb Unit";
        
        function = QFUNC(flightProfileGBU);
    };
    
    class flightProfileAAM {
        name = "Anti-Air Missile";
        
        function = QFUNC(flightProfileAAM);
    };

    class flightProfileAGM {
        name = "Anti-Ground Missile";
        
        function = QFUNC(flightProfileAGM);
    };
    
};



class GVAR(SeekerTypes) {

    class seekerDefault {
        name = "Default";
        
        ACEModes[] = {};
        slaves[] = {};
        
        seekerDirection[] = {};
        sensors[] = {"EO"};
        
        priority = 100;
        
        miscFunction = QFUNC(seekerDefaultMisc);
    };

    class seekerSALH {
        name = "Default SALH";
        
        ACEModes[] = {};
        slaves[] = {};
        
        seekerDirection[] = {};
        sensors[] = {"sensorDefault"};
        
        priority = 100;
        
        miscFunction = QFUNC(seekerSALHMisc);
    };

    class seekerSACLOS {
        name = "Default SACLOS";
        
        ACEModes[] = {};
        slaves[] = {};
        
        seekerDirection[] = {};
        sensors[] = {"sensorDefault"};
        
        priority = 100;
        
        miscFunction = QFUNC(seekerSACLOSMisc);
    };

    class seekerMCLOS {
        name = "Default MCLOS";
        
        ACEModes[] = {};
        slaves[] = {};
        
        seekerDirection[] = {};
        sensors[] = {"sensorDefault"};
        
        priority = 100;
        
        miscFunction = QFUNC(seekerMCLOSMisc);
    };
    
    class seekerPLOS {
        name = "Default PLOS";
        
        ACEModes[] = {};
        slaves[] = {};
        
        seekerDirection[] = {};
        sensors[] = {"sensorDefault"};
        
        priority = 100;
        
        miscFunction = QFUNC(seekerPLOSMisc);
    };
    
    class seekerACLOS {
        name = "Default ACLOS";
        
        ACEModes[] = {};
        slaves[] = {};
        
        seekerDirection[] = {};
        sensors[] = {"sensorDefault"};
        
        priority = 100;
        
        miscFunction = QFUNC(seekerACLOSMisc);
    };

    class seekerAAIR {
        name = "Default AAIR";
        
        ACEModes[] = {};
        slaves[] = {};
        
        seekerDirection[] = {};
        sensors[] = {"sensorDefault"};
        
        priority = 100;
        
        miscFunction = QFUNC(seekerAAIRMisc);
    };

    class seekerAAIRUV {
        name = "Default AAIRUV";
        
        ACEModes[] = {};
        slaves[] = {};
        
        seekerDirection[] = {};
        sensors[] = {"sensorDefault"};
        
        priority = 100;
        
        miscFunction = QFUNC(seekerAAIRUVMisc);
    };

    class seekerGPS {
        name = "Default GPS";
        
        ACEModes[] = {};
        slaves[] = {};
        
        seekerDirection[] = {};
        sensors[] = {"sensorDefault"};
        
        priority = 0.1;
        
        miscFunction = QFUNC(seekerGPSMisc);
    };
    class seekerARM {
        name = "Default AntiRadiation Missile";
        
        ACEModes[] = {};
        slaves[] = {};
        
        seekerDirection[] = {};
        sensors[] = {"AR"};
        
        priority = 10000;
        
        miscFunction = QFUNC(seekerARMMisc);
    };




    class TitanAT {
        name = "Titan Anti-Tank";
        
        ACEModes[] = {};
        slaves[] = {};
        
        seekerDirection[] = {};
        sensors[] = {"sensorDefault"};
        
        priority = 100;
        
        miscFunction = "";
    };
    class Maverick {
        name = "Maverick";
        
        ACEModes[] = {};
        slaves[] = {};
        
        seekerDirection[] = {};
        sensors[] = {"EO"};
        
        priority = 100;
        
        miscFunction = "";
    };
    class MCLOS {
        name = "Manual Command Line-of-Sight";
        
        ACEModes[] = {};
        slaves[] = {};
        
        seekerDirection[] = {};
        sensors[] = {"MCLOS"};
        
        priority = 100;
        
        miscFunction = "";
    };
    class AIMIR {
        name = "Air-Intercept Missile, InfraRed";
        
        ACEModes[] = {};
        slaves[] = {};
        
        seekerDirection[] = {};
        sensors[] = {"AAIR"};
        
        priority = 100;
        
        miscFunction = "";
    };
    class LGB {
        name = "Laser-Guided Bomb";
        
        ACEModes[] = {};
        slaves[] = {};
        
        seekerDirection[] = {};
        sensors[] = {"SALH"};
        
        priority = 100;
        
        miscFunction = "";
    };
    class SDB {
        name = "Small-Diameter Bomb";
        
        ACEModes[] = {};
        slaves[] = {};
        
        seekerDirection[] = {};
        sensors[] = {"GPS"};
        
        priority = 10000;
        
        miscFunction = "";
    };

};


class GVAR(SensorTypes) {

    class sensorDefault {
        name = "Default";

        range = 2500;
        angle = 30;
        lookAngle = 20;
        priority = 100000;
        
        function = QFUNC(sensorDefault);
        
        miscFunction = QFUNC(sensorDefaultMisc);
    };
    class SALH {
        name = "Semi-Active Laser Homing";

        range = 0;
        angle = 0;
        lookAngle = 0;
        priority = 100000;
        
        function = QFUNC(sensorSALH);
        
        miscFunction = QFUNC(sensorSALHMisc);
    };
    class EO {
        name = "ElectroOptical";

        range = 5000;
        angle = 60;
        lookAngle = 10;
        priority = 100000;
        
        function = QFUNC(sensorEO);
        
        miscFunction = QFUNC(sensorEOMisc);
    };
    class GPS {
        name = "GPS";

        range = 0;
        angle = 0;
        lookAngle = 0;
        priority = 1;
        
        function = QFUNC(sensorGPS);
        
        miscFunction = QFUNC(sensorGPSMisc);
    };
    class AAIR {
        name = "Anti-Air InfraRed";

        range = 0;
        angle = 0;
        lookAngle = 0;
        priority = 100000;
        
        function = QFUNC(sensorAAIR);
        
        miscFunction = QFUNC(sensorAAIRMisc);
    };
    class AAUV {
        name = "Anti-Air UltraViolet";

        range = 0;
        angle = 0;
        lookAngle = 0;
        priority = 100000;
        
        function = QFUNC(sensorAAUVMisc);
        
        miscFunction = QFUNC(sensorAAUVMisc);
    };
    class SACLOS {
        name = "Semi-Active Command Line-of-Sight";

        range = 0;
        angle = 0;
        lookAngle = 0;
        priority = 100000;
        
        function = QFUNC(sensorSACLOS);
        
        miscFunction = QFUNC(sensorSACLOSMisc);
    };
    class MCLOS {
        name = "Manual Command Line-of-Sight";

        range = 0;
        angle = 0;
        lookAngle = 0;
        priority = 100000;
        
        function = QFUNC(sensorMCLOS);
        
        miscFunction = QFUNC(sensorMCLOSMisc);
    };
    class AR {
        name = "Anti-Radar";

        range = 0;
        angle = 0;
        lookAngle = 0;
        priority = 100000;
        
        function = QFUNC(sensorAR);
        
        miscFunction = QFUNC(sensorARMisc);
    };    
};


class GVAR(FuzeTypes) {

    class fuzeDefault {
        name = "Default";
        
        function = QFUNC(flightProfileDefault);
    };

};