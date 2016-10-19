class CfgHints
{
	class CZ
	{
		displayName = "Contention Zone";
			
		class Conversations
		{
			arguments[] = {"(getText(missionConfigFile >> 'onLoadName'))"};
			displayName = "Conversations";
			description = "Not all conversations in %11 are voiced. There are text-based multiple-choice interactions with NPCs as well. Approach an NPC and bring up Arma 3's Action Menu. If this image <img size='1' image='\a3\ui_f\data\igui\cfg\Actions\talk_ca.paa'/> shows up you can interact with the NPC through a multiple choice dialog.";
			image = "\a3\ui_f\data\gui\cfg\hints\chat_ca.paa";
			tip = "Conversations are often mandatory and your choices can affect the outcome of the current mission or even of the whole campaign. But sometimes talking to NPCs offers hints or alternative ways to approach a mission.";
		};
		
		class Equipment
		{
			displayName = "Equipment";
			description = "When in a hub, you can adjust your loadout according to the selected mission's profile. The gear you carry before heading off to the insertion is what you will have at your disposal in the following mission.";
			image = "\a3\ui_f\data\gui\cfg\hints\gear_ca.paa";
			tip = "Talk to NPCs to find out more about a mission's profile and select your gear accordingly.";
		};
		
		class Flashlight
		{
			arguments[] = {{{"headlights"}}};
			displayName = "Flashlight";
			//displayNameShort = "Flashlight";
			description = "A flashlight can be very useful during night-time. Turn your gun- or uniform-mounted flashlight on/off by pressing %11. Be careful, light can give away your position.";
			image = "\a3\ui_f\data\gui\cfg\hints\Pointers_ca.paa";
			tip = "Note that the uniform-mounted flashlight Ice introduces does not work inside a vehicle or when a flashlight or IR laser is already attached to your primary weapon.";
		};
		
		class Hubs
		{
			displayName = "Hubs";
			description = "A hub is a safe place where you can rest, talk to NPCs, pick missions, select your gear, and choose a way of insertion for your selected mission.";
			image = "\a3\ui_f\data\gui\cfg\hints\shootingboxes_ca.paa";
			tip = "Talk to NPCs to find out background information or learn more about available missions.";
		};
		
		class Insertion
		{
			displayName = "Insertion";
			description = "When in a hub, once you have selected a mission you are usually given the option of choosing the way of insertion. In general, you can choose from insertion by air, by ground vehicle, on foot or by boat. The available ways of insertion depend on the mission profile and the resources at your disposal.";
			image = "\a3\ui_f\data\gui\cfg\hints\doors_ca.paa";
			tip = "";
		};
		
		class PlayerBox
		{
			displayName = "Player's Box(es)";
			description = "When in a hub, you have access to boxes where you can store gear which is not needed at the moment. Gear stored in boxes will be saved and is available again once you return to the hub.";
			image = "\a3\ui_f\data\gui\cfg\hints\take_ca.paa";
			tip = "Make sure to unload your weapons, uniforms, vests and backpacks and store attachments separately. Otherwise contents might not be saved correctly.";
		};
		
		class Rest
		{
			displayName = "Resting";
			description = "You can skip time by resting and by that influence when the next mission starts. Approach the field bed, bring up Arma 3's Action Menu and access the rest menu <img size='1' image='\a3\ui_f\data\igui\cfg\Actions\settimer_ca.paa'/>.";
			image = "\a3\ui_f\data\gui\cfg\hints\timing_ca.paa";
			tip = "Note that most missions start approximately one hour after you left the hub.";
		};
		
		class StrategicDecisions
		{
			displayName = "Strategic Decisions";
			description = "At certain points in Ice you are given the choice between one or more options to approach a certain goal. These choices are called 'Strategic Decisions' as they can have a major impact on the narrative flow of the current or future mission(s). Depending on the situation, a Strategic Decision can be made via Arma 3's Action Menu, the Conversation System <img size='1' image='\a3\ui_f\data\igui\cfg\Actions\talk_ca.paa'/>, or the Strategic Map <img size='1' image='\a3\ui_f\data\map\diary\signal_ca.paa'/>.";
			image = "\a3\ui_f\data\gui\cfg\hints\tactical_view_ca.paa";
			tip = "";
		};
		
		class StrategicMap
		{
			displayName = "Strategic Map";
			description = "The Strategic Map allows you to pick missions from the whiteboard. Stand close to a whiteboard with a map and bring up Arma 3's Action Menu to select the 'Open Strategic Map' action <img size='1' image='\a3\ui_f\data\map\diary\signal_ca.paa'/>.";
			image = "\a3\ui_f\data\gui\cfg\hints\map_ca.paa";
			tip = "";
		};
	};
};