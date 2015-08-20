require "rails_helper"

describe "admin/categories/category", type: :view do
  subject(:category) {FactoryGirl.create :category,
    name: "Test category", description: "DescriptionDescription"}

  context "display partial category" do
    before {render "admin/categories/category", category: subject}

    it do
      expect(rendered).to have_selector "tr#category_#{subject.id} td:nth-of-type(1)",
        text: "Test category"

      expect(rendered).to have_selector "tr#category_#{subject.id} td:nth-of-type(2)",
        text: "DescriptionDescription".truncate(100)

      expect(rendered).to have_selector "tr#category_#{subject.id} td:nth-of-type(3)
          a[href='/admin/categories/#{subject.id}/edit']",
        text: I18n.t("application.buttons.edit")

      expect(rendered).to have_selector "tr#category_#{subject.id} td:nth-of-type(4)
          a[href='/admin/categories/#{subject.id}'][data-method='delete']",
        text: I18n.t("application.buttons.delete")
    end
  end
end
