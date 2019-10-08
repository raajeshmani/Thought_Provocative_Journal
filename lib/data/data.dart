var events = [
  'This is story number one ',
  'Dude this is a bad story ',
  'Nah this is a gud one',
  'I finally went out with my squad really after a long time. It was an amazing day, as i spent more time with my four bestfriends. Me, sara, jane and simran went for a movie and had a good lunch. A whole day shopping is a dream for every girl that too with her besties, trying clothes in fitting room,taking photos etc,. I felt very relaxed and happy walking in the free air and making fun with my friends.',
  'Even when i had a great time with my friends today, one thing really pissed me off. Sara was annoying to me the whole day as i was very close with jane. I dont really understand why she was so possessive about me being close with jane, rather she knows that she and I are best friends for life. This whole thing made me sad and sara being very mean to me.',
  "I'm so upset.I dont know where to begin.",
  "To start off, I think I completely failed my math quiz, while I know I should've studied.But what really made me mad was the note that Sarah slipped into my bag today. She said she was sad that I�ve been hanging out with Jane more lately and thinks that I don�t want to be her friend anymore. I can�t believe she thinks that, especially after talking with her for hours and hours last week while she was going through her breakup with her boyfriend.Just because I�ve been hanging out with Jane a little more than usual doesn�t mean I�m not her friend anymore.She completely blew me off today,and when I told Jane, she thought that Sarah was being a drama queen.",
  "Today was a little better. I spoke with Sara last night asking if she wanted to have lunch with me today,just the two of us,and she agreed.I told her that just because I�m hanging out with Jane, it doesn�t change anything about our friendship.She said that she knows that,but she just felt like the third wheel because she doesn�t think that Jane likes her and because Jane and I have a lot of classes together. I told her not to worry about what Jane thought and that I�d talk to her about it. Sara felt a lot better, and after we spent the rest of lunch catching up on the latest gossip, which I missed!.",
];

var storyTitle = [
  'Draft Day !',
  'Oktober Fest',
  'Dussehra Kill',
];

var storyTagLine = [
  '#swooosh',
  '#yellowjartime',
  '#maanja',
];

var emotions = [
  ['accepted','surprised'],
  ['mad'],
  ['aroused', 'cheeky'],
  ['shocked', 'provoked','astonished','stressed'],
  ['aroused', 'mad'],
  ['despair'],
  [''],
  ['repelled', 'mad']
];

var coloredEmotions = [
  0xFF1e3799,
  0xFFfad390,
  0xFF6a89cc,
  0xFF60a3bc,
  0xFFeb2f06,
  0xFFfa983a,
  0xFF78e08f,
];

