class CreateReviewRequests < ActiveRecord::Migration
  def change
    create_table :review_requests do |t|
      t.integer :teacher_id
      t.integer :learner_id
      t.integer :entry_id
      t.text :message

      t.timestamps
    end
  end
end
