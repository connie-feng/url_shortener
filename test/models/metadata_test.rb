require "test_helper"

class MetadataTest < ActiveSupport::TestCase
  test "title attribute" do
    title = "Hello"
    assert_equal title, Metadata.new("<title>#{title}</title>").title
  end

  test "missing title attribute" do
    assert_nil Metadata.new.title
  end

  test "meta description" do
    description = "Hello"
    assert_equal description, Metadata.new("<meta name='description' content='#{description}'>").description
  end

  test "missing meta description" do
    assert_nil Metadata.new.description
  end

  test "image" do
    image = "image.png"
    assert_equal image, Metadata.new("<meta property='og:image' content='#{image}'>").image
  end

  test "missing image" do
    assert_nil Metadata.new.image
  end

end
