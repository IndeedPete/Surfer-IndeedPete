class GenericMissions
{
	clients[] = {"Contention", "Freezoners"};
	timelimit = 30; // In Minutes
 		
	class MissionTypes
	{
		class Eliminate
		{
			description = "Eliminate a %3 officer and return to %1!";
			reward = 100;
		};
		
		class Find
		{
			description = "%2 are missing a man. Find him, search his body and return to %1!";
			reward = 50;
		};
		
		class Secure
		{
			description = "Secure a laptop and return it to %1!";
			reward = 50;
		};
	};
};