class DropAdmins < ActiveRecord::Migration[6.0]
  def change
  	drop_table :admins do |t|
  		t.string "email", default: "", null: false
	    t.string "encrypted_password", default: "", null: false
	    t.string "reset_password_token"
	    t.datetime "reset_password_sent_at"
	    t.datetime "remember_created_at"
	    t.datetime "created_at", precision: 6, null: false
	    t.datetime "updated_at", precision: 6, null: false
	    t.index ["email"], name: "index_admins_on_email", unique: true
	    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  	end
  end
end
