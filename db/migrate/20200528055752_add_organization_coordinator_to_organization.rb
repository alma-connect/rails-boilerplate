class AddOrganizationCoordinatorToOrganization < ActiveRecord::Migration[6.0]
  def change
    add_column :organizations, :organization_coordinator, :string
  end
end
