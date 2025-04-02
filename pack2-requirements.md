# 📝 ContentFlow Creator – MVP Requirements Document

## 1. Project Overview

**ContentFlow Creator** is a lightweight, interactive web-based tool designed to help marketers and content creators build a full month’s worth of structured, platform-ready social media posts. It leverages AIGENTIVE AI workflows to support content generation while allowing for human-in-the-loop (HITL) decision-making at every key step.

The goal is to enable users to:
- Source content themes based on trending topics
- Apply hook-based messaging techniques
- Generate weekly post formats (motivational, educational, surprise, carousel)
- Supplement posts with image suggestions

This MVP focuses on a guided wizard-like UI for a single user, with no authentication, roles, or analytics.

---

## 2. System Overview

### Backend:
- **AI Platform:** AIGENTIVE
- **Integration:** REST API or SDK agent calls
- **Workflows/Agents:** Each wizard step maps to a specific AIGENTIVE agent

### Frontend:
- **Framework:** React (library/tooling chosen by developer team)
- **Design:** Uses basic components (e.g. text inputs, dropdowns, cards)
- **Behavior:** Step-based navigation with stateful HITL interaction

---

## 3. UX Flow (Wizard Screens)

### Step 0: Setup
- **Inputs:**
  - Fact Sheet (`[fact_sheet]`)
  - Target Audience (`[target_audience]`)
- **Component Types:** Text area, text input or dropdown
- **Action:** Save and proceed
- **Button Text:** "Start with these"

### Step 1: Theme Research
- **API Call:** `research_trends`
- **Inputs:** `[fact_sheet]`, `[target_audience]`
- **Output:** `[monthly_theme_summary]`
- **User Action:** Confirm output is relevant
- **Button Text:** "Use This Theme"

### Step 2: Lock Theme
- **Inputs:** `[monthly_theme_summary]`
- **Instructional Message:** Bot must wait for further steps
- **User Action:** Confirm and proceed
- **Button Text:** "Theme Locked"

### Step 3: Hook Strategy
- **No agent call (instructional only)**
- **UI:** Static examples of 4 hook types
- **User Action:** Review examples
- **Button Text:** "Continue"

### Step 4: Weekly Post Generation
- **API Call:** `generate_posts`
- **Inputs:** `[fact_sheet]`, `[target_audience]`, `[locked_theme]`, `[hook_types]`
- **Outputs:** `[weekly_posts]`, `[content_table]`
- **UI:** Post preview cards and content table (6–8 columns)
- **User Action:** Accept or request rewrite
- **Buttons:** "Use These Posts" / "Ask for Rewrites"

### Step 5: Image Suggestions
- **API Call:** `suggest_images`
- **Inputs:** `[weekly_posts]`, `[date]`
- **Output:** `[image_recommendations]`
- **UI:** Image gallery (1–3 per post), thumbnail with preview
- **User Action:** Select preferred image
- **Button Text:** "Use This Image"

---

## 4. Agent Bindings

| Step | Agent Name         | Inputs                                          | Outputs                   |
|------|--------------------|--------------------------------------------------|----------------------------|
| 1    | `research_trends`  | `[fact_sheet]`, `[target_audience]`             | `[monthly_theme_summary]` |
| 4    | `generate_posts`   | `[fact_sheet]`, `[target_audience]`, `[locked_theme]`, `[hook_types]` | `[weekly_posts]`, `[content_table]` |
| 5    | `suggest_images`   | `[weekly_posts]`, `[date]`                      | `[image_recommendations]` |

---

## 5. Variables Summary
- `[fact_sheet]`
- `[target_audience]`
- `[monthly_theme_summary]`
- `[locked_theme]`
- `[hook_types]`
- `[weekly_posts]`
- `[content_table]`
- `[image_recommendations]`

---

## 6. MVP Scope Constraints

The following are **intentionally excluded** from the MVP:
- ❌ Authentication, user roles, or session persistence
- ❌ Custom validation (use default behavior of UI components)
- ❌ State management strategy or storage details (left to devs)
- ❌ Analytics, metrics, or tracking
- ❌ Custom branding or white labeling
- ❌ Advanced media generation (e.g. video script prompt chain)

---

Let me know if you'd like a developer checklist or wireframe mockups next.

