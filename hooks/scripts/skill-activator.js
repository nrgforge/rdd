#!/usr/bin/env node
// UserPromptSubmit hook: detect RDD-related prompts and suggest appropriate phase skill
// Also prevents brainstorming override on explicit RDD requests (ADR-035)

const readline = require("readline");

const rl = readline.createInterface({ input: process.stdin });
let input = "";

rl.on("line", (line) => {
  input += line;
});

rl.on("close", () => {
  try {
    const data = JSON.parse(input);
    const prompt = (data.prompt || data.content || "").toLowerCase();

    // Explicit RDD invocation patterns
    const explicitPatterns = [
      /\buse rdd\b/,
      /\brdd research\b/,
      /\brdd cycle\b/,
      /\bstart.*rdd\b/,
      /\b\/rdd\b/,
      /\brdd-research\b/,
      /\brdd:research\b/,
    ];

    // Phase-specific patterns
    const phasePatterns = {
      research: /\brdd.*research\b|\bresearch.*rdd\b/,
      product: /\brdd.*product\b|\bproduct.*discover/,
      model: /\brdd.*model\b|\bdomain.*model/,
      decide: /\brdd.*decide\b|\brdd.*adr\b/,
      architect: /\brdd.*architect\b/,
      build: /\brdd.*build\b/,
      synthesis: /\brdd.*synthe/,
      conform: /\brdd.*conform\b|\bconformance.*audit\b/,
    };

    const isExplicit = explicitPatterns.some((p) => p.test(prompt));

    if (isExplicit) {
      // Find most specific phase match
      let phase = "research"; // default
      for (const [name, pattern] of Object.entries(phasePatterns)) {
        if (pattern.test(prompt)) {
          phase = name;
          break;
        }
      }

      console.log(
        `The user has explicitly requested an RDD workflow. RDD research serves as the brainstorming/exploration phase — proceed directly to /rdd:${phase} without invoking brainstorming or other exploratory skills. The user's explicit intent takes precedence over default process.`
      );
    }
  } catch {
    // Parse failure — don't inject anything
  }
});
