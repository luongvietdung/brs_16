require "rails_helper"

describe "admin/categories/edit", type: :view do
  let(:category) {FactoryGirl.create :category,
    name: "Test category", description: "DescriptionDescription"}

  subject {rendered}

  before do
    assign :category, category
    render
  end

  context "display edit page" do
    it "have title" do
      is_expected.to have_selector "h1",
        text: I18n.t("admin.categories.edit.title", category: "Test category")
    end

    it "render partial form" do
      is_expected.to render_template partial: "_form"
    end

    it "correct attributes form" do
      is_expected.to have_selector "form[action='/admin/categories/#{category.id}'][method='post'][id='edit_category_#{category.id}']"
    end
  end
end
