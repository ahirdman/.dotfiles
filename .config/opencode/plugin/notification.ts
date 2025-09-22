import type { Plugin } from "@opencode-ai/plugin"
import { $ } from "bun"

async function sendNotification({title = "OpenCode", message }: {title?: string, message: string }) {
    await $`terminal-notifier -appIcon "/Users/ahirdman/.dotfiles/.config/opencode/plugin/oc-icon.png" -title ${title} -message ${message} -sound "/Users/ahirdman/.dotfiles/.config/opencode/plugin/done.wav"`
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

