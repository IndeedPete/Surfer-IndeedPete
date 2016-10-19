class ShopCampEnhancements
{
	class CheckpointBig
    {
        buildTime = 2;
		description = "Deploys a checkpoint on the main road leading through the defences to Grammendorf from the south with bargates, statics, and additional guards.";
		marker[] = {"mCheckpointBig1","mCheckpointBig2"};
		price = 30000;
		title = "Checkpoint on Main Road";
    };
	class CheckpointSmall
    {
        buildTime = 1;
		description = "Deploys a checkpoint on the small road leading through the defences to the Großbrand Military Base from the south with bargates, statics, and additional guards.";
		marker = "mCheckpointSmall";
		price = 25000;
		title = "Checkpoint on Side Road";
    };
	class Contractors
	{
        buildTime = 12;
		description = "Deploys 50 private military contractors at 10.000 HM per contract at the defences at Großbrand. If possible, a full mercenary squad under high command of Veikko Halla will be deployed on missions.";
		price = 500000;
		title = "Contractors";
    };
	class Garage
    {
        buildTime = 24;
		description = "A large garage with space for four ground vehicles.";
		garage = 4;
		marker = "mGarage";
		price = 100000;
		title = "Garage";
    };
	class HeliPad1
    {
        buildTime = 3;
		description = "Deploys a heli pad for one helicopter, including maintenance material.";
		hangar = 1;
		marker = "mHeliPad1";
		price = 25000;
		title = "Heli Pad";
    };
	class HeliPad2
    {
        buildTime = 3;
		description = "Deploys an additional heli pad for one helicopter, including maintenance material.";
		hangar = 1;
		marker = "mHeliPad2";
		price = 20000;
		title = "Additional Heli Pad";
    };
	class Mortar
    {
        buildTime = 1;
		description = "Deploys a mortar team which can be called for support during a mission if possible and in range.";
		marker = "mMortar";
		price = 15000;
		title = "Mortar";
    };
	class Minefield
    {
        description = "Deploys anti-infantry minefields directly south of the defences at Großbrand. The minefields will be deployed the next time Veikko Halla returns from a mission.";
		price = 40000;
		title = "Minefields";
    };
	class Statics
    {
        buildTime = 4;
		description = "Deploys static AA/AT-Launchers, MGs, and GLs along the Großbrand defences.";
		price = 170000;
		title = "Statics";
    };
	class Tanks
    {
        buildTime = 8;
		description = "Deploys MBTs and IFVs to strategically important positions around the Großbrand defences.";
		price = 1000000;
		title = "Tanks";
    };
};