class AddPolymorphicReferencesToLikes < ActiveRecord::Migration[5.2]
  def change
    remove_reference :likes, :book
    add_reference :likes, :likable, polymorphic: true
  end
end
