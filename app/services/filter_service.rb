# Filter service to define and validate filter parameters related to article
# If soem filter is not validated then it will be ignore
class FilterService
  include ActiveModel::Model
  attr_accessor :comments_number, :tags_number, :ordering
  validates :comments_number, numericality: true
  validates :tags_number, numericality: true

  def initialize(params)
    super(filter_params(params))
  end

  #return all submited and validated filters
  # after initialize object it should have set filters
  # as instance variable. This method get all instance variables
  # next in method filter_params remove all instad listed params
  # next in method validare it removee all not validated
  def all_filters
    params = self.instance_values.symbolize_keys
    filters  = filter_params(params)
    validate_filters(filters)
  end

  def filter_params(params)
    params.slice(:comments_number, :tags_number, :ordering)
  end

  private

  def validate_filters(filter_params)
    validate
    filter_params.delete_if{ |key, value| errors.include?(key)}
  end

end