class CfgVehicles {
	class Man;
    class CAManBase: Man
    {
        class ACE_SelfActions
        {
            #include "ACE_Medical_SelfActions.hpp"
        };
        class ACE_Actions
        {
            #include "ACE_Medical_Actions.hpp"
        };
    };
    class B_Soldier_F;
    class OPTRE_UNSC_ODST_Soldier: B_Soldier_F
    {
    	class Hitpoints{
    		class HitFace
        	{
                armor=1;
                material=-1;
                name="neck";
                passThrough=1;
                radius=0.079999998;
                explosionShielding=0.5;
                minimalHit=0.0099999998;
        	};
    		class HitArms
        	{
                armor=1;
                material=-1;
                name="arms";
                passThrough=1;
                radius=0.079999998;
                explosionShielding=1;
                minimalHit=0.0099999998;
        	};
        	class HitPelvis
        	{
                armor=1;
                material=-1;
                name="pelvis";
                passThrough=1;
                radius=0.1499999998;
                explosionShielding=0.5;
                minimalHit=0.0099999998;
        	};
	        class HitNeck
	        {
	            armor=1;
	            material=-1;
	            name="head";
	            passThrough=1;
	            radius=0.1;
	            explosionShielding=0.5;
	            minimalHit=0.0099999998;
	        };
	        class HitAbdomen
	        {
                armor=1;
                material=-1;
                name="spine1";
                passThrough=1;
                radius=0.15000001;
                explosionShielding=5;
                visual="injury_body";
                minimalHit=0.0099999998;
	        };
	        class HitDiaphragm
	        {
                armor=1;
                material=-1;
                name="spine2";
                passThrough=1;
                radius=0.15000001;
                explosionShielding=6;
                visual="injury_body";
                minimalHit=0.0099999998;
	        };
	        class HitChest
	        {
                armor=1;
                material=-1;
                name="spine3";
                passThrough=1;
                radius=0.15000001;
                explosionShielding=6;
                visual="injury_body";
                minimalHit=0.0099999998;
        	};
	        class HitLeftArm
	        {
                armor=1;
                material=-1;
                name="left arm";
                passThrough=1;
                radius=0.079999998;
                explosionShielding=3;
                visual="injury_hands";
                minimalHit=0.0099999998;
	        };
	        class HitRightArm
	        {
                armor=1;
                material=-1;
                name="right arm";
                passThrough=1;
                radius=0.079999998;
                explosionShielding=3;
                visual="injury_hands";
                minimalHit=0.0099999998;
        	};
	        class HitLeftLeg
	        {
                armor=2;
                material=-1;
                name="left leg";
                passThrough=1;
                radius=0.1;
                explosionShielding=3;
                visual="injury_legs";
                minimalHit=0.0099999998;
	        };
	        class HitRightLeg
	        {
                armor=2;
                material=-1;
                name="right leg";
                passThrough=1;
                radius=0.1;
                explosionShielding=3;
                visual="injury_legs";
                minimalHit=0.0099999998;
        	};
    	};
    };
    class OPTRE_UNSC_Marine_Soldier: B_Soldier_F
    {
    	class Hitpoints{
    		class HitFace
        	{
                armor=1;
                material=-1;
                name="neck";
                passThrough=1;
                radius=0.079999998;
                explosionShielding=0.5;
                minimalHit=0.0099999998;
        	};
    		class HitArms
        	{
                armor=1;
                material=-1;
                name="arms";
                passThrough=1;
                radius=0.079999998;
                explosionShielding=1;
                minimalHit=0.0099999998;
        	};
        	class HitPelvis
        	{
                armor=1;
                material=-1;
                name="pelvis";
                passThrough=1;
                radius=0.1499999998;
                explosionShielding=0.5;
                minimalHit=0.0099999998;
        	};
	        class HitNeck
	        {
	            armor=1;
	            material=-1;
	            name="head";
	            passThrough=1;
	            radius=0.1;
	            explosionShielding=0.5;
	            minimalHit=0.0099999998;
	        };
	        class HitAbdomen
	        {
                armor=1;
                material=-1;
                name="spine1";
                passThrough=1;
                radius=0.15000001;
                explosionShielding=5;
                visual="injury_body";
                minimalHit=0.0099999998;
	        };
	        class HitDiaphragm
	        {
                armor=1;
                material=-1;
                name="spine2";
                passThrough=1;
                radius=0.15000001;
                explosionShielding=6;
                visual="injury_body";
                minimalHit=0.0099999998;
	        };
	        class HitChest
	        {
                armor=1;
                material=-1;
                name="spine3";
                passThrough=1;
                radius=0.15000001;
                explosionShielding=6;
                visual="injury_body";
                minimalHit=0.0099999998;
        	};
	        class HitLeftArm
	        {
                armor=1;
                material=-1;
                name="left arm";
                passThrough=1;
                radius=0.079999998;
                explosionShielding=3;
                visual="injury_hands";
                minimalHit=0.0099999998;
	        };
	        class HitRightArm
	        {
                armor=1;
                material=-1;
                name="right arm";
                passThrough=1;
                radius=0.079999998;
                explosionShielding=3;
                visual="injury_hands";
                minimalHit=0.0099999998;
        	};
	        class HitLeftLeg
	        {
                armor=2;
                material=-1;
                name="left leg";
                passThrough=1;
                radius=0.1;
                explosionShielding=3;
                visual="injury_legs";
                minimalHit=0.0099999998;
	        };
	        class HitRightLeg
	        {
                armor=2;
                material=-1;
                name="right leg";
                passThrough=1;
                radius=0.1;
                explosionShielding=3;
                visual="injury_legs";
                minimalHit=0.0099999998;
        	};
    	};
    };
    class OPTRE_UNSC_Army_Soldier_WDL: B_Soldier_F
    {
    	class Hitpoints{
    		class HitFace
        	{
                armor=1;
                material=-1;
                name="neck";
                passThrough=1;
                radius=0.079999998;
                explosionShielding=0.5;
                minimalHit=0.0099999998;
        	};
    		class HitArms
        	{
                armor=1;
                material=-1;
                name="arms";
                passThrough=1;
                radius=0.079999998;
                explosionShielding=1;
                minimalHit=0.0099999998;
        	};
        	class HitPelvis
        	{
                armor=1;
                material=-1;
                name="pelvis";
                passThrough=1;
                radius=0.1499999998;
                explosionShielding=0.5;
                minimalHit=0.0099999998;
        	};
	        class HitNeck
	        {
	            armor=1;
	            material=-1;
	            name="head";
	            passThrough=1;
	            radius=0.1;
	            explosionShielding=0.5;
	            minimalHit=0.0099999998;
	        };
	        class HitAbdomen
	        {
                armor=1;
                material=-1;
                name="spine1";
                passThrough=1;
                radius=0.15000001;
                explosionShielding=5;
                visual="injury_body";
                minimalHit=0.0099999998;
	        };
	        class HitDiaphragm
	        {
                armor=1;
                material=-1;
                name="spine2";
                passThrough=1;
                radius=0.15000001;
                explosionShielding=6;
                visual="injury_body";
                minimalHit=0.0099999998;
	        };
	        class HitChest
	        {
                armor=1;
                material=-1;
                name="spine3";
                passThrough=1;
                radius=0.15000001;
                explosionShielding=6;
                visual="injury_body";
                minimalHit=0.0099999998;
        	};
	        class HitLeftArm
	        {
                armor=1;
                material=-1;
                name="left arm";
                passThrough=1;
                radius=0.079999998;
                explosionShielding=3;
                visual="injury_hands";
                minimalHit=0.0099999998;
	        };
	        class HitRightArm
	        {
                armor=1;
                material=-1;
                name="right arm";
                passThrough=1;
                radius=0.079999998;
                explosionShielding=3;
                visual="injury_hands";
                minimalHit=0.0099999998;
        	};
	        class HitLeftLeg
	        {
                armor=2;
                material=-1;
                name="left leg";
                passThrough=1;
                radius=0.1;
                explosionShielding=3;
                visual="injury_legs";
                minimalHit=0.0099999998;
	        };
	        class HitRightLeg
	        {
                armor=2;
                material=-1;
                name="right leg";
                passThrough=1;
                radius=0.1;
                explosionShielding=3;
                visual="injury_legs";
                minimalHit=0.0099999998;
        	};
    	};
    };
    class OPTRE_UNSC_Airforce_Soldier: B_Soldier_F
    {
    	class Hitpoints{
    		class HitFace
        	{
                armor=1;
                material=-1;
                name="neck";
                passThrough=1;
                radius=0.079999998;
                explosionShielding=0.5;
                minimalHit=0.0099999998;
        	};
    		class HitArms
        	{
                armor=1;
                material=-1;
                name="arms";
                passThrough=1;
                radius=0.079999998;
                explosionShielding=1;
                minimalHit=0.0099999998;
        	};
        	class HitPelvis
        	{
                armor=1;
                material=-1;
                name="pelvis";
                passThrough=1;
                radius=0.1499999998;
                explosionShielding=0.5;
                minimalHit=0.0099999998;
        	};
	        class HitNeck
	        {
	            armor=1;
	            material=-1;
	            name="head";
	            passThrough=1;
	            radius=0.1;
	            explosionShielding=0.5;
	            minimalHit=0.0099999998;
	        };
	        class HitAbdomen
	        {
                armor=1;
                material=-1;
                name="spine1";
                passThrough=1;
                radius=0.15000001;
                explosionShielding=5;
                visual="injury_body";
                minimalHit=0.0099999998;
	        };
	        class HitDiaphragm
	        {
                armor=1;
                material=-1;
                name="spine2";
                passThrough=1;
                radius=0.15000001;
                explosionShielding=6;
                visual="injury_body";
                minimalHit=0.0099999998;
	        };
	        class HitChest
	        {
                armor=1;
                material=-1;
                name="spine3";
                passThrough=1;
                radius=0.15000001;
                explosionShielding=6;
                visual="injury_body";
                minimalHit=0.0099999998;
        	};
	        class HitLeftArm
	        {
                armor=1;
                material=-1;
                name="left arm";
                passThrough=1;
                radius=0.079999998;
                explosionShielding=3;
                visual="injury_hands";
                minimalHit=0.0099999998;
	        };
	        class HitRightArm
	        {
                armor=1;
                material=-1;
                name="right arm";
                passThrough=1;
                radius=0.079999998;
                explosionShielding=3;
                visual="injury_hands";
                minimalHit=0.0099999998;
        	};
	        class HitLeftLeg
	        {
                armor=2;
                material=-1;
                name="left leg";
                passThrough=1;
                radius=0.1;
                explosionShielding=3;
                visual="injury_legs";
                minimalHit=0.0099999998;
	        };
	        class HitRightLeg
	        {
                armor=2;
                material=-1;
                name="right leg";
                passThrough=1;
                radius=0.1;
                explosionShielding=3;
                visual="injury_legs";
                minimalHit=0.0099999998;
        	};
    	};
    };
};