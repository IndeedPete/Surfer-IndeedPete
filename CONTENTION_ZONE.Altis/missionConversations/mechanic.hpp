class mechanicOpener
{
	condition = "([_this, 'Intro'] call IP_fnc_missionDone)";
	responses[] = {"mechanicMMechNeedDescription", "mechanicMMechNeedDone", "exit"};
	sentences[] = {
		"Hi there!",
		"Howdy!"
	};
};
class mechanicBack
{
	responses[] = {"mechanicMMechNeedDescription", "mechanicMMechNeedDone", "exit"};
	sentences[] = {
		"Can I ask you something else?",
		"Yeah?"
	};
};
class mechanicMMechNeedDescription
{
	arguments[] = {"([((getNumber(missionConfigFile >> 'ShopItems' >> 'Misc' >> 'Toolkit' >> 'price')) * 0.6)] call IP_fnc_numberText)"};
	condition = "(leader(group(_this select 0)) == (_this select 0)) && ([(_this select 0), 'Min'] call IP_fnc_missionDone) && !([(_this select 0), 'MMechNeed'] call IP_fnc_missionDone) && !((group(_this select 0)) getVariable ['IP_MMechNeed_Started', false])";
	responses[] = {"mechanicMMechNeedWhere", "mechanicMMechNeedAccept", "mechanicBack", "exit"};
	sentences[] = {
		"Need anything?",
		"Yeah, some tools would be nice. Tell you what: Get me a Toolkit and I'll give you %1 bucks, deal?"
	};
};
class mechanicMMechNeedWhere
{
	arguments[] = {"([(getNumber(missionConfigFile >> 'ShopItems' >> 'Misc' >> 'Toolkit' >> 'price'))] call IP_fnc_numberText)"};
	responses[] = {"mechanicMMechNeedAccept", "mechanicBack", "exit"};
	sentences[] = {
		"Where can I find a Toolkit?",
		"Well, you can always buy one at the shop, you know? But it's %1 quit, more than I have."
	};
};
class mechanicMMechNeedAccept
{
	exit = 1;
	expression = "['MMechNeed', [(_this select 0)]] call IP_fnc_startMission;";
	sentences[] = {"I'll keep an eye out for some tools."};
};	
class mechanicMMechNeedDone
{
	condition = "(leader(group (_this select 0)) == (_this select 0)) && ((group(_this select 0)) getVariable ['IP_MMechNeed_Started', false]) && ('ToolKit' in (items(_this select 0))) && !([(_this select 0), 'MMechNeed'] call IP_fnc_missionDone)";
	responses[] = {"mechanicBack", "exit"};
	expression = "(group(_this select 0)) setVariable ['IP_MMechNeed_QuestDone', true, true];";
	sentences[] = {
		"Hey, I've found a Toolkit! (Give Toolkit.)",
		"Good job! Here's your cash!"
	};
};