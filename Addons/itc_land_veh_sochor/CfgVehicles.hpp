/// Magazines macros definition ///

#define mag_2(a) a, a
#define mag_3(a) a, a, a
#define mag_4(a) a, a, a, a
#define mag_5(a) a, a, a, a, a
#define mag_6(a) a, a, a, a, a, a
#define mag_7(a) a, a, a, a, a, a, a
#define mag_8(a) a, a, a, a, a, a, a, a
#define mag_9(a) a, a, a, a, a, a, a, a, a
#define mag_10(a) a, a, a, a, a, a, a, a, a, a
#define mag_11(a) a, a, a, a, a, a, a, a, a, a, a
#define mag_12(a) a, a, a, a, a, a, a, a, a, a, a, a

class CfgVehicles {
	class Tank;
	class Tank_F: Tank {
		class Turrets {
			class MainTurret;
		};
	};
	class MBT_02_base_F: Tank_F {
		class Turrets: Turrets {
				class MainTurret: MainTurret {};
		};
	};	
	class MBT_02_arty_base_F: MBT_02_base_F {
		class Turrets: Turrets {
				class MainTurret: MainTurret { };
		};
	};
		
	class itc_land_SPH02_base: MBT_02_arty_base_F {
		author = "Toadball";
		side = 0;
		faction = "OPF_F";
		crew = "O_crew_F";
		typicalCargo[] = {"O_Soldier_F", "O_Soldier_F", "O_Soldier_F"};

		class Turrets: Turrets {
			class MainTurret: MainTurret {	
				turretInfoType = "ITC_Land_RscGunnerSightSPH";			
			};
		};
		class TextureSources
		{
			class Hex
			{
				author = "Bohemia Interactive";
				textures[] = {"a3\armor_f_gamma\mbt_02\data\mbt_02_body_co.paa", "a3\armor_f_gamma\mbt_01\data\mbt_01_scorcher_hexarid_co.paa", "a3\armor_f_gamma\mbt_02\data\mbt_02_co.paa", "a3\data_f\vehicles\turret_opfor_co.paa"};
				factions[] = {"OPF_F"};
				displayName = "Hex";
			};
			class GreenHex
			{
				displayName = "Green Hex";
				author = "Bohemia Interactive";
				textures[] = {"a3\Armor_F_Exp\MBT_02\Data\MBT_02_body_ghex_CO.paa", "a3\Armor_F_Exp\MBT_02\Data\MBT_02_scorcher_ghex_CO.paa", "a3\Armor_F_Exp\MBT_02\Data\MBT_02_ghex_CO.paa", "a3\Data_F_Exp\Vehicles\Turret_ghex_CO.paa"};
				factions[] = {"OPF_T_F"};
			};
		};	
		
