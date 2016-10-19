class ghostStartOpener
{
	condition = "('ItemRadio' in assignedItems _this) && {!((group _this) getVariable ['IP_Intro_Started', false])}";
	responses[] = {"ghostStartGhost", "exit"};
	sentences[] = {
		"(Investigate Radio.)",
		"Text appearing on the mobile phone you find: Gentlemen, this is Ghost writing to you. We don't have much time. I will try to get you out of here, avoiding the rather painful brainwashing procedure you're up to."
	};
};
class ghostStartGhost
{
	responses[] = {"ghostStartAirfield", "exit"};
	sentences[] = {
		"(Next Message.)",
		"You don't know me but if you want to live, follow these orders: I've leaked some intel to some local activists about the prison you're being held in. They will attack shortly, leaving you a window to flee. Once you're outside move into the direction of the two large solar towers, the ones with red lights on top."
	};
};
class ghostStartAirfield
{
	arguments[] = {"getText(missionConfigFile >> 'Factions' >> 'Contention' >> 'displayName')"};
	responses[] = {"ghostStartScrapyard", "exit"};
	sentences[] = {
		"(Next Message.)",
		"Do not go into the direction of the airfield, there's lots of %1 there and I can't tell if they would put you back in custody or simply shoot at first sight."
	};
};
class ghostStartScrapyard
{
	arguments[] = {"getText(missionConfigFile >> 'Factions' >> 'Freezoners' >> 'displayName')", "(name IP_Dealer)"};
	responses[] = {"ghostStartMIntroAccept", "exit"};
	sentences[] = {
		"(Next Message.)",
		"Close to the solar towers you will find a camp site in Surfer's old scrapyard. That's %1' territory, you should be safe there. Talk to a man named %2. Good luck! Ghost out."
	};
};
class ghostStartMIntroAccept
{
	condition = "(leader(group(_this select 0)) == (_this select 0)) && !([(_this select 0), 'Intro'] call IP_fnc_missionDone) && !((group(_this select 0)) getVariable ['IP_Intro_Started', false])";
	exit = 1;
	expression = "['Intro', [(_this select 0)]] call IP_fnc_startMission;";
	sentences[] = {
		"(Confirm message.)"
	};
};