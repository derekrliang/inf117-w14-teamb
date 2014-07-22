class User < ActiveRecord::Base
  has_secure_password
  
  belongs_to :course
  has_many :responses
  
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }

  before_create { generate_token(:auth_token) }
  
  def is_teacher?
    return role == 'teacher'
  end
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
  def taught_course
    Course.where(teacher_id: self.id).take
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
