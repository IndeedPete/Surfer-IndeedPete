class gravediggerOpener
{
	arguments[] = {"(name player)"};
	responses[] = {"gravediggerName", "gravediggerDo", "gravediggerM02Done", "gravediggerM03Description", "gravediggerM03Done", "gravediggerM04Description", "exit"};
	sentences[] = {
		"Hi there!",
		"Hello, %1. Feeling well today? Or maybe not?"
	};
};
class gravediggerBack
{
	arguments[] = {"(name(_this select 0))"};
	responses[] = {"gravediggerName", "gravediggerDo", "gravediggerM02Done", "gravediggerM03Description", "gravediggerM03Done", "gravediggerM04Description", "exit"};
	sentences[] = {
		"I've got something else on my mind.",
		"Ask your questions. As long as your voice is still working."
	};
};
class gravediggerName
{
	responses[] = {"gravediggerDo", "gravediggerBack", "exit"};
	sentences[] = {
		"How do you know my name?",
		"I just do. You know, many people believe the dead could talk to them in their dreams. Maybe the dead whispered in my ear during the night. Would you believe that?",
		"Not really?",
		"No, you're right. The dead can't talk to me in my dreams because I never sleep. So, I just do know your name."
	};
};
class gravediggerDo
{
	responses[] = {"gravediggerName", "gravediggerBack", "exit"};
	sentences[] = {
		"What are you doing here?",
		"I am burning their corpses. My children's corpses. Before they get up again. Empty yet full, full of hate.",
		"Your children?!",
		"In a world where the dead by far outnumber the living someone should be committed to the needs of the majority, yet no-one does. No-one but me. I thought that was obvious.",
		"Yeah, right. How could I miss that..."
	};
};
class gravediggerM02Done
{
	arguments[] = {"(name IP_Dealer)"};
	condition = "(leader(group (_this select 0)) == (_this select 0)) && ((group(_this select 0)) getVariable ['IP_M02_Started', false]) && !([(_this select 0), 'M02'] call IP_fnc_missionDone)";
	responses[] = {"gravediggerM03DescriptionBypass", "gravediggerBack", "exit"};
	expression = "(group(_this select 0)) setVariable ['IP_M02_QuestDone', true, true];";
	sentences[] = {
		"%1 sends me. You know something about his assistant and the thing he was looking for?",
		"I do.",
		"And? Keen to share anything?",
		"No. Unless you can give me something..."
	};
};
class gravediggerM03DescriptionBypass
{
	responses[] = {"gravediggerM03Accept", "gravediggerBack", "exit"};
	sentences[] = {
		"Okay, what do you want?",
		"Get my children before they walk again. There is a factory just south of here. Five of your kind found death there. Their greed drove them right into my arms. I have a truck behind the crematory. Use it to load up my children and drive them back to me. Before they walk again..."
	};
};	
class gravediggerM03Description
{
	condition = "(leader(group (_this select 0)) == (_this select 0)) && ([(_this select 0), 'M02'] call IP_fnc_missionDone) && !([(_this select 0), 'M03'] call IP_fnc_missionDone) && !((group(_this select 0)) getVariable ['IP_M03_Started', false])";
	responses[] = {"gravediggerM03Accept", "gravediggerBack", "exit"};
	sentences[] = {
		"Okay, what do you want?",
		"Get my children before they walk again. There is a factory just south of here. Five of your kind found death there, their greed drove them right into my arms. I have a truck behind the crematory. Use it to load up my children and drive them back to me. Before they walk again..."
	};
};	
class gravediggerM03Accept
{
	exit = 1;
	expression = "['M03', [(_this select 0)]] call IP_fnc_startMission;";
	sentences[] = {"Okay..."};
};
class gravediggerM03Done
{
	condition = "(leader(group (_this select 0)) == (_this select 0)) && !([(_this select 0), 'M03'] call IP_fnc_missionDone) && !(isNil 'IP_M03_Truck') && !(isNil 'IP_M03_DeadBodies') && {IP_M03_Truck distance IP_Gravedigger <= 10} && {{_x getVariable ['IP_InTuck', false]} count IP_M03_DeadBodies == count IP_M03_DeadBodies}";
	responses[] = {"gravediggerM04DescriptionBypass", "gravediggerBack", "exit"};
	expression = "(group(_this select 0)) setVariable ['IP_M03_QuestDone', true, true];";
	sentences[] = {
		"You could have told me that this place is crawling with zombies!",
		"Ah, so you've met the doomed. The ones I couldn't save. But did you succeed?",
		"Yeah, they're on the truck.",
		"You did your part of the bargain. Take my apologies. And the truck if you wish."
	};
};
class gravediggerM04DescriptionBypass
{
	arguments[] = {"getText(missionConfigFile >> 'Factions' >> 'Contention' >> 'displayName')"};
	responses[] = {"gravediggerM04Accept", "gravediggerBack", "exit"};
	sentences[] = {
		"What now? You still owe me an answer, remember?",
		"I do. The breadcrumbs lead to a man which refers to himself as 'Ghost'. If my information is accurate, you had contact with that particular person already. He was the one who set you free, the one who saved you from %1. Ghost possesses the knowledge you seek, but to find him, you should return to your employer first."
	};
};	
class gravediggerM04Description
{
	condition = "(leader(group (_this select 0)) == (_this select 0)) && ([(_this select 0), 'M03'] call IP_fnc_missionDone) && !([(_this select 0), 'M04'] call IP_fnc_missionDone) && !((group(_this select 0)) getVariable ['IP_M04_Started', false])";
	responses[] = {"gravediggerM04Accept", "gravediggerBack", "exit"};
	sentences[] = {
		"What now? You still owe me an answer, remember?",
		"I do. The breadcrumbs lead to a man which refers to himself as 'Ghost'. If my information is accurate, you had contact with that particular person already. He was the one who set you free, the one who saved you from %1. Ghost possesses the knowledge you seek, but to find him, you should return to your employer first."
	};
};	
class gravediggerM04Accept
{
	exit = 1;
	expression = "['M04', [(_this select 0)]] call IP_fnc_startMission;";
	sentences[] = {"Alright, thanks I guess."};
};