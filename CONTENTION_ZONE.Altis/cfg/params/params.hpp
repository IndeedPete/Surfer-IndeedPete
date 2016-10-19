// Zone
class DayLength
{
	idc = 2100;
	title = "Day Length (In minutes.)";
	texts[] = {"10", "20", "30", "40", "50", "60"};
	type = "MINUTE";
	values[] = {10, 20, 30, 40, 50, 60};
	variable = "SurfersDaytime";
	default = 40;
};
class NightLength
{
	idc = 2115;
	title = "Night Length (In minutes.)";
	texts[] = {"10", "20", "30", "40", "50", "60"};
	type = "MINUTE";
	values[] = {10, 20, 30, 40, 50, 60};
	variable = "SurfersNighttime";
	default = 10;
};
class Start
{
	idc = 2101;
	title = "Start";
	texts[] = {"Night", "Day"};
	type = "BOOLEAN";
	values[] = {0, 1};
	variable = "SURF_StartTime";
	default = 0;
};
class AcidRain
{
	idc = 2102;
	title = "Acid Rain";
	texts[] = {"Off", "On"};
	type = "BOOLEAN";
	values[] = {0, 1};
	variable = "IP_AcidRain";
	default = 1;
};
class ToxicFog
{
	idc = 2103;
	title = "Toxic Fog";
	texts[] = {"Off", "On"};
	type = "BOOLEAN";
	values[] = {0, 1};
	variable = "IP_ToxicFog";
	default = 1;
};
class Blowouts
{
	idc = 2104;
	title = "Blowouts (In minute intervals.)";
	texts[] = {"Never", "5-10", "10-20", "20-40", "30-60"};
	type = "MINUTEINTERVAL";
	values[] = {-1, 5, 10, 20, 30};
	variable = "IP_BlowoutIntervall";
	default = 10;
};
class RandomAnomalies
{
	idc = 2105;
	title = "Random Anomalies";
	texts[] = {"0", "10-20", "20-40", "40-80", "80-160"};
	type = "INTERVAL";
	values[] = {0, 10, 20, 40, 80};
	variable = "IP_RandomAnomalies";
	default = 20;
};

// Mission
class PlayIntro
{
	idc = 2106;
	title = "Play Intro";
	texts[] = {"No", "Yes"};
	type = "BOOLEAN";
	values[] = {0, 1};
	variable = "IP_ShowIntro";
	default = 1;
};
class EnableModContent
{
	idc = 2107;
	title = "Mod Weapons / Equipment - (WIP, doesn't work ATM!)";
	texts[] = {"Off", "On"};
	type = "BOOLEAN";
	values[] = {0, 1};
	variable = "IP_ModContentEnabled";
	default = 0;
};
class AutoIndexing
{
	idc = 2108;
	title = "Automated Indexing of Shop Content";
	texts[] = {"Off", "On"};
	type = "BOOLEAN";
	values[] = {0, 1};
	variable = "IP_AutoIndexing";
	default = 1;
};
class LootChance
{
	idc = 2109;
	title = "Loot Chance (%)";
	texts[] = {"0% - Disabled", "1%", "2%", "3%", "4%", "5%", "7%", "8%", "9%", "10%"};
	type = "NUMBER";
	values[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
	variable = "IP_LootChance";
	default = 1;
};

// Enemies
class RandomPatrol
{
	idc = 2110;
	title = "Random Patrols (WIP, doesn't work ATM!)";
	texts[] = {"Off", "On"};
	type = "BOOLEAN";
	values[] = {0, 1};
	variable = "IP_RandomPatrols";
	default = 1;
};
class EnemyAISkill
{
	idc = 2111;
	title = "Enemy AI Skill Level";
	texts[] = {"Civilian", "Recruit", "Paramilitary", "Soldier", "Elite", "Rambo"};
	type = "NUMBER";
	values[] = {0, 1, 2, 3, 4, 5};
	variable = "IP_EnemyAISkill";
	default = 3;
};
class WeaponsLootable
{
	idc = 2112;
	title = "Lootable Weapons from Contention Mercs";
	type = "BOOLEAN";
	texts[] = {"Off", "On"};
	values[] = {0, 1};
	variable = "IP_WeaponsLootable";
	default = 0;
};

// Player
class StartMoney
{
	idc = 2113;
	title = "Start Money";
	texts[] = {"0", "1.000", "10.000"};
	type = "NUMBER";
	values[] = {0, 1000, 10000};
	variable = "IP_StartMoney";
	default = 0;
};
class StartEquipment
{
	idc = 2114;
	title = "Start Equipment";
	texts[] = {"Naked", "Freezoner", "Mercenary"};
	type = "NUMBER";
	values[] = {0, 1, 2};
	variable = "IP_StartEquipment";
	default = 1;
};