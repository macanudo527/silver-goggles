class AddPrimaryReferenceToEntry < ActiveRecord::Migration[6.0]
  def change
  	add_reference :entries, :primary, index: true
  end
end
