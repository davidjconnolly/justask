ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def assert_created(model)
    assert_not_nil model, "Model was nil"
    assert model, "Model was not defined"
    assert_equal [ ], model.errors.full_messages
    assert model.valid?, "Model failed to validate"

    if (model.respond_to?(:new_record?))
      assert !model.new_record?, "Model is still a new record"
    elsif (model.respond_to?(:new?))
      assert !model.new?, "Model is still a new record"
    end
  end

  def assert_not_created(model)
    assert model, "Model was not defined"
    assert model.new_record?, "Model has been saved"
  end

  def assert_errors_on(record, *attrs)
    found_attrs = [ ]
    record.errors.each{ |attr, error| found_attrs << attr }
    assert_equal attrs.flatten.collect(&:to_s).sort, found_attrs.uniq.collect(&:to_s).sort
  end

  def assert_exception_raised(exception_class = nil, error_message = nil, &block)
    exception_raised = nil
    yield
  rescue => exception_raised
    if exception_class
      assert_equal exception_class, exception_raised.class, exception_raised.to_s
    else
      assert true
    end
    assert_equal error_message, exception_raised.to_s if error_message
  else
    flunk 'Exception was not raised'
  end

end
