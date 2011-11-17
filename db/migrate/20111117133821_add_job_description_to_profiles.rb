class AddJobDescriptionToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :job_description, :string
  end
end
