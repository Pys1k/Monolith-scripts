array<string> masks = Util.GetFilesInDirectoryGame("models\\player\\holiday\\facemasks\\");
string mask = "models/player/holiday/facemasks/facemask_dallas.mdl";


int Hook(uint oFunc, uint oStackPtr, uint returnAddress, uint EAX, uint ECX, uint EDX, uint EBX, uint ESP, uint EBP, uint ESI, uint EDI)
{
    Util.PrecacheModel(mask);

    return mask;
}
bool openMenu = true;


void OnCreateMoveCallback(CUserCmd & cmd,bool & sendPacke)
{
CBaseEntity @local = Interfaces.ClientEntityList.GetLocalPlayer();
    if (local !is null)
    {
        local.GetInt("DT_CSPlayer::m_iAddonBits") |= 0x10000 | 0x00800;
    }
}

void OnMenuCallback()
{

    if (!CheatVars.menuOpen)
        return;

    if (Menu::Begin("Mask Changer", openMenu))
    {
     
        for (int i = 0; i < masks.length(); i++)
        {
            if (masks[i].findFirst(".mdl") != -1)
            {
                if (Menu::Button(masks[i]))
                {
                    mask = "models/player/holiday/facemasks/" + masks[i];
                    printf(mask);
                }
            }
        }

        Menu::End();
    }
}
void init()
{
    printf("Made with <3 by Pysik & Oneshot");
    FFI::RegisterHook(Hook, Util.FindPattern("client.dll", "55 8B EC 51 53 56 57 E8 ? ? ? ? 83 F8"), 0);
    RegisterCallback("OnMenu", OnMenuCallback);
    RegisterCallback("OnCreateMove", OnCreateMoveCallback);
}