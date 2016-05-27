class CfgLights {

	class ChemLight_Green {
		ambient[] = {0,0,0,0};
		brightness = 1;
		color[] = {0.1,1,0.1,1};
		diffuse[] = {0.1,1,0.1};
		drawLight = 0;
		intensity = 1000;
		position[] = {0,0,0};
		
		class Attenuation {
			constant = 1;
			linear = 0;
			quadratic = 600;
			start = 0.15;
		};
	};

	class ChemLight_Blue: ChemLight_Green {
		color[] = {0,0.6,1,1};
		diffuse[] = {0,0.6,1};
		
		class Attenuation {
			constant = 0;
			linear = 0;
			quadratic = 600;
			start = 0.15;
		};
	};
	
	class ChemLight_Red: ChemLight_Green {
		color[] = {1,0.1,0.1,1};
		diffuse[] = {1,0.1,0.1};
		
		class Attenuation {
			constant = 0;
			linear = 0;
			quadratic = 600;
			start = 0.15;
		};
	};
	
	class ChemLight_Yellow: ChemLight_Green {
		color[] = {1,1,0.1,1};
		diffuse[] = {1,1,0.1,0.1};
		
		class Attenuation {
			constant = 0;
			linear = 0;
			quadratic = 600;
			start = 0.15;
		};
	};
	
	class ACE_ChemlightLight_Orange: ChemLight_Green {
		color[] = {1,0.4,0,1};
		diffuse[] = {1,0.4,0};
	};
	
	class ACE_ChemlightLight_White: ChemLight_Green {
		color[] = {1,1,1,1};
		diffuse[] = {1,1,1};
		intensity = 800;
	};
	
	class ACE_ChemlightLight_HiRed: ChemLight_Red {
		intensity = 4000;
		class Attenuation {
			constant = 0;
			linear = 0;
			quadratic = 200;
			start = 0.5;
		};
	};
	
	class ACE_ChemlightLight_HiYellow: ChemLight_Yellow {
		intensity = 4000;
		class Attenuation {
			constant = 0;
			linear = 0;
			quadratic = 200;
			start = 0.5;
		};
	};
	
	class ACE_ChemlightLight_HiOrange: ACE_ChemlightLight_Orange {
		intensity = 4000;
		class Attenuation {
			constant = 0;
			linear = 0;
			quadratic = 200;
			start = 0.5;
		};
	};
	
	class ACE_ChemlightLight_HiWhite: ACE_ChemlightLight_White {
		intensity = 3500;
		class Attenuation {
			constant = 0;
			linear = 0;
			quadratic = 200;
			start = 0.5;
		};
	};
};