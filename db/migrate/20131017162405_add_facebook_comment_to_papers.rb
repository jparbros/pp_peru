class AddFacebookCommentToPapers < ActiveRecord::Migration
  def change
    add_column :papers, :facebook_comment, :boolean
  end
end
