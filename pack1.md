# 🧠 SmartContent Wizard: The AI-Powered SEO Blog Generator

**SmartContent Wizard** is an interactive, AI-guided tool designed to help marketers and creators generate SEO-rich blog content, complete with embedded research, branded links, visuals, and repurposed outputs — all via a friendly, human-in-the-loop experience.

This document outlines each step of the SmartContent Wizard workflow including variables, human interactions, UI types, and complete prompts.

---

## 🔧 Step-by-Step Breakdown

### 🔹 Step 0: Setup — Define Key Variables

**Role:** Human  
**HITL Type:** Text inputs, dropdowns  
**Button:** "Start with these"

**Variables Collected:**
- `[fact_sheet]` – Primer about the brand, tone, goals
- `[target_audience]` – The audience segment the blog is targeting

---

### 🔹 Step 1: Topic Generation

**Role:** Bot  
**HITL Type:** Card/radio list + optional conversation refinement  
**Button:** "Use this Topic"

**Prompt:**
```
Based on the following fact sheet and target audience, act as an investigative journalist and suggest 5 timely and relevant blog topics for the next 30 days.

Fact Sheet: [fact_sheet]  
Target Audience: [target_audience]
```

**Variables:**
- `[topic_list]` (bot output)
- `[selected_topic]` (user-selected)

---

### 🔹 Step 2: Research Highlights

**Role:** Bot  
**HITL Type:** List preview, optional edit  
**Button:** "Use Highlights"

**Prompt:**
```
Using the selected topic: [selected_topic], please conduct brief research and return 10 key highlights in a numbered list. These should include insights, data, trends, or useful facts relevant to this topic.
```

**Variable:**
- `[research_highlights]`

---

### 🔹 Step 3: Extended Research (Optional)

**Role:** Human  
**HITL Type:** Manual text input (Google FAQ copy/paste)  
**Button:** "Save FAQs"

**Variable:**
- `[other_faqs]`

---

### 🔹 Step 4: Blog Generation (Basic Flow)

**Role:** Bot  
**HITL Type:** Blog preview + edit/revision options  
**Button:** "Looks Good" / "Ask for Rewrite"

**Prompt:**
```
Using the topic “[selected_topic]” and the following key highlights:
[research_highlights]

Write a 600-word blog post that is informative, clear, and engaging. Add a one-sentence summary at the top and conclude with a "Key Takeaways" section in bullet point format. Please avoid overuse of bold or formatting gimmicks.
```

**Variable:**
- `[blog_post]`

---

### 🔹 Step 5: Blog Generation (Advanced SEO Flow)

**Role:** Bot  
**HITL Type:** Field collection for links, CTA, and FAQs  
**Button:** "Generate SEO Article"

**Prompt:**
```
Please write an SEO optimised article on [selected_topic].

Please answer the following questions in your article:  
[other_faqs]

Include anchored text keyword hyperlinks within the text to:
- Products: [link_products]  
- References: [link_references]

Include a compelling CTA message: [cta_message]  
Include a CTA link: [cta_link]

Please write the blog post, making sure it is 600–1000 words long and is written in an easy-to-read, clear and informative tone. Include appropriate references to credible links. Do not include any 'instructional' or meta texts — just provide the final copy.
```

**Variables:**
- `[link_products]`, `[link_references]`, `[cta_message]`, `[cta_link]`

---

### 🔹 Step 6: Image Generation

**Role:** Bot  
**HITL Type:** Image preview + regenerate option  
**Button:** "Use Image" / "Try Another"

**Prompt:**
```
Generate a high-resolution, eye-catching header image to accompany a blog post on the topic: [selected_topic]. The image should be conceptually relevant and visually compelling.
```

**Variable:**
- `[blog_image]`

---

### 🔹 Step 7: Repurposing for Social + Video

**Role:** Bot  
**HITL Type:** Multi-select for platforms, preview of generated content  
**Button:** "Generate Content Set"

**Prompt:**
```
Using the blog post: [blog_post], generate:
- 3 social media post variations tailored for [platforms]  
- A short-form video teleprompter script summarizing the key ideas of the blog for vertical video use
```

**Variables:**
- `[social_posts]`, `[video_script]`, `[platforms]`

---

## 🪄 Suggested Tool Name: **SmartContent Wizard**

A marketing-friendly, professional-sounding name that conveys:
- Intelligence (Smart)
- Ease of use (Wizard)
- Focus on content (Content)

Alternative names:
- **PromptCraft Pro**
- **BlogBuilder AI**
- **SEO Flowchain**
- **InspireWriter**

---

Let me know if you'd like this exported as a PDF, turned into a UI wireframe, or built as a prototype!

