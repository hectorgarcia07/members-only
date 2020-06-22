class NonEmptyTextToPosts < ActiveRecord::Migration[6.0]
  def change
    change_column_null :posts, :post, false
  end
end
