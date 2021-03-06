require File.join(File.dirname(__FILE__), '../test_helper.rb')
# require 'test/model_stub'

ActiveScaffold::DataStructures::Column.class_eval do
  def h(value)
    value
  end

  def format_column(value)
    value
  end
end

class StandardColumnTest < Test::Unit::TestCase
  def setup
    @standard_column = ActiveScaffold::DataStructures::Column.new(ModelStub.columns.first.name, ModelStub)
  end

  def test_virtuality
    assert @standard_column.column
    assert !@standard_column.virtual?
  end

  def test_sorting
    hash = {:sql => 'model_stubs.a'}
    assert @standard_column.sortable?
    assert_equal hash, @standard_column.sort # check default
  end

  def test_searching
    assert @standard_column.searchable?
    assert_equal 'model_stubs.a', @standard_column.search_sql # check default
  end
end
