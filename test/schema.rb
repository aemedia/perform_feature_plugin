ActiveRecord::Schema.define(:version => 0) do  
  create_table :my_models, :force => true do  |t| 
    t.string :name
  end
end