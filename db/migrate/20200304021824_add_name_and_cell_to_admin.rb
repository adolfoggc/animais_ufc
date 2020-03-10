class AddNameAndCellToAdmin < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :name, :string, default: 'Não Informado'
    add_column :admins, :cel, :string, default: 'Não Informado'
    add_column :admins, :is_active, :boolean, default: true
  end
end
