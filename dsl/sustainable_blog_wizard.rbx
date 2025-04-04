Agent.create(:sustainable_blog_wizard) do
  description "Guided workflow to generate an SEO blog article with images."

  tools do
    tool :leonardo_image_generator, type: :api, config: {
      endpoint: "https://leonardo.ai/api/generate",
      method: :post,
      params: [:prompt, :style, :aspect_ratio]
    }
  end

  attributes do
    attribute :business_description, type: :string
    attribute :target_audience, type: :string
    attribute :selected_topic, type: :string
    attribute :selected_highlights, type: :array
    attribute :extended_research, type: :string
    attribute :blog_post_html, type: :string, schema: :BlogPost
    attribute :image_url, type: :image
    attribute :image_shot_plan, type: :workflow_reference, workflow: :image_shot_list_workflow
  end

  section "Topic & Research" do
    step "Getting Started" do
      input :business_description, component: :textarea
      input :target_audience, component: :dropdown_with_create
      output :business_description
      output :target_audience
    end

    step "Choose a Topic" do
      input :business_description, context: true
      input :target_audience, context: true
      input :selected_topic, component: :card_selector
      output :selected_topic
    end

    step "Research Highlights" do
      input :selected_topic, context: true
      input :selected_highlights, component: :checkbox_list_editable
      output :selected_highlights
    end

    step "Extended Research" do
      input :extended_research, component: :textarea
      output :extended_research
    end
  end

  section "Blog & Visuals" do
    step "Generate Blog" do
      input :selected_topic, context: true
      input :selected_highlights, context: true
      input :extended_research, context: true
      output :blog_post_html, schema: :BlogPost
    end

    step "Plan Image Shots" do
      input :blog_post_html, context: true
      input :image_shot_plan, component: :workflow_link, label: "Create shot list and prompts for images"
      output :image_shot_plan
    end

    step "Generate Image" do
      input :selected_topic, context: true
      input :image_url
      tool :leonardo_image_generator
      output :image_url
    end
  end
end
