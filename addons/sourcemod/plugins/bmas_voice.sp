#include <sourcemod>
#include <sdktools>
#include <cstrike>

#define MINUTE_SOUND "csgo/addons/sourcemod/sound/minute.wav"
#define TWENTY_SECOND_SOUND "csgo/addons/sourcemod/sound/twenty_seconds.wav"

public Plugin:myinfo =
{
    name = "Round Timer Sounds",
    author = "Your Name",
    description = "Plays sounds when 1 minute or 20 seconds are remaining in the round",
    version = "1.0",
    url = "https://www.example.com"
};

public void OnMapStart()
{
    // Reset the timer sound flags when a new map starts
    SetGlobalFlag("played_minute_sound", false);
    SetGlobalFlag("played_twenty_second_sound", false);
}

public void OnTick()
{
    // Get the current time remaining in the round
    int time_remaining = GetTimeLeft();
    
    // Check if 1 minute is remaining in the round
    if (time_remaining == 60 && !GetGlobalFlag("played_minute_sound"))
    {
        // Play the minute sound
        PlaySoundToAll(MINUTE_SOUND);
        
        // Set the flag so that the sound is not played again
        SetGlobalFlag("played_minute_sound", true);
    }
    
    // Check if 20 seconds is remaining in the round
    if (time_remaining == 20 && !GetGlobalFlag("played_twenty_second_sound"))
    {
        // Play the twenty second sound
        PlaySoundToAll(TWENTY_SECOND_SOUND);
        
        // Set the flag so that the sound is not played again
        SetGlobalFlag("played_twenty_second_sound", true);
    }
}

/**
 * Plays a sound to all players.
 *
 * @param sound      The sound file to play.
 * @param volume     The volume to play the sound at (0.0-1.0).
 * @param attenuation The attenuation of the sound (0.0-4.0).
 */
native void PlaySoundToAll(const char[] sound, float volume = 1.0, float attenuation = 1.0);

/**
 * Sets a global flag to the specified value.
 *
 * @param flag  The name of the flag to set.
 * @param value The value to set the flag to.
 */
native void SetGlobalFlag(const char[] flag, bool value);

/**
 * Gets the value of a global flag.
 *
 * @param flag The name of the flag to get.
 * @return     The value of the flag.
 */
native bool GetGlobalFlag(const char[] flag);

/**
 * Gets the time remaining in the round in seconds.
 *
 * @return The time remaining in the round in seconds.
 */
native int GetTimeLeft();
