# 📅 ContentFlow Creator: The AI-Powered Monthly Content Calendar Assistant

**ContentFlow Creator** is an interactive prompt chain designed to help creators, marketers, and social media managers build structured, SEO- and engagement-optimized content calendars across platforms like Instagram, Facebook, LinkedIn, and more.

It combines AI-powered generation with human-in-the-loop approvals, providing flexibility, creativity, and clarity throughout every phase of content development—from topic discovery to image suggestions.

---

## 🔧 Step-by-Step Breakdown

### 🔹 Step 0: Setup — Define Key Variables
**Role:** Human  
**HITL Type:** Text inputs  
**Button:** "Start with these"

**Variables Collected:**
- `[fact_sheet]` – Brand overview, tone, messaging priorities
- `[target_audience]` – Who the content is for

---

### 🔹 Step 1: Trend & Theme Research
**Role:** Bot  
**HITL Type:** Review + selection  
**Button:** "Use This Theme"

**Prompt:**
```
Please search for trending topics and struggles that are relevant to my target audience this month. Provide a summary of what you learn, and sources.
```

**Output Variable:**
- `[monthly_theme_summary]`

---

### 🔹 Step 2: Lock the Theme
**Role:** Human → Bot  
**HITL Type:** Manual text insert + conversation  
**Button:** "Theme Locked"

**Prompt:**
```
Please use [monthly_theme_summary] as the inspiration for our content calendar, which we will create together. Don’t do anything yet. I will give you step-by-step instructions. Do you understand?
```

**Variable:**
- `[locked_theme]`

---

### 🔹 Step 3: Hook Strategy Setup
**Role:** Bot  
**HITL Type:** Informational setup, no generation yet  
**Button:** "Continue"

**Prompt:**
```
Act as an experienced social media content creator and create a social media content plan for the month of [month].

When creating posts, please use engaging and interesting hooks. Here are four examples of great hooks:

1. Question Hook – "Struggling with chronic back pain? Swipe to discover the top 3 exercises."
2. Surprising Fact Hook – "Did you know sitting more than 8 hours/day can reduce lifespan?"
3. Bold Statement Hook – "Fix your posture in just one week!"
4. Challenge Hook – "Think you’re flexible? Try these 5 stretches."

Please use these types of hooks when you create posts, adapting them to our theme and audience. Do not generate yet.
```

**Variable Introduced:**
- `[hook_types]`

---

### 🔹 Step 4: Generate Weekly Posts
**Role:** Bot  
**HITL Type:** Full preview of generated weekly posts  
**Button:** "Use These Posts" / "Ask for Rewrites"

**Prompt:**
```
Please create 4 posts for each week, suitable for [platforms] like Instagram and Facebook. Create slightly different versions for each platform. Include relevant hashtags and links.

Post 1: Motivational/Inspirational — with a one-sentence quote headline.
Post 2: Educational "Did you know?" — (200+ words, 1–3 hashtags, source link).
Post 3: Surprise — Share a little-known fact.
Post 4: Carousel (4 pages):
  - Page 1: Hook from [hook_types]
  - Page 2: A key benefit (the what)
  - Page 3: Three reasons why it matters
  - Page 4: CTA

When you're done, structure output as a table with:
Post ID | Date | Platform | Copy | Hashtags | Source Link
```

**Output Variable:**
- `[weekly_posts]`
- `[content_table]`

---

### 🔹 Step 5: Image Suggestions
**Role:** Bot  
**HITL Type:** Preview or accept  
**Button:** "Use This Image"

**Prompt:**
```
Please search for appropriate images to use with the post for [date].
```

**Output Variable:**
- `[image_recommendations]`

---

## 🧩 Summary of Variables
- `[fact_sheet]`
- `[target_audience]`
- `[monthly_theme_summary]`
- `[locked_theme]`
- `[hook_types]`
- `[weekly_posts]`
- `[content_table]`
- `[image_recommendations]`

---

## 🪄 Suggested Tool Name: **ContentFlow Creator**

Alternative names:
- **PostPlanner AI**
- **SocialMap Wizard**
- **CalendarCrafter**
- **ContentPilot**

---

Let me know if you'd like to extend this into a UI wireframe, workflow spec, or add editable step-by-step instructions.

