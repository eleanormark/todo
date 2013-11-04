class Task < ActiveRecord::Base
  validates :name, :presence => true
  after_initialize :set_not_done
  belongs_to :list

  private
  def set_not_done
    self.done ||= false
  end

  def self.incomplete
    Task.where(:done => false)
  end

  def self.complete
    Task.where(:done => true)
  end
end