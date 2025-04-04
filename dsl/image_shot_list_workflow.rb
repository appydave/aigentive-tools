Agent.create(:image_shot_list_workflow) do
  description "Creates a cinematic image shot plan from a transcript and prepares AI prompts."

  attributes do
    attribute :transcript, type: :string
    attribute :shot_list, type: :array, schema: :ShotListItem
    attribute :design_style, type: :string
    attribute :generated_prompts, type: :array, schema: :ShotPromptItem
  end

  section "Shot Planning" do
    step "Generate Shot List" do
      input :transcript, component: :textarea, label: "Transcript to extract visual scenes from"
      output :shot_list, component: :editable_list, label: "Shot List"
    end

    step "Select Style" do
      input :design_style, component: :dropdown, label: "Choose a visual style", options: ["cinematic", "studio", "natural light"]
      output :design_style
    end

    step "Generate Image Prompts" do
      input :shot_list, context: true
      input :design_style, context: true
      output :generated_prompts, component: :multiline_textarea, label: "Generated AI prompts per shot"
    end
  end
end