		textureList[] = {"Hex", 1};
		hiddenSelections[] = {"camo1", "camo2", "camo3"};			
		hiddenSelectionsTextures[] = {"a3\armor_f_gamma\mbt_02\data\mbt_02_body_co.paa", "a3\armor_f_gamma\mbt_01\data\mbt_01_scorcher_hexarid_co.paa", "a3\armor_f_gamma\mbt_02\data\mbt_02_co.paa", "a3\data_f\vehicles\turret_opfor_co.paa"};
	};
	class itc_land_sph_sochor2: itc_land_SPH02_base {
		scope = 2;
		displayName = "2S9 mod. 0 Sholef 2";
		mapSize = 12.09;
		class SimpleObject {
			eden = 1;
			animate[] = {{"damagehide", 0}, {"wheel_koll1", 0}, {"wheel_kolol1", 0}, {"wheel_podkolol1", 0.47}, {"wheel_kolp1", 0}, {"wheel_kolop1", 0}, {"wheel_podkolop1", 0.49}, {"wheel_koll2", 0}, {"wheel_kolp2", 0}, {"wheel_kolol2", 0}, {"wheel_kolol3", 0}, {"wheel_kolol4", 0}, {"wheel_kolol5", 0}, {"wheel_kolol6", 0}, {"wheel_kolol7", 0}, {"wheel_kolop2", 0}, {"wheel_kolop3", 0}, {"wheel_kolop4", 0}, {"wheel_kolop5", 0}, {"wheel_kolop6", 0}, {"wheel_kolop7", 0}, {"wheel_podkolol2", 0.48}, {"wheel_podkolol3", 0.49}, {"wheel_podkolol4", 0.49}, {"wheel_podkolol5", 0.5}, {"wheel_podkolol6", 0.5}, {"wheel_podkolop2", 0.52}, {"wheel_podkolop3", 0.52}, {"wheel_podkolop4", 0.49}, {"wheel_podkolop5", 0.57}, {"wheel_podkolop6", 0.57}, {"podkolol1_hide_damage", 0}, {"podkolol2_hide_damage", 0}, {"podkolol3_hide_damage", 0}, {"podkolol4_hide_damage", 0}, {"podkolol5_hide_damage", 0}, {"podkolol6_hide_damage", 0}, {"podkolol7_hide_damage", 0}, {"podkolol8_hide_damage", 0}, {"podkolop1_hide_damage", 0}, {"podkolop2_hide_damage", 0}, {"podkolop3_hide_damage", 0}, {"podkolop4_hide_damage", 0}, {"podkolop5_hide_damage", 0}, {"podkolop6_hide_damage", 0}, {"podkolop7_hide_damage", 0}, {"podkolop8_hide_damage", 0}, {"damagevez", 0}, {"mainturret", 0}, {"maingun", 0.17}, {"hatchcommander", 0}, {"recoil", 0}, {"obsturret", 0}, {"obsgun", 0}, {"wheel_podkolop7", 0.56}, {"wheel_podkolol7", 0.51}, {"hatchdriver", 0}, {"damagevezvelitele", 0}, {"poklop_commander_damage", 0}, {"poklop_gunner_damage", 0}, {"poklop_driver_damage", 0}, {"zaslehrot_hmg", 0}, {"recoil_2", 0}, {"driver_fan", 4773.25}, {"lights_driver", 0}, {"lights_driver_off", 0}, {"indicatorspeed", 0}, {"indicatorrpm", 0}, {"indicatorvoltammeter", 0}, {"indicatortempoil", 0}, {"indicatortempwater", 0}, {"random_light_flicker", 4773.25}, {"engine_damage_fire_indicator", 0}, {"ltrack_dmg_hide", 0}, {"rtrack_dmg_hide", 0}, {"era_front_01_hide", 0}, {"era_front_02_hide", 0}, {"era_front_03_hide", 0}, {"era_front_04_hide", 0}, {"era_front_05_hide", 0}, {"era_front_06_hide", 0}, {"era_front_07_hide", 0}, {"era_front_08_hide", 0}, {"era_front_09_hide", 0}, {"era_front_10_hide", 0}, {"maingunoptics", 0.17}, {"artillery_muzzle_flash", 0}, {"gmg_muzzle_flash", 0}, {"zaslehrot_gmg", 0}};
			hide[] = {"clan", "zasleh2", "light_l", "light_r", "bulb_turret2", "bulb_driver2", "zadni svetlo", "brzdove svetlo", "podsvit pristroju", "poskozeni"};
			verticalOffset = 2.744;
			verticalOffsetWorld = 0.008;
			init = "''";
		};	
		editorPreview = "\A3\EditorPreviews_F\Data\CfgVehicles\O_MBT_02_arty_F.jpg";
		textureList[] = {"Hex", 1};
		hiddenSelectionsTextures[] = {"a3\armor_f_gamma\mbt_02\data\mbt_02_body_co.paa", "a3\armor_f_gamma\mbt_02\data\mbt_02_turret_co.paa", "a3\armor_f_gamma\mbt_02\data\mbt_02_co.paa"};
		availableForSupportTypes[] = {"Artillery"};		
	};
};