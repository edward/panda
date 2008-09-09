class AddVideoTableMigration < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.column :filename, :string
      t.column :original_filename, :string
      t.column :parent, :integer
      t.column :status, :string
      t.column :duration, :decimal,  :precision => 8, :scale => 2, :default => 0
      t.column :container, :string
      t.column :height, :integer
      t.column :width, :integer
      t.column :video_codec, :string
      t.column :video_bitrate, :integer
      t.column :fps, :integer
      t.column :audio_codec, :string
      t.column :audio_bitrate, :integer
      t.column :audio_sample_rate, :integer
      t.column :profile, :integer
      t.column :profile_title, :string
      t.column :player, :string
      t.column :queued_at, :integer
      t.column :started_encoding_at, :decimal, :precision => 8, :scale => 2, :default => 0
      t.column :encoding_time, :decimal, :precision => 8, :scale => 2, :default => 0
      t.column :encoded_at, :datetime
      t.column :last_notification_at, :datetime 
      t.column :notification, :datetime
      t.column :updated_at, :datetime
      t.column :created_at, :datetime
    end
  end

  def self.down
    drop_table :videos
  end
end