String baseEmotionLinkJson = """
{
  "surprised":"surprised",
  "startled": "surprised",
  "shocked": "surprised",
  "dismayed": "surprised",
  "confused": "surprised",
  "disillusioned": "surprised",
  "perplexed": "surprised",
  "amazed": "surprised",
  "astonished": "surprised",
  "awe": "surprised",
  "excited": "surprised",
  "eager": "surprised",
  "energetic": "surprised",
  "playful": "happy",
  "aroused": "happy",
  "cheeky": "happy",
  "content": "happy",
  "free": "happy",
  "joyful": "happy",
  "interested": "happy",
  "curious": "happy",
  "inquisitive": "happy",
  "proud": "happy",
  "successful": "happy",
  "confident": "happy",
  "accepted": "happy",
  "respected": "happy",
  "valued": "happy",
  "powerful": "happy",
  "courageous": "happy",
  "creative": "happy",
  "trusting": "happy",
  "sensitive": "happy",
  "intimate": "happy",
  "optimistic": "happy",
  "hopeful": "happy",
  "inspired": "happy",
  "lonely": "sad",
  "isolated": "sad",
  "abandoned": "sad",
  "vulnerable": "sad",
  "victimized": "sad",
  "fragile": "sad",
  "despair": "sad",
  "grief": "sad",
  "powerless": "sad",
  "guilty": "sad",
  "ashamed": "sad",
  "remorseful": "sad",
  "depressed": "sad",
  "inferior": "fearful",
  "empty": "sad",
  "hurt": "sad",
  "dissapointed": "sad",
  "embarrased": "sad",
  "disapproving": "disgusted",
  "judgmental": "disgusted",
  "embarrassed": "disgusted",
  "disappointed": "disgusted",
  "appalled": "disgusted",
  "revolted": "disgusted",
  "awful": "disgusted",
  "nauseated": "disgusted",
  "detestable": "disgusted",
  "repelled": "disgusted",
  "horrified": "disgusted",
  "hesitant": "disgusted",
  "let down": "angry",
  "betrayed": "angry",
  "resentful": "angry",
  "humiliated": "angry",
  "disrespected": "angry",
  "ridiculed": "angry",
  "bitter": "angry",
  "indignant": "angry",
  "violated": "angry",
  "mad": "angry",
  "furious": "angry",
  "jealous": "angry",
  "aggressive": "angry",
  "provoked": "angry",
  "hostile": "angry",
  "frustrated": "angry",
  "infuriated": "angry",
  "annoyed": "angry",
  "distant": "angry",
  "withdrawn": "angry",
  "numb": "angry",
  "critical": "angry",
  "skeptical": "angry",
  "dismissive": "angry",
  "scared": "fearful",
  "helpess": "fearful",
  "frightened": "fearful",
  "anxious": "fearful",
  "overwhelmed": "bad",
  "worried": "fearful",
  "insecure": "fearful",
  "inadequate": "fearful",
  "weak": "fearful",
  "worthless": "fearful",
  "insignificant": "fearful",
  "rejected": "fearful",
  "excluded": "fearful",
  "persecuted": "fearful",
  "threatened": "fearful",
  "nervous": "fearful",
  "exposed": "fearful",
  "bored": "bad",
  "indifferent": "bad",
  "apathetic": "bad",
  "busy": "bad",
  "pressured": "bad",
  "rushed": "bad",
  "stressed": "bad",
  "out of control": "bad",
  "tired": "bad",
  "sleepy": "bad",
  "unfocussed": "bad"
}
""";

String jsonStr = """{
	"emotions": [{
			"surprised": {
				"startled": ["shocked", "dismayed"],
				"confused": ["disillusioned", "perplexed"],
				"amazed": ["astonished", "awe"],
				"excited": ["eager", "energetic"]
			}
		},
		{
			"happy": {
				"playful": ["aroused", "cheeky"],
				"content": ["free", "joyful"],
				"interested": ["curious", "inquisitive"],
				"proud": ["successful", "confident"],
				"accepted": ["respected", "valued"],
				"powerful": ["courageous", "creative"],
				"trusting": ["sensitive", "intimate"],
				"optimistic": ["hopeful", "inspired"]
			}
		},
		{
			"sad": {
				"lonely": ["isolated", "abandoned"],
				"vulnerable": ["victimized", "fragile"],
				"despair": ["grief", "powerless"],
				"guilty": ["ashamed", "remorseful"],
				"depressed": ["inferior", "empty"],
				"hurt": ["dissapointed", "embarrased"]
			}
		},
		{
			"disgusted": {
				"disapproving": ["judgmental"],
				"disappointed": ["appalled", "revolted"],
				"awful": ["nauseated", "detestable"],
				"repelled": ["horrified", "hesitant"]
			}
		},
		{
			"angry": {
				"let down": ["betrayed", "resentful"],
				"humiliated": ["disrespected", "ridiculed"],
				"bitter": ["indignant", "violated"],
				"mad": ["furious", "jealous"],
				"aggressive": ["provoked", "hostile"],
				"frustrated": ["infuriated", "annoyed"],
				"distant": ["withdrawn", "numb"],
				"critical": ["skeptical", "dismissive"]
			}
		},
		{
			"fearful": {
				"scared": ["helpess", "frightened"],
				"anxious": ["overwhelmed", "worried"],
				"insecure": ["inadequate", "inferior"],
				"weak": ["worthless", "insignificant"],
				"rejected": ["excluded", "persecuted"],
				"threatened": ["nervous", "exposed"]
			}
		},
		{
			"bad": {
				"bored": ["indifferent", "apathetic"],
				"busy": ["pressured", "rushed"],
				"stressed": ["overwhelmed", "out of control"],
				"tired": ["sleepy", "unfocussed"]
			}
		}
	]
}""";
