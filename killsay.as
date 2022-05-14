//vars

bool openMenu = true;
bool hentai;
bool toxic;

array<string> hentaiKillsays = {
    "S-Sorry onii-chan p-please d-do me harder ;w;","Y-You got me all wet now senpai!", "D-Don't t-touch me there senpai", "P-Please l-love me harder oniichan ohh grrh aahhhh~!",
    "Give me all your cum senpai ahhhhh~", "F-Fuck me harder chan!", "Oh my god I hate you so much senpai but please k-keep fucking me harder! ahhh~",
    "D-do you like my stripped panties getting soaked by you and your hard cock? ehhh master you're so lewd ^0^~", "kun your cute little dick between my pussy lips looks really cute, I'm blushing",
    "Master does it feel good when I slide by tits up and down on your cute manly part?", "oniichan my t-toes are so warm with your cum all over them uwu~",
    "Lets take this swimsuit off already <3 i'll drink your unknown melty juice", "S-stop senpai if we keep making these lewd sounds im going to cum~~",
    "You're such a pervert for filling me up with your baby batter senpai~~", "Fill up my baby chamber with your semen kun ^-^", "M-master d-dont spank my petite butt so hard ahhhH~~~ you're getting me so w-wet~",
    "senpai your cock is already throbbing from my huge tits~", "Hey kun, Can I have some semen?", "What the desu did you just kawaii say about me, you little baka",
    "Nyaaaaa!!! (_<)", "uguu desu desu kawaii neee~ ❤️~", "wigglez booty n' squirms", "that's a penis UwU you towd me you wewe a giww!!",
    "wiww shit fuwwies aww ovew you and you wiww dwown in them", "Uhm by the way MOM They're not Chinese cartoons is called ANIME!",
    "I absolutely luuuv @@ anime ❤️", "AYAYA!~ >-<", "Supa kawaii desu!!!!!!!!", "please punish me licks lips nyea~",
    "SUPA SUPA SUPA KAWAII SASUKE-SAMA!!!!!", "Nani the fuck did omae just fucking iimasu about watashi, you chiisai bitch desuka?", "Cummy desu, you are my senpai"
};
int size = 36;

array<string> toxicKillsays = {
    "Internet Explorer is faster than your reactions.", "boutta media some bots brb", "Did you learn your spray downs in a bukkake video?", "hhhhh refund ur paste nn",
    "STOMPED NN", "Is this a bot match?", "1 RAPED NN", "1 nn get good", "nt nn", "1'd pasteuser", "Laff nnstomped", "nice cfg u sell?", "hhh u might wanna try a different cfg nn", "1 nn",
    "nt nn", "?", "ez ?", "me > you", "Monolith > your cheat", "1 iqless bot", "ks a5tk 3zbi ya sharmota", "ezzzzzzzzzzzzzzzzz", "ra7 anech omk 3la 9dr i5tk ybn ilg7ba", "iqless bot",
    "BY Monolith du bot", "H$", "You sell that shit cfg?", "GO BACK TO CASUAL YOU MONGOLOIDED PONY FUCKER", "EXPLODE YOURSELF YOU SHIT SKINNED PONY FUCKER",
    "BOW TO ME YOU FAIRY ASS FUCKING PIG FUCKER", "SUCK MY BALL SWEAT YOU WORTHLESS REDDITOR", "CHOKE ON YOUR UNCLE'S COCK YOU CANDY ASS CURRY MUNCHER",
    "crack user go back to ur country filthy refugee slave", "shove a brick up your ass you nigger headed pig fucker", "Should've used Monolith"
};
int size2 = 35;

void init()
{
    RegisterCallback("OnMenu", OnMenuCallback);
    RegisterCallback("player_death", event_listen);
}

void OnMenuCallback()
{
    if(!CheatVars.menuOpen)
        return;

            if(Menu::Begin("Killsay stuff", openMenu))
                {
                   Menu::Text("Killsay type: ");
                   Menu::Checkbox("Hentai", hentai);
                   Menu::Checkbox("Toxic", toxic);      

                         Menu::End();
               }
}

void event_listen(IGameEvent& event) {
  string event_name = event.GetName();

  if(event !is null)
  {
        CBaseEntity @ entity = Interfaces.ClientEntityList.GetBaseEntity(Interfaces.EngineClient.GetPlayerForUserID(event.GetInt("userid")));
        if(entity !is null && Interfaces.EngineClient.GetPlayerForUserID(event.GetInt("attacker")) == Interfaces.EngineClient.GetLocalPlayer())
        {
            player_info_t info = entity.GetPlayerInfo();
            string name = info.GetName();
            if (event_name == "player_death") {
                if (hentai)
                {         
                    string killsay =  hentaiKillsays[Util.RandomInt(0, size - 1)];
                    Interfaces.EngineClient.ClientCmd_Unrestricted("say  "+name +" "+killsay, false);
                }

                else if (toxic)
                {       
                    string killsay =  toxicKillsays[Util.RandomInt(0, size2 - 1)];
                    Interfaces.EngineClient.ClientCmd_Unrestricted("say  "+name +" "+killsay, false);
                }
            }
        }
    }
}