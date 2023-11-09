require "minitest/autorun"
load File.expand_path("./executable_update-oncall", __dir__)

class TestMarkdown < Minitest::Test
  attr_reader :md

  def setup
    @doc = <<~MARKDOWN
      # Header One

      some text

      ## Two

      ### Three

      - an item
      - another item

      ### Four

      - something

      ## Five
    MARKDOWN

    @md = Markdown.new(@doc)
  end

  def test_roundtrip
    assert_equal @doc, md.to_s
  end

  def test_add_heading
    md = Markdown.new("# h1\n")
    md.add_heading "## h2"
    assert_equal "# h1\n\n## h2\n", md.to_s
  end

  def test_add_heading_with_parent
    md = Markdown.new("# h1\n\n## one\n\n## two\n\n")
    md.add_heading "### sub", parent: "## one"
    assert_equal "# h1\n\n## one\n\n### sub\n\n## two\n", md.to_s
  end

  def test_add_heading_after_parent_content
    md = Markdown.new <<~MD
      # h1

      ## one

      some content

      ## two

      other content
    MD

    md.add_heading "### sub", parent: "## one"

    assert_equal <<~MD, md.to_s
      # h1

      ## one

      some content

      ### sub

      ## two

      other content
    MD
  end

  def test_add_heading_missing_parent
    md = Markdown.new "# h1\n"
    assert_raises(Markdown::MissingParent) do
      md.add_heading "### sub", parent: "## one"
    end
  end

  def test_add_heading_to_end
    md = Markdown.new "# h1\n\n## one\n\n## two\n\n"
    md.add_heading "## three", parent: "# h1"
    assert_equal "# h1\n\n## one\n\n## two\n\n## three\n", md.to_s
  end

  def test_add_heading_ignores_duplicate
    md = Markdown.new "# h1\n\n## one\n\n## two\n"
    md.add_heading "## one"
    assert_equal "# h1\n\n## one\n\n## two\n", md.to_s
  end

  def test_add_heading_ignores_duplicate_with_same_parent
    md = Markdown.new "# h1\n\n## one\n\n## two\n\n# h2\n"
    md.add_heading "## one", parent: "# h1"
    assert_equal "# h1\n\n## one\n\n## two\n\n# h2\n", md.to_s
  end

  def test_add_heading_ignores_duplicate_with_different_parent
    md = Markdown.new "# h1\n\n## one\n\n## two\n\n# h2"
    md.add_heading "## one", parent: "# h2"
    assert_equal "# h1\n\n## one\n\n## two\n\n# h2\n\n## one\n", md.to_s
  end

  def test_add_generic_text
    md = Markdown.new "# h1\n\n## A\n\n## B\n"
    md.add_text "some text"
    assert_equal "# h1\n\n## A\n\n## B\n\nsome text\n", md.to_s
  end

  def test_add_generic_text_to_header
    md = Markdown.new "# h1\n\n## A\n\n## B\n"
    md.add_text "some text", parent: "## A"
    assert_equal "# h1\n\n## A\n\nsome text\n\n## B\n", md.to_s
  end

  def test_add_generic_text_to_last_header
    md = Markdown.new "# h1\n\n## A\n\n## B\n"
    md.add_text "some text", parent: "## B"
    assert_equal "# h1\n\n## A\n\n## B\n\nsome text\n", md.to_s
  end

  def test_add_list_to_generic_text
    md = Markdown.new "# h1\n"
    md.add_text "- item"
    assert_equal "# h1\n\n- item\n", md.to_s
  end

  def test_add_list_to_existing_list
    md = Markdown.new "# h1\n\n- item 1\n"
    md.add_text "- item 2"
    assert_equal "# h1\n\n- item 1\n- item 2\n", md.to_s
  end

  def test_add_list_to_header
    md = Markdown.new "# h1\n\n## A\n\n## B\n"
    md.add_text "- item", parent: "## A"
    assert_equal "# h1\n\n## A\n\n- item\n\n## B\n", md.to_s
  end

  def test_add_list_to_header_existing_list
    md = Markdown.new "# h1\n\n## A\n\n- item 1\n\n## B\n"
    md.add_text "- item 2", parent: "## A"
    assert_equal "# h1\n\n## A\n\n- item 1\n- item 2\n\n## B\n", md.to_s
  end

  def test_add_list_to_last_header_list
    md = Markdown.new "# h1\n\n## A\n\n## B\n\n- item 1\n"
    md.add_text "- item 2", parent: "## B"
    assert_equal "# h1\n\n## A\n\n## B\n\n- item 1\n- item 2\n", md.to_s
  end
end
