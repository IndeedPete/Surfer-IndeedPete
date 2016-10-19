class doctorOpener
{
	condition = "([_this, 'Intro'] call IP_fnc_missionDone)";
	responses[] = {"doctorHeal", "doctorDoing", "doctorContention", "doctorMinDescription", "doctorMinDone", "doctorMDocNeedDescription", "doctorMDocNeedDone", "doctorM01Description", "doctorM01Done", "doctorMDocScanDescription", "exit"};
	sentences[] = {
		"Hello?",
		"(Putting together an open artery with a paper-clip and some duct-tape.)"
	};
};
class doctorBack
{
	responses[] = {"doctorHeal", "doctorDoing", "doctorContention", "doctorMinDescription", "doctorMinDone", "doctorMDocNeedDescription", "doctorMDocNeedDone", "doctorM01Description", "doctorM01Done", "doctorMDocScanDescription", "exit"};
	sentences[] = {
		"Back to my other questions.",
		"What is it?"
	};
};
class doctorHeal
{
	condition = "(damage(_this select 0) > 0)";
	expression = "(_this select 0) setDamage 0;";
	responses[] = {"doctorDoing", "doctorContention", "doctorMinDescription", "doctorMinDone", "doctorMDocNeedDescription", "doctorMDocNeedDone", "doctorM01Description", "doctorM01Done", "doctorMDocScanDescription", "exit"};
	sentences[] = {
		"Can you patch me up?",
		"Eat this blue pill and forget it's just sugar. Placebo effect will handle the rest. Take care, mate."
	};
};
class doctorDoing
{
	responses[] = {"doctorDoingYes", "doctorDoingNo", "doctorBack", "exit"};
	sentences[] = {
		"What are you up to?",
		"Hey You! Yes you! Finish this ruptured artery, will you? I'll get myself some tea and go for a cigarette."
	};
};
class doctorDoingYes
{
	responses[] = {"doctorIntroduce", "doctorBack", "exit"};
	sentences[] = {
		"Uh, me? Yes, maybe if you tell me how to ...",
		"What do you mean, 'maybe'? Are you bloody retarded, mate? Stitch here, stitch there and that's it. So simple a child could do that, piece of cake."
	};
};
class doctorDoingNo
{
	responses[] = {"doctorIntroduce", "doctorBack", "exit"};
	sentences[] = {
		"Me? No, Sir! I'm afraid I can't do that.",
		"What do you mean you can't do that? My cousin's pet monkey could do that! He knows 500 words in bloody sign language and what about you?! I wonder why I keep fixing these people up all the time..."
	};
};
class doctorIntroduce
{
	arguments[] = {"(name player)"};
	responses[] = {"doctorBack", "exit"};
	sentences[] = {
		"Can't help you with that. Just wanted to say hi. I'm %1.",
		"(Pulls his right arm out of his patient to light a Pall Mall.) Chaps around here call me Hawkeye. 'Dr. Hawkins' seems to be too complicated. Quantum physicist, hobby surgeon and co-publisher of 'Her Majesty's Gardening Tips Weekly'. Here I'm patching up unlucky Zoners like you who think it's such a bright idea to wander around the totally not dangerous anomalies. So, if you see or hear or feel anything unusual, turn around and start running. And now do me a favour and get me a cup of tea. And maybe some Jaffa Cakes as well? I doubt that, there's no decent cup of tea within 3000 miles of this bloody island."
	};
};
class doctorContention
{
	arguments[] = {"getText(missionConfigFile >> 'Factions' >> 'Contention' >> 'displayName')"};
	responses[] = {"doctorContentionOpinion", "doctorBack", "exit"};
	sentences[] = {
		"What can you tell me about %1?",
		"Well, according to wikipedia %1 is a non-profit NGO. Their slogan is something along 'towards the advancement of the human race - biologically, technically and socially'. Their one and only goal is 'aiding humanity' and as a sub-organisation of the United Nations it is funded by donations mostly."
	};
};
class doctorContentionOpinion
{
	arguments[] = {"getText(missionConfigFile >> 'Factions' >> 'Contention' >> 'displayName')"};
	responses[] = {"doctorContentionEx", "doctorContentionWhat", "doctorBack", "exit"};
	sentences[] = {
		"And your opinion?",
		"wikipedia has been compromised - no surprise. The article is pure bullshit. %1 is the largest corporate entity in existence. Originally focused on weapons and defence contracts, new ventures have expanded into biological research, space exploration, and other scientific endeavours. With unlimited funds and the ability to engage in research outside of moral and legal obligations, %1 controls the most advanced technology ever conceived. I have worked for them. Believe me, they're the devil's rejects. But darn, it's a paradise for every morally ambivalent scientist."
	};
};
class doctorContentionEx
{
	arguments[] = {"getText(missionConfigFile >> 'Factions' >> 'Contention' >> 'displayName')"};
	responses[] = {"doctorContentionWhat", "doctorContentionOrganisation", "doctorBack", "exit"};
	sentences[] = {
		"You used to work for them?",
		"So says my jumpsuit and my employee ID. Jackknife and I were both working for %1 until some time ago.",
		"Why did you leave?",
		"We've stepped on the wrong feet. There was a price on our heads, actually it still is. Don't even think of turning us in. It will get you nothing but a bullet to the head."
	};
};
class doctorContentionWhat
{
	responses[] = {"doctorContentionEx", "doctorContentionOrganisation", "doctorBack", "exit"};
	sentences[] = {
		"What are they doing on Altis?",
		"'Aiding humanity'. Oh, you mean what they're really doing here? Above my clearance I'm afraid but I'm pretty sure they are responsible for this radioactive mess. They have triggered the catastrophe, not yet sure why.",
		"Investigating on them?",
		"Next to my research, yes. Dangerous endeavour though. Need to stay low if I want to keep my head attached to my shoulders. Which is the most preferably option in my opinion."
	};
};
class doctorContentionOrganisation
{
	arguments[] = {"getText(missionConfigFile >> 'Factions' >> 'Contention' >> 'displayName')"};
	responses[] = {"doctorContentionEx", "doctorContentionWhat", "doctorBack", "exit"};
	sentences[] = {
		"How are they organised?",
		"%1 has three types of personnel on this island, scattered around several bases and facilities. There are paramilitary troops, fairly easy to recognise by their firearms. Second largest group is scientific personnel, people like me. And then there's support. Technicians, medics, builders - working class. But it has become a 'hostile' work environment lately.",
		"How so?",
		"Head of the paramilitary wing and the lead scientist had some dissents about where the project is going. Seems like our paramilitary colonel has some megalomaniac fantasies. We'll see where this is going."
	};
};
class doctorMinDescription
{
	condition = "(leader(group(_this select 0)) == (_this select 0)) && !([(_this select 0), 'Min'] call IP_fnc_missionDone) && !((group(_this select 0)) getVariable ['IP_Min_Started', false])";
	responses[] = {"doctorMinWhat", "doctorMinWhere", "doctorMinHow", "doctorMinAccept", "doctorBack", "exit"};
	sentences[] = {
		"People said you can help me getting settled in.",
		"Settled in? What do you think this is, chap? One does not settle in, get a job and start a family in the Zone. I can only teach you how to survive. Well, at least I can try. You see, I have been researching the anomalies but theoretical research is sadly not sufficient to continue my studies. This prototype here is a neat little device to let's say 'scan' anomalies. I still need to properly calibrate it and require some samples of the most common phenomenons. Namely BIO, CHEM, RAD, FREEZER, BLASTER and TRIP - search around the scrapyard and I'm sure you can fill in the blanks for me. What do you say?"
	};
};	
class doctorMinWhat
{
	responses[] = {"doctorMinWhere", "doctorMinHow", "doctorMinAccept", "doctorBack", "exit"};
	sentences[] = {
		"I don't follow, do you want me to walk right into these things?",
		"Oh dear, this idiot might be the next Darwin Award winner. No, I don't want you to walk straight into a BLASTER. Most anomalies have a small safe zone in which you can see and scan them but they don't affect you yet. Always stay within these safe zones and you should be fine. Well, we don't have long term results but - no, you'll be fine, trust me."
	};
};	
class doctorMinWhere
{
	responses[] = {"doctorMinWhat", "doctorMinHow", "doctorMinAccept", "doctorBack", "exit"};
	sentences[] = {
		"Where can I find these anomalies?",
		"Throughout the whole zone. But I'd recommend to stay close to the scrapyard for now. Look for unnatural phenomenons, flickering air, poisonous gas - stuff like that. Oh, and some are actually marked with signs. I'm sure you'll find them. Eventually..."
	};
};	
class doctorMinHow
{
	responses[] = {"doctorMinWhat", "doctorMinWhere", "doctorMinAccept", "doctorBack", "exit"};
	sentences[] = {
		"How do I use this prototype?",
		"You don't. It's auto recording, just walk into an anomaly and it'll get me the data I need. But bring it back in one piece, okay?"
	};
};	
class doctorMinAccept
{
	exit = 1;
	expression = "['Min', [(_this select 0)]] call IP_fnc_startMission;";
	sentences[] = {"Okay, I'll do it."};
};	
class doctorMinDone
{
	arguments[] = {"(name IP_Dealer)"};
	condition = "(leader(group (_this select 0)) == (_this select 0)) && ((group(_this select 0)) getVariable ['IP_Min_SubTasksDone', false]) && !([(_this select 0), 'Min'] call IP_fnc_missionDone)";
	responses[] = {"doctorBack", "exit"};
	expression = "(group(_this select 0)) setVariable ['IP_Min_QuestDone', true, true];";
	sentences[] = {
		"I think I have the results, doc.",
		"Hm, let's see. Fine work, lad. Maybe you're not as stupid as I thought. I have to analyse these. Check in with %1 and come back later, will you?"
	};
};
class doctorMDocNeedDescription
{
	arguments[] = {"([((getNumber(missionConfigFile >> 'ShopItems' >> 'Misc' >> 'Medikit' >> 'price')) * 0.6)] call IP_fnc_numberText)"};
	condition = "(leader(group(_this select 0)) == (_this select 0)) && ([(_this select 0), 'Min'] call IP_fnc_missionDone) && !([(_this select 0), 'MDocNeed'] call IP_fnc_missionDone) && !((group(_this select 0)) getVariable ['IP_MDocNeed_Started', false])";
	responses[] = {"doctorMDocNeedWhere", "doctorMDocNeedAccept", "doctorBack", "exit"};
	sentences[] = {
		"Need anything?",
		"Yes, in fact I do.",
		"Is it a cup of tea?",
		"Yes. But I also need a set of surgical instruments. I'm working on duct tape and old underwear here. Can't treat really tough injuries resulting in too many deaths. Bring me a Medikit and you'll get my whole tip jar. (Points at a dirty jar full of coins.) Should be around %1 quid, more or less."
	};
};
class doctorMDocNeedWhere
{
	arguments[] = {"([(getNumber(missionConfigFile >> 'ShopItems' >> 'Misc' >> 'Medikit' >> 'price'))] call IP_fnc_numberText)", "([((getNumber(missionConfigFile >> 'ShopItems' >> 'Misc' >> 'Medikit' >> 'price')) * 0.6)] call IP_fnc_numberText)"};
	responses[] = {"doctorMDocNeedAccept", "doctorBack", "exit"};
	sentences[] = {
		"Where can I find a Medikit?",
		"Like I know!",
		"Keen to share any hints at least?",
		"None that I know of. Oh wait, you could buy one at the shop!",
		"...which is in the next room. If there is a Medikit available why didn't you-",
		"Because it's %1 and I only have %2.",
		"I see."
	};
};
class doctorMDocNeedAccept
{
	exit = 1;
	expression = "['MDocNeed', [(_this select 0)]] call IP_fnc_startMission;";
	sentences[] = {"I'll see what I can do."};
};	
class doctorMDocNeedDone
{
	condition = "(leader(group(_this select 0)) == (_this select 0)) && ((group(_this select 0)) getVariable ['IP_MDocNeed_Started', false]) && ('Medikit' in (items(_this select 0))) && !([(_this select 0), 'MDocNeed'] call IP_fnc_missionDone)";
	responses[] = {"doctorBack", "exit"};
	expression = "(group(_this select 0)) setVariable ['IP_MDocNeed_QuestDone', true, true];";
	sentences[] = {
		"I've found a Medikit, doc! (Give Medikit.)",
		"Ah, brilliant! Drop it right there, you can go now."
	};
};
class doctorM01Description
{
	condition = "(leader(group(_this select 0)) == (_this select 0)) && ([(_this select 0), 'M00'] call IP_fnc_missionDone) && !([(_this select 0), 'M01'] call IP_fnc_missionDone) && !((group(_this select 0)) getVariable ['IP_M01_Started', false])";
	responses[] = {"doctorM01WhatAndWhere", "doctorM01Accept", "doctorBack", "exit"};
	sentences[] = {
		"How's your research coming along, doc?",
		"Brilliant. Just brilliant.",
		"So, not good?",
		"Not at all! I need more data! Gosh, if I only was back at CERN, the resources we had... (Stares sentimentally at the empty wall.) Listen, I have an idea on how you and me could work together. I need someone to collect me more data, so I can try a more empirical approach. I plan to modify my scanning device by adding a sender to it so it would automatically capture and transmit data when you walk past an anomaly. Need some spare parts though, think you can do that?"
	};
};
class doctorM01WhatAndWhere
{
	responses[] = {"doctorM01Accept", "doctorBack", "exit"};
	sentences[] = {
		"What and where?",
		"A short range transmitter at a decommissioned nuclear power plant east of here.",
		"When you say decommissioned...",
		"There was an accident. Now people refuse to go there because of the high radiation. Just work fast, it'll be safe - I suppose.",
		"Anything else?",
		"The transmitter should be in contact with a laptop in the tower at the entrance. It's safe there. Well, it should be."
	};
};
class doctorM01Accept
{
	exit = 1;
	expression = "['M01', [(_this select 0)]] call IP_fnc_startMission;";
	sentences[] = {"Okay, if it's for science I'll do it..."};
};	
class doctorM01Done
{
	condition = "(leader(group (_this select 0)) == (_this select 0)) && ((group(_this select 0)) getVariable ['IP_M01_TransmitterFound', false]) && !([(_this select 0), 'M01'] call IP_fnc_missionDone)";
	responses[] = {"doctorBack", "exit"};
	expression = "(group(_this select 0)) setVariable ['IP_M01_QuestDone', true, true];";
	sentences[] = {
		"Here's your transmitter.",
		"Splendid! And here's some Natrium."
	};
};

class doctorMDocScanDescription
{
	arguments[] = {"(getNumber(missionConfigFile >> 'rewardPerScan'))"};
	condition = "(leader(group(_this select 0)) == (_this select 0)) && ([(_this select 0), 'M01'] call IP_fnc_missionDone) && !([(_this select 0), 'MDocScan'] call IP_fnc_missionDone) && !((group(_this select 0)) getVariable ['IP_MDocScan_Started', false])";
	responses[] = {"doctorMDocScanAccept", "doctorBack", "exit"};
	sentences[] = {
		"So, what now?",
		"Scanning the anomalies!",
		"You mean I should scan the anomalies. Which ones?",
		"Scan all the things! Here's a rebuilt mine detector. It will scan an anomaly once you walk through it and automatically create a marker on your map. Plus you'll get %1 Euro for every scanned anomaly. Oh, and the data is shared, means every Freezoner's map gets updated."
	};
};
class doctorMDocScanAccept
{
	exit = 1;
	expression = "['MDocScan', [(_this select 0)]] call IP_fnc_startMission;";
	sentences[] = {"Splendid! I'll do it!"};
};