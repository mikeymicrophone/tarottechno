class Querent < ApplicationRecord
  has_many :readings
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_not_in_line line
    line.places.where(:querent_id => id).empty?
  end
         
  def name
    moniker_or_name
  end

  def moniker_or_name
    if moniker.present?
      moniker
    else
      "#{first_name} #{last_name}"
    end
  end
end
