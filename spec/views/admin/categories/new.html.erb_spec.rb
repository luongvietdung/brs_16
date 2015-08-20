require "rails_helper"

describe "admin/categories/new", type: :view do
  let(:category) {Category.new}

  subject {rendered}

  before do
    assign :category, category
    render
  end

  context "display new page" do
    it "have title" do
      is_expected.to have_selector "h1", text: I18n.t("admin.categories.new.title")
    end

    it "render partial form" do
      is_expected.to render_template partial: "_form"
    end

    it "correct attributes form" do
      is_expected.to have_selector "form[method='post'][action='/admin/categories'][id='new_category']"
    end
  end
end
