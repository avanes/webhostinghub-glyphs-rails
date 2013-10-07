require 'test_helper'

class WebhostinghubGlyphsRailsTest < ActionDispatch::IntegrationTest
  teardown { clean_sprockets_cache }

  test "engine is loaded" do
    assert_equal ::Rails::Engine, WebhostinghubGlyphs::Rails::Engine.superclass
  end

  test "fonts are served" do
    get "/assets/webhostinghub-glyphs.eot"
    assert_response :success
    get "/assets/webhostinghub-glyphs.ttf"
    assert_response :success
    get "/assets/webhostinghub-glyphs.svg"
    assert_response :success
  end

  test "stylesheets are served" do
    get "/assets/webhostinghub-glyphs.css"
    assert_webhostinghub_glyphs(response)
  end

  test "stylesheets contain asset pipeline references to fonts" do
    get "/assets/webhostinghub-glyphs.css"
    assert_match "/assets/webhostinghub-glyphs.eot",  response.body
    assert_match "/assets/webhostinghub-glyphs.eot?#iefix", response.body
    assert_match "/assets/webhostinghub-glyphs.ttf",  response.body
    assert_match "/assets/webhostinghub-glyphs.svg", response.body
  end

  test "stylesheet is available in a css sprockets require" do
    get "/assets/sprockets-require.css"
    assert_webhostinghub_glyphs(response)
  end

  test "stylesheet is available in a sass import" do
    get "/assets/sass-import.css"
    assert_webhostinghub_glyphs(response)
  end

  test "stylesheet is available in a scss import" do
    get "/assets/scss-import.css"
    assert_webhostinghub_glyphs(response)
  end

  test "helpers should be available in the view" do
    get "/icons"
    assert_response :success
    assert_select "i.icon-flag"
    assert_select "span.icon-stack"
  end

  private

  def clean_sprockets_cache
    FileUtils.rm_rf File.expand_path("../dummy/tmp",  __FILE__)
  end

  def assert_webhostinghub_glyphs(response)
    assert_response :success
    assert_match(/font-family:\s*'WebHostingHub-Glyphs';/, response.body)
  end
end
