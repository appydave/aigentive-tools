# 📝 SmartContent Wizard – MVP Requirements Document

## 1. Project Overview

**SmartContent Wizard** is an AI-guided web application that helps users create SEO-rich blog content through structured, human-in-the-loop interactions. The application will communicate with AI workflows hosted on the AIGENTIVE platform and provide a React-based frontend UI using standard component libraries.

### Goals
- Streamline the creation of blog posts using AI-assisted workflows
- Allow human users to review, refine, and guide content generation
- Use a simple, step-based wizard interface for clarity and usability

### Tech Stack Overview
- **Backend:** AIGENTIVE Workflows & Agents (API or SDK)
- **Frontend:** Built in React using default component libraries (e.g. shadcn/ui)
- **API Communication:** REST-based calls between frontend and AIGENTIVE agent endpoints

---

## 2. UX Flow (Wizard Steps)

Each step is a page in a linear wizard flow. All steps are human-in-the-loop interactions.

### Step 0: Setup
- **User Inputs:**
  - `[fact_sheet]` (multiline text input)
  - `[target_audience]` (text input or dropdown)
- **UI Elements:** Text field, dropdown, button
- **Button:** `Start with these`
- **API Call:** None – data is stored for use in subsequent steps

### Step 1: Topic Generation
- **Bot Action:** Suggest 5 blog topics
- **UI Elements:** Cards or list with radio/select
- **User Action:** Select one topic
- **Button:** `Use this Topic`
- **Variable Captured:** `[selected_topic]`
- **API Call:** Send `[fact_sheet]` and `[target_audience]` to agent `generate_topics`

### Step 2: Research Highlights
- **Bot Action:** Generate 10 key points on selected topic
- **UI Elements:** List view, optional remove/edit buttons
- **User Action:** Approve list or refine
- **Button:** `Use Highlights`
- **Variable Captured:** `[research_highlights]`
- **API Call:** Send `[selected_topic]` to agent `generate_highlights`

### Step 3: Extended Research (Optional)
- **User Action:** Paste 3–5 "People Also Asked" questions from Google
- **UI Elements:** Multi-line text input
- **Button:** `Save FAQs`
- **Variable Captured:** `[other_faqs]`
- **API Call:** None

### Step 4: Blog Generation (Basic)
- **Bot Action:** Generate blog post using research highlights
- **UI Elements:** Blog preview card or scroll area
- **User Action:** Accept or ask for rewrite
- **Button:** `Looks Good` / `Ask for Rewrite`
- **Variable Captured:** `[blog_post]`
- **API Call:** Send `[selected_topic]`, `[research_highlights]` to agent `write_blog`

### Step 5: Blog Generation (Advanced SEO)
- **User Inputs:**
  - `[other_faqs]` (optional)
  - `[link_products]` (comma-separated list)
  - `[link_references]` (comma-separated list)
  - `[cta_message]` (text input)
  - `[cta_link]` (URL input)
- **UI Elements:** Field inputs
- **Button:** `Generate SEO Article`
- **Variable Captured:** Refined `[blog_post]`
- **API Call:** Send all inputs to agent `write_seo_blog`

### Step 6: Image Generation
- **Bot Action:** Create image prompt for blog post
- **UI Elements:** Image preview
- **User Action:** Accept or regenerate
- **Button:** `Use Image` / `Try Another`
- **Variable Captured:** `[blog_image]`
- **API Call:** Send `[selected_topic]` to agent `generate_image`

### Step 7: Repurposing
- **User Inputs:**
  - `[platforms]` (multi-select dropdown)
- **Bot Action:** Generate social posts and a video script
- **UI Elements:** Preview cards for social copy and script
- **Button:** `Generate Content Set`
- **Variables Captured:** `[social_posts]`, `[video_script]`
- **API Call:** Send `[blog_post]`, `[platforms]` to agent `repurpose_content`

---

## 3. Agent Binding Table

| Step | Agent Name | Inputs | Outputs |
|------|------------|--------|---------|
| 1 | `generate_topics` | `[fact_sheet]`, `[target_audience]` | `[topic_list]` |
| 2 | `generate_highlights` | `[selected_topic]` | `[research_highlights]` |
| 4 | `write_blog` | `[selected_topic]`, `[research_highlights]` | `[blog_post]` |
| 5 | `write_seo_blog` | `[selected_topic]`, `[other_faqs]`, `[link_products]`, `[link_references]`, `[cta_message]`, `[cta_link]` | `[blog_post]` |
| 6 | `generate_image` | `[selected_topic]` | `[blog_image]` |
| 7 | `repurpose_content` | `[blog_post]`, `[platforms]` | `[social_posts]`, `[video_script]` |

---

## 4. Out of Scope

The following elements are not required for MVP and are excluded from this document:
- Frontend architecture or implementation details (state, routing, etc.)
- Custom validation rules (use default input behavior)
- Permissions, roles, or authentication
- Analytics or feedback systems
- Custom theming or branding (use defaults)

---

Let me know when you're ready to build out UI mockups or a developer-ready API spec.

