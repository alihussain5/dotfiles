import { readFileSync } from "node:fs";
import { homedir } from "node:os";
import { join } from "node:path";
import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

const SKILL_PATH = join(homedir(), ".agents", "skills", "i-have-adhd", "SKILL.md");

// Strip YAML frontmatter so only the instruction body is injected.
function loadRules(): string {
  const raw = readFileSync(SKILL_PATH, "utf8");
  return raw.replace(/^---\n[\s\S]*?\n---\n/, "").trim();
}

export default function (pi: ExtensionAPI) {
  let rules = "";
  try {
    rules = loadRules();
  } catch {
    rules = "";
  }

  pi.on("before_agent_start", async (event) => {
    if (!rules) return;
    return {
      systemPrompt:
        event.systemPrompt +
        "\n\n<i-have-adhd-output-style>\n" +
        rules +
        "\n</i-have-adhd-output-style>",
    };
  });
}
