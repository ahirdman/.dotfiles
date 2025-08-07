import type { Plugin } from "@opencode-ai/plugin"

export const NotificationPlugin: Plugin = async ({ client, $ }) => {
  return {
    event: async ({ event }) => {
      if (event.type === "session.idle") {
        await $`/usr/bin/osascript -e 'display notification "Session completed!" with title "opencode"'`
      }
    },
  }
}

