class ScruffIntro
{
	arguments[] = {"(name IP_Scruff)", "(name player)", "(getText(missionConfigFile >> 'Factions' >> 'Contention' >> 'displayName'))"};
	condition = "((leader(group (_this)) == _this) && !([_this, 'Intro'] call IP_fnc_missionDone))";
	responses[] = {"ScruffIntroExit"};
	sentences[] = {
		"Who are you?",
		"%1. And you are?",
		"I'm %2. I got kidnapped by CONTENTION but escaped!",
		"Lucky you.",
		"I wouldn't call it luck. A guy called Ghost helped me out!",
		"Ghost is no guy.",
		"Oh, a girl then...",
		"You just don't get it, do you?"
	};
};
class ScruffIntroExit
{
	exit = 1;
	expression = "(group(_this select 0)) setVariable ['IP_Intro_QuestDone', true, true];";
	sentences[] = {
		"Whatever."
	};
};
class ScruffOpener
{
	arguments[] = {"(name player)"};
	condition = "([_this, 'Intro'] call IP_fnc_missionDone)";
	responses[] = {"ScruffWorkBeginning", "exit"};
	sentences[] = {
		"Hey, sitting here all alone?",
		"You ask many questions, digging up a lot of dirt! Scruff does not want trouble!"
	};
};
class ScruffBack
{
	arguments[] = {"(name(_this select 0))"};
	responses[] = {"ScruffWorkBeginning", "exit"};
	sentences[] = {
		"Something else.",
		"What else, %1? Leave Scruff alone!"
	};
};
class ScruffWorkBeginning
{
	condition = "!([(_this select 0), 'Min'] call IP_fnc_missionDone)";
	responses[] = {"ScruffBack", "exit"};
	sentences[] = {
		"Do you know there's a dead scientist in your garage?",
		"He was a spy for CONTENTION. Scruff doesn't like CONTENTION!",
		"How fortunate that I don't like them either. Mind if I borrow your Quad?",
		"Not Scruff's Quad. Take it or not. Scruff doesn't care."
	};
};
