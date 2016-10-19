class profStartOpener
{
	condition = "!((group _this) getVariable ['IP_Intro_Started', false])";
	responses[] = {"profStartDid", "profStartOtherGuy", "profStartHeal", "profExit"};
	sentences[] = {
		"Who are you and what is this place?",
		"I am Professor Wolfram. Last thing I remember before I woke up to this prison is I was at this congress for neuro-chemics at Den Haag. Could be I had a few drinks too much or they drugged and got me here."
	};
};
class profStartDid
{
	responses[] = {"profStartOtherGuy", "profStartHeal", "profExit"};
	sentences[] = {
		"Who did this to us and how long have you been here?",
		"Feels I'm here for a few weeks now. Our hosts didn't introduce themselves so all I know is they are running a state of the art biotech laboratory. Lots of scientists and armed guards out there. Every few hours they are getting one of us out for drugs and tortures, trying to mess up our minds. They weren't able to brainwash me yet, possibly that's why I'm still here."
	};
};
class profStartOtherGuy
{
	responses[] = {"profStartDid", "profStartHeal", "profExit"};
	sentences[] = {
		"What's with the other guy, sitting there?",
		"He was in this catatonic state when I got here. Doesn't talk much."
	};
};
class profStartHeal
{
	condition = "('FirstAidKit' in (items player)) && (damage IP_ProfName > 0)";
	expression = "player removeItem 'FirstAidKit'; IP_ProfName setDamage 0;";
	responses[] = {"profStartDid", "profStartOtherGuy", "profExit"};
	sentences[] = {
		"You're injured. Let me help you. (Spend First Aid Kit.)",
		"Thank you so much for your medical attention. I think I can trust you: There's a radio I have hidden in the ventilation system in the corner. It didn't give a signal yet but it might be of help to you. It's right over there, in the ventilation at the other room."
	};
};
class profExit
{
	exit = 1;
	sentences[] = {
		"Listen, I will try to get us out of here. Just don't give up!"
	};
};