import type { Plugin } from "@opencode-ai/plugin"
import { $ } from "bun"
import { join } from "path"
import { existsSync } from "fs"

const PLUGIN_DIR = "/Users/ahirdman/.dotfiles/.config/opencode/plugin"
const ICON_PATH = join(PLUGIN_DIR, "oc-icon.png")

// Configure your custom sound file here
// Supports: .wav, .mp3, .aiff, .m4a, and other audio formats
const SOUND_FILE = "notification-sound.mp3" // Change this to your sound file name
const SOUND_PATH = join(PLUGIN_DIR, SOUND_FILE)

async function sendNotification({title = "OpenCode", message }: {title?: string, message: string }) {
    // Check if custom sound exists, fallback to default or no sound
    const soundArg = existsSync(SOUND_PATH) ? ["-sound", SOUND_PATH] : []

    await $`terminal-notifier -appIcon ${ICON_PATH} -title ${title} -message ${message} ${soundArg}`
}

export const NotificationPlugin: Plugin = async ({ client, $, ...rest }) => {
  return {
    event: async ({ event }) => {
      if (event.type === "session.idle") {
        await sendNotification({
          message: "Session is idle",
        })
      }

      if (event.type === "session.error") {
        const message = event.properties.error?.name ?? "Unknown Error"

        await sendNotification({title: "OpenCode - Session Error", message })
      }
    },
  }
}

