class rivalOpener
{
	condition = "([_this, 'Intro'] call IP_fnc_missionDone)";
	responses[] = {"rivalM06Description", "rivalM06Done", "rivalM07Description", "rivalWho", "rivalUniform", "exit"};
	sentences[] = {
		"Hello?",
		"..."
	};
};
class rivalBack: rivalOpener
{
	condition = "true";
	sentences[] = {
		"Back to my other questions.",
		"Ask."
	};
};
class rivalWho
{
	arguments[] = {"(name IP_Rival)"};
	responses[] = {"rivalUniform", "rivalBack", "exit"};
	sentences[] = {
		"So, who are you?",
		"Name's %1."
	};
};
class rivalUniform
{
	arguments[] = {"getText(missionConfigFile >> 'Factions' >> 'Contention' >> 'displayName')"};
	responses[] = {"rivalContention", "rivalLeft", "rivalHere", "rivalBack", "exit"};
	sentences[] = {
		"What's up with this uniform? %1?",
		"My former employer. I'm a contractor. And %1 was just another job on this pissant island."
	};
};
class rivalContention
{
	arguments[] = {"getText(missionConfigFile >> 'Factions' >> 'Contention' >> 'displayName')"};
	responses[] = {"rivalLeft", "rivalHere", "rivalBack", "exit"};
	sentences[] = {
		"Tell me more about %1.",
		"They're not to mess with, kid. Bunch of bastards. Stay clear of their patrols and bases.",
		"Not really the explanation I was looking for.",
		"Not really my problem. If you want the wikipedia entry go to Hawkins."
	};
};
class rivalLeft
{
	arguments[] = {"getText(missionConfigFile >> 'Factions' >> 'Contention' >> 'displayName')"};
	responses[] = {"rivalContention", "rivalHere", "rivalBack", "exit"};
	sentences[] = {
		"'Former employer?'",
		"Hawkeye and I had to leave.",
		"Why?",
		"None of your business."
	};
};
class rivalHere
{
	arguments[] = {"getText(missionConfigFile >> 'Factions' >> 'Contention' >> 'displayName')"};
	responses[] = {"rivalContention", "rivalBack", "exit"};
	sentences[] = {
		"Why are you still here? What are you doing?",
		"Freelancing, when I have time. Been working for Hawkins mostly. Still have some unfinished business.",
		"With your former employer?",
		"Positive. A bunch of assholes ripped me off back then. I will find them.",
		"Can I help?",
		"Maybe later."
	};
};
class rivalM06Description
{
	arguments[] = {"getText(missionConfigFile >> 'Factions' >> 'Contention' >> 'displayName')"};
	condition = "(leader(group(_this select 0)) == (_this select 0)) && ([(_this select 0), 'M04'] call IP_fnc_missionDone) && !([(_this select 0), 'M06'] call IP_fnc_missionDone) && !((group(_this select 0)) getVariable ['IP_M06_Started', false])";
	responses[] = {"rivalM06Accept", "rivalBack", "exit"};
	sentences[] = {
		"I heard you got a job.",
		"I do. Got my eye on a %1 convoy. You help me out and I'll make it worthwhile for you. But I'm not working with greenhorns. I first want you to grab some gear. There's a %1 depot two clicks west of here. It's lightly guarded and they usually keep a couple of unlocked SMGs there. Raid it and come back with the gear. Then we'll talk again."
	};
};	
class rivalM06Accept
{
	exit = 1;
	expression = "['M06', [(_this select 0)]] call IP_fnc_startMission;";
	sentences[] = {"Alright, copy that, military man."};
};	
class rivalM06Done
{
	condition = "(leader(group(_this select 0)) == (_this select 0)) && (missionNamespace getVariable ['IP_M06_Box_Opened', false]) && !([(_this select 0), 'M06'] call IP_fnc_missionDone)";
	responses[] = {"rivalBack", "exit"};
	expression = "(group(_this select 0)) setVariable ['IP_M06_QuestDone', true, true];";
	sentences[] = {
		"I got that gear from the depot.",
		"Good."
	};
};
class rivalM07Description
{
	arguments[] = {"getText(missionConfigFile >> 'Factions' >> 'Contention' >> 'displayName')"};
	condition = "(leader(group(_this select 0)) == (_this select 0)) && ([(_this select 0), 'M06'] call IP_fnc_missionDone) && !([(_this select 0), 'M07'] call IP_fnc_missionDone) && !((group(_this select 0)) getVariable ['IP_M07_Started', false])";
	responses[] = {"rivalM07Accept", "rivalBack", "exit"};
	sentences[] = {
		"What now?",
		"Ambushing the %1 convoy, taking out the target. Made a deal with Ghost. We can use his turf for the ambush. Bring the best gear you got and meet me at the Ghosttown.",
		"What do I get from this?",
		"My help in your 'quest'. And everything the C-Mercs drop is yours. I'm only interested in taking out the target."
	};
};	
class rivalM07Accept
{
	exit = 1;
	expression = "['M07', [(_this select 0)]] call IP_fnc_startMission;";
	sentences[] = {"Okay, meet you there."};
};
class rivalM07OnSite
{
	condition = "(leader(group _this) == _this) && !([_this, 'rivalM07Go'] call IP_fnc_checkConvKey)";
	responses[] = {"rivalM07Go", "exit"};
	sentences[] = {
		"Here I am.",
		"I know. Take a position along that road, the convoy's coming from the north, two vehicles. I have a small surprise for them. Take a few minutes to prepare if you wish."
	};
};
class rivalM07Go
{
	exit = 1;
	sentences[] = {"I'm ready."};
};
class rivalM07Done
{
	condition = "(leader(group _this) == _this) && !([_this, 'rivalM07Done'] call IP_fnc_checkConvKey)";
	expression = "(group(_this select 0)) setVariable ['IP_M07_QuestDone', true, true];";
	responses[] = {"exit"};
	sentences[] = {
		"Looks like we're done.",
		"That was good work. You have my word, I will aid you in your quest. Go back to the Scrapyard now."
	};
};