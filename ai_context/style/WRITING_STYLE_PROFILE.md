# WRITING_STYLE_PROFILE

Use this file to codify writing style for repository documentation.

## Inputs analyzed

- Source files reviewed:
  - `ai_context/style/examples/4.2.1.30_FY24Q2_FPEAM_milestone.docx`
  - `ai_context/style/examples/dhetting_resume.docx`
  - `ai_context/style/examples/final_exam (1).tex`
  - `ai_context/style/examples/final_exam.tex`
  - `ai_context/style/examples/final_report.tex`
  - `ai_context/style/examples/fuel.docx`
  - `ai_context/style/examples/FY24Q2_milestone_report.docx`
  - `ai_context/style/examples/HW1.tex`
  - `ai_context/style/examples/HW2.4.tex`
  - `ai_context/style/examples/HW2.tex`
  - `ai_context/style/examples/HW3.tex`
  - `ai_context/style/examples/HW4.tex`
  - `ai_context/style/examples/HW5.tex`
  - `ai_context/style/examples/HW6.tex`
  - `ai_context/style/examples/HW7.tex`
  - `ai_context/style/examples/LA100_Ch10_EJ_FINAL REVIEW.docx`
  - `ai_context/style/examples/main (1).tex`
  - `ai_context/style/examples/milestone.tex`
  - `ai_context/style/examples/proposal.tex`
  - `ai_context/style/examples/Q1FY2021-memo.docx`
  - `ai_context/style/examples/vmt.docx`
- Example snippets reviewed:
  - Structured report sections (`Summary`, `Background`, `Current Work`, `Conclusions`, `Future work`)
  - Long-form technical explanations with definitions and rationale
  - Enumerated lists for task breakdowns and assumptions
  - Citation-heavy and acronym-heavy passages (e.g., NREL, EPA, MOVES, FPEAM)
- Confidence level: medium

## Style summary

- Tone: objective, technical, analytic, and evidence-driven.
- Formality: high; avoid conversational phrasing and rhetorical filler.
- Typical paragraph length: medium to long (4-10 sentences) for technical exposition; short lead paragraphs acceptable for section intros.
- Preferred heading style: noun-based, descriptive section names (`Background`, `Methods`, `Results`, `Conclusions`, `Future work`).
- Preferred command/example formatting: examples should be clearly separated from prose and introduced with context; use concise lead-in text before examples.

## Required patterns

- State purpose early in each section (first 1-2 sentences).
- Define domain-specific acronyms at first use, then use acronyms consistently.
- Use precise technical vocabulary; prefer concrete nouns and measurable claims over vague statements.
- Explain causality and trade-offs explicitly (`because`, `as a result`, `to ensure`, `thus`).
- Use sectioned structure with clear progression: context -> method/approach -> output/findings -> implications/next step.
- Keep statements neutral and verifiable; prefer statements that can be traced to data, process, or system behavior.
- When listing process steps, use ordered lists with action-first phrasing.
- Use short transition phrases between dense paragraphs (`In this work`, `Current work`, `Future work includes`).

## Forbidden patterns

- Informal voice, slang, hype, or marketing-style claims.
- Ambiguous pronouns without clear referents in technical descriptions.
- Unqualified superlatives (`best`, `fastest`, `always`) without evidence.
- Overly terse one-line explanations for complex behavior.
- Dense jargon dumps without definitions for key terms/acronyms.
- Opinion-first writing without method or evidence context.

## Documentation structure rules

- Organize docs into stable technical sections:
  1. Scope/Overview
  2. Background/Context
  3. Method/Workflow or Interface/Behavior
  4. Outputs/Results/Validation expectations
  5. Limitations/Risks
  6. Next actions or follow-up references
- Use headings to mirror how a technical reader scans: what it is -> how it works -> what to do.
- Put critical constraints close to the relevant workflow step, not only in a distant notes section.
- Keep tables and lists as supporting structures; keep reasoning in prose paragraphs.

## Quick-start style rules

- Start with one sentence that states the goal and expected outcome.
- Present steps as a short ordered sequence with explicit verbs (`Install`, `Run`, `Verify`, `Continue`).
- For each step, include only required context and avoid theoretical digressions.
- Keep quick-start examples executable and minimal; avoid embedding long background paragraphs inside step lists.
- End with a short confirmation statement describing expected result and where to go next for deeper guidance.

## Comprehensive-guide style rules

- Use full technical narrative: include rationale, assumptions, constraints, and alternatives.
- Prefer section flow: `Background` -> `Methods/Architecture` -> `Results/Behavior` -> `Future work`/`Limitations`.
- Allow longer paragraphs for dense concepts, but split when topic focus changes.
- Preserve explicit terminology consistency across sections; do not rename the same concept in different sections.
- Include edge-case or failure-mode discussion when describing complex systems/workflows.

## API/interface documentation style rules

- For each interface, document:
  1. Purpose and scope
  2. Inputs (names, types/shape, required vs optional)
  3. Behavior and processing expectations
  4. Outputs and side effects
  5. Constraints/limits and known failure conditions
- Use precise, declarative language for behavior (`returns`, `requires`, `denies`, `updates`).
- Include acronym expansion on first mention in each standalone API section.
- Avoid undocumented implied behavior; if behavior is inferred, label it as inference.

## Preferred phrasing examples

- "This workflow prepares the repository for..."
- "The model calculates ... using ..."
- "To ensure consistency, ..."
- "As a result, ..."
- "Current work focuses on ..."
- "Future work includes ..."
- "The interface requires ... and returns ..."
- "The following steps validate ..."

## Notes for documentation-agent

- Primary style target is formal technical-report prose adapted to repository docs.
- Keep language precise and method-centric; explain why a step exists, not just what to type.
- Because source examples are mostly reports and academic writing (not CLI guides), apply the tone/structure rules directly but keep command sections concise and execution-focused.
- When uncertain between brevity and completeness, preserve correctness and explicit constraints first.
- Assumptions: this profile is intentionally based only on `ai_context/style/examples/` per user scope, excluding README/docs and other repository writing.
