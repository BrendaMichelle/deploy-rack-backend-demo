class Lease < ActiveRecord::Base
    # belongs_to :SINGULAR -> <#Instance>
    belongs_to :toy
    belongs_to :car
end