import type { Plugin } from "@opencode-ai/plugin"
import { join } from "path"
import { homedir } from "os"

const SOUNDS_DIR = join(homedir(), ".config/opencode/plugin/sounds")
const ICON_PATH = join(homedir(), ".config/opencode/plugin/oc-icon.png")

// All available Duke Nukem sounds - swap these in the SOUND_MAP below to change what plays
// Sound file                      | Duke quote
// --------------------------------|-----------------------------------------
// ahh.wav                         | "Ahhhh!"
// aint_got_time_to_bleed.wav      | "I ain't got time to bleed"
// cool.wav                        | "Cool"
// didnt_feel_lucky.wav            | "Well, I guess you didn't feel so lucky, punk"
// gonna_get_you_suckers.wav       | "Uuuh I'm gonna get you suckers"
// grade_a_man_steak.wav           | "100% grade A man steak baby"
// hail_to_the_king.wav            | "Hail to the king, baby"
// helloooo.wav                    | "Helloooo"
// hurts_to_be_you.wav             | "It hurts to be you"
// in_due_time.wav                 | "In due time you pussy bastards"
// kick_some_ass.wav               | "Time to kick some ass"
// lucky_son_of_a_bitch.wav        | "Lucky son of a bitch"
// payback_time.wav                | "*laughter*, payback time"
// thats_what_im_talking_about.wav | "Mmm, that's what I'm talking about"
// this_sucks.wav                  | "This sucks"
// time_to_make_tracks.wav         | "It's time to make tracks"
// ugly_tree.wav                   | "Damn, you are the ugly tree"
// wasted.wav                      | "*laughter*, wasted"
// woops.wav                       | "Woops"
// yippie_ki_yay.wav               | "Yippie ki-yay motherf***er"
// you_suck.wav                    | "You suck"
// youre_pissing_me_off.wav        | "You're pissing me off"

const SOUND_MAP = {
  "session.idle": "yippie_ki_yay.wav",
  //"session.error": "lucky_son_of_a_bitch.wav",
  "permission.asked": "aint_got_time_to_bleed.wav",
} as const

type SoundEvent = keyof typeof SOUND_MAP

function soundPath(event: SoundEvent): string {
  return join(SOUNDS_DIR, SOUND_MAP[event])
}

async function playSound($: any, event: SoundEvent) {
  const path = soundPath(event)
  $`afplay ${path}`.catch(() => { })
}

async function sendNotification(
  $: any,
  { title = "OpenCode", message }: { title?: string; message: string },
) {
  $`terminal-notifier -appIcon ${ICON_PATH} -title ${title} -message ${message}`.catch(() => { })
}

async function isMainSession(client: any, sessionID: string): Promise<boolean> {
  try {
    const result = await client.session.get({ path: { id: sessionID } })
    const session = result.data ?? result
    return !session.parentID
  } catch {
    return true
  }
}

export const NotificationPlugin: Plugin = async ({ client, $ }) => {
  return {
    event: async ({ event }) => {
      if (event.type === "session.idle") {
        const sessionID = event.properties.sessionID
        if (await isMainSession(client, sessionID)) {
          playSound($, "session.idle")
          sendNotification($, { message: "Session is idle" })
        }
      }

      // if (event.type === "session.error") {
      //   const message = event.properties.error?.name ?? "Unknown Error"
      //   playSound($, "session.error")
      //   sendNotification($, {
      //     title: "OpenCode - Session Error",
      //     message,
      //   })
      // }

      // if (event.type === "permission.updated") {
      //   playSound($, "permission.asked")
      //   sendNotification($, { message: "Permission needed" })
      // }
    },
  }
}
