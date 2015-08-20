require "rails_helper"
require "will_paginate/array"

describe "admin/categories/index", type: :view do
  subject {rendered}

  before do
    20.times {FactoryGirl.create :category}
    categories = Category.all.paginate page: params[:page],
      per_page: Settings.pagination.page_size
    assign :categories, categories
    assign :test, categories
    render
  end

  context "display all category" do
    it "have title" do
      is_expected.to have_selector "h1",
        text: I18n.t("admin.categories.index.title")
    end

    it "has add new category button" do
      is_expected.to have_link I18n.t("application.buttons.add"),
        href: "/admin/categories/new"
    end

    it "has correct pagination" do
      is_expected.to have_link "2", href: "/admin/categories?page=2"
    end

    it "render corrent partial category" do
      is_expected.to render_template partial: "_category"
    end
  end
end
