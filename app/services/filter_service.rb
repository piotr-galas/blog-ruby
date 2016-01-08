# Main class of filter, it is responsible for preparing parameters to filter
# To use this class you have to inherit it and then override clean params method.
class FilterService
  include ActiveModel::Model

  def initialize(params)
    super(clean_params(params))
  end

  # It get model, trigger all filter on it and return
  # model after filtering
  def filter(model)
    filters = prepare_filters
    return_filtered_model(model, filters)
  end

  private

  # return all submited and validated filters
  # after initialize object it should have set filters
  # as instance variable. This method get all instance variables
  # next in method filter_params remove all instad listed params
  # next in method validare it removee all not validated
  def prepare_filters
    params = instance_values.symbolize_keys
    filters  = clean_params(params)
    validate_filters(filters)
  end

  def return_filtered_model(model, filters)
    filters.each do |filter_name, filter_value|
      model = self.class.send(filter_name, model, filter_value)
    end
    model
  end

  # it remove all not validated filter from params
  def validate_filters(filter_params)
    validate
    filter_params.delete_if { |key| errors.include?(key) }
  end

  protected

  # it remove all parameters which are not filters
  def clean_params(params)
    params.slice()
  end
end
