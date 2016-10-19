class dealerIntro
{
	arguments[] = {"(name IP_Dealer)", "(name player)", "(getText(missionConfigFile >> 'Factions' >> 'Contention' >> 'displayName'))"};
	condition = "((leader(group (_this)) == _this) && !([_this, 'Intro'] call IP_fnc_missionDone))";
	responses[] = {"dealerIntroExit"};
	sentences[] = {
		"Hey, are you %1?",
		"Yes, who are you, my friend? I don't know you. What brings you to my shop?",
		"I'm %2. I- I was driving. On the road. Back home I mean. Then I saw a light. They- they kidnapped me. They- I- I was held prisoner by them. Then there was gunfire and explosions. And this guy. I escaped. Somehow.",
		"Ah, yes, I heard the shots. You're lucky then, %2. Not many survive %3. Have some tea to calm down. First one's on the house. You'll probably stay here for a while. I suggest you talk to people. And then you come back to buy something, yes?"
	};
};
class dealerIntroExit
{
	exit = 1;
	expression = "(group(_this select 0)) setVariable ['IP_Intro_QuestDone', true, true];";
	sentences[] = {
		"Okay. Okay - thank you. It's better now."
	};
};
class dealerOpener
{
	arguments[] = {"(name player)"};
	condition = "([_this, 'Intro'] call IP_fnc_missionDone)";
	responses[] = {"dealerWorkBeginning", "dealerBuySomething", "dealerJob", "dealerM00Description", "dealerM00Done", "dealerM02Description", "dealerM04Done", "dealerM05Description", "exit"};
	sentences[] = {
		"Hey.",
		"As-salamu alaykum, %1. You want to buy something, yes? Use the shop terminal, very good prices!"
	};
};
class dealerBack
{
	arguments[] = {"(name(_this select 0))"};
	responses[] = {"dealerWorkBeginning", "dealerBuySomething", "dealerJob", "dealerM00Description", "dealerM00Done", "dealerM02Description", "dealerM04Done", "dealerM05Description", "exit"};
	sentences[] = {
		"Something else.",
		"Yes, want some tea, %1? Only 5 Euro!"
	};
};
class dealerWorkBeginning
{
	condition = "!([(_this select 0), 'Min'] call IP_fnc_missionDone)";
	responses[] = {"dealerBack", "exit"};
	sentences[] = {
		"Got something to do for me?",
		"No, can't use a rookie like you. Talk to Hawkeye, he'll show you the basics, then come back to me."
	};
};
class dealerBuySomething
{
	responses[] = {"dealerBack", "exit"};
	sentences[] = {
		"How can I buy something?",
		"Just log in at the shop terminal in front of you. Here, use the laptop, you see?"
	};
};
class dealerJob
{
	condition = "(leader(group (_this select 0)) == (_this select 0)) && ([(_this select 0), 'M00'] call IP_fnc_missionDone)";
	exit = 1;
	expression = "[(_this select 1), (_this select 0)] call IP_fnc_missionDispatcher;";
	sentences[] = {"Got a job? (Start generic mission.)"};
};
class dealerM00Description
{
	condition = "(leader(group (_this select 0)) == (_this select 0)) && ([(_this select 0), 'Min'] call IP_fnc_missionDone) && !([(_this select 0), 'M00'] call IP_fnc_missionDone) && !((group(_this select 0)) getVariable ['IP_M00_Started', false])";
	responses[] = {"dealerM00Accept", "dealerBack", "exit"};
	sentences[] = {
		"Hey, uh, got anything to do for me now?",
		"Yes, in fact. I've sent out my assistant to retrieve some - let's say - valuable asset for me. He took a car and should have been back an hour ago. Would you mind taking a look? I'm pretty sure he took the coastal dirt road from Stavros. Bring him back and I'll make it worth your while, let's say 50 Euro?"
	};
};	
class dealerM00Accept
{
	exit = 1;
	expression = "['M00', [(_this select 0)]] call IP_fnc_startMission;";
	sentences[] = {"Alright, I'm going."};
};	
class dealerM00Done
{
	condition = "(leader(group (_this select 0)) == (_this select 0)) && ((group(_this select 0)) getVariable ['IP_M00_AssistantFound', false]) && !([(_this select 0), 'M00'] call IP_fnc_missionDone)";
	responses[] = {"dealerBack", "exit"};
	expression = "(group(_this select 0)) setVariable ['IP_M00_QuestDone', true, true];";
	sentences[] = {
		"About your assistant...",
		"Yes? Yes?",
		"He's dead. Found him on the road in a pool of blood, his car shredded to pieces.",
		"Ugh, this idiot! Did you search his body? Did he have something? A small package maybe?",
		"Nope.",
		"Hm, too bad. I got to think, here's your money. Come back later."
	};
};
class dealerM02Description
{
	condition = "(leader(group(_this select 0)) == (_this select 0)) && ([(_this select 0), 'M01'] call IP_fnc_missionDone) && !([(_this select 0), 'M02'] call IP_fnc_missionDone) && !((group(_this select 0)) getVariable ['IP_M02_Started', false])";
	responses[] = {"dealerM02Accept", "dealerBack", "exit"};
	sentences[] = {
		"So, how's your search going?",
		"Horrible. I really need this - listen, could you check a lead for me? I know that my assistant went to the Gravedigger to check the lead in the first place.",
		"The 'Gravedigger'?",
		"Yes, he's the type of guy you don't want to mess with. Well, he is kind of creepy. Anyway, he runs a crematory at these coords. Go there and ask about this thing!"
	};
};	
class dealerM02Accept
{
	exit = 1;
	expression = "['M02', [(_this select 0)]] call IP_fnc_startMission;";
	sentences[] = {"Alright, off to another great job!"};
};
class dealerM04Done
{
	condition = "(leader(group (_this select 0)) == (_this select 0)) && ((group(_this select 0)) getVariable ['IP_M04_Started', false]) && !([(_this select 0), 'M04'] call IP_fnc_missionDone)";
	responses[] = {"dealerBack", "exit"};
	expression = "(group(_this select 0)) setVariable ['IP_M04_QuestDone', true, true];";
	sentences[] = {
		"I've talked to that Gravedigger guy.",
		"So, so?",
		"After doing a rather dirty job for him he told me to contact a guy named 'Ghost'.",
		"Ghost! Oh hell, I need to think. In the meantime, that mercenary downstairs has work for you."
	};
};
class dealerM05Description
{
	condition = "(leader(group (_this select 0)) == (_this select 0)) && ([(_this select 0), 'M01'] call IP_fnc_missionDone) && !([(_this select 0), 'M05'] call IP_fnc_missionDone) && (isNil 'IP_M05_Running')";
	responses[] = {"dealerM05Accept", "dealerBack", "exit"};
	sentences[] = {
		"I'm looking for some more interesting work.",
		"Ah, I'm glad you ask. A pack of zombie wolves is causing sleepless nights for everyone here at the camp. They're lurking around the old diesel power plant just east of here. We all chipped in and offer 100 Euro for the group that kills these beasts. What do you say, are you man enough to take on a pack of mutated wolfs?"
	};
};	
class dealerM05Accept
{
	exit = 1;
	expression = "['M05', [(_this select 0)]] call IP_fnc_startMission;";
	sentences[] = {"Okay, I'll do it."};
};