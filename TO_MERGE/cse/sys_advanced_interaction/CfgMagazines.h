
// keep present for sometime, to allow backwards compatibility. Note: We will not support this in the code!

class CfgMagazines {
	class Default;
	class CA_magazine: Default{};
	class cse_Keycuffs: CA_magazine {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		mass = 1;
		displayName = "Keycuffs";
		picture = "cse\cse_sys_advanced_interaction\img\keycuffs.paa";
		descriptionShort = "Keycuffs, used for detaining a suspect";
	};
	class cse_HIIDE: CA_magazine {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		mass = 3;
		descriptionUse = "Biometric Scanner";
		descriptionShort = "";
		displayName = "Biometric Scanner (HIIDE)";
		picture = "cse\cse_sys_advanced_interaction\img\HIIDE.paa";
		model = "cse\cse_sys_advanced_interaction\hiide.p3d";
	 };
	 class cse_oldphone: CA_magazine {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		mass = 1;
		displayName = "Old Phone";
		picture = "cse\cse_sys_advanced_interaction\img\oldphone.paa";
		model = "cse\cse_sys_advanced_interaction\mobile.p3d";
	 };	 
	 class cse_oldphone_folded: CA_magazine {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		mass = 1;
		displayName = "Old Phone (Folded)";
		picture = "cse\cse_sys_advanced_interaction\img\oldphone.paa";
		model = "cse\cse_sys_advanced_interaction\mobile_folded.p3d";
	 };	
	 class cse_watch_expensive: CA_magazine {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		mass = 1;
		displayName = "Watch";
		picture ="cse\cse_sys_advanced_interaction\img\watch_expensive.paa";
	 };	 
	 class cse_wallet: CA_magazine {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		mass = 1;
		displayName = "Wallet";
		picture = "cse\cse_sys_advanced_interaction\img\wallet.paa";
	 };
	 class cse_9v_battery: CA_magazine {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		mass = 1;
		displayName = "9 volt battery";
		picture = "cse\cse_sys_advanced_interaction\img\9v_battery.paa"; 
		model = "\A3\Structures_F_EPA\Items\Electronics\Battery_F.p3d";
	 };	 
	 class cse_notebook: CA_magazine {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		mass = 1;
		displayName = "Notebook";
		picture = "cse\cse_sys_advanced_interaction\img\notebook.paa";
	 };
	 class cse_scissors: CA_magazine {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		mass = 1;
		displayName = "Scissors";
		picture = "cse\cse_sys_advanced_interaction\img\scissor.paa";
	 }	; 
	 class cse_wires: CA_magazine {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		mass = 1;
		displayName = "Wires";
		picture = "cse\cse_sys_advanced_interaction\img\wires.paa";
	 };
};