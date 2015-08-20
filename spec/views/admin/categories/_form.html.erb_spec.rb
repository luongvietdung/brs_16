require "rails_helper"

describe "admin/categories/form", type: :view do
  let(:category) {FactoryGirl.create :category,
    name: "Test category", description: "DescriptionDescription"}

  subject {rendered}

  before do
    assign :category, category
    render "admin/categories/form"
  end

  context "display correct partial form" do
    it "render form errors" do
      is_expected.to render_template partial: "_form_errors"
    end

    it "correct attributes and field of" do
      is_expected.to have_selector "form[action='/admin/categories/#{category.id}'][method='post']" do |f|
        f.is_expected.to have_selector "input[type='submit'][value='#{I18n.t("application.buttons.save")}']"
        f.is_expected.to have_selector "input[name='category[name]'][type='text'][id='category_name']"
        f.is_expected.to have_selector "textarea[name='category[description]'][id='category_description']"
      end
    end

    it "have a link for back" do
      is_expected.to have_link I18n.t("application.buttons.back"),
        href: "/admin/categories"
    end
  end
end
