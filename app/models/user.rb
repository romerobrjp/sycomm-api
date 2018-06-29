class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  
  include DeviseTokenAuth::Concerns::User

  # belongs_to :address
  attr_accessor :skip_password_validation

  validates :name, presence: true
  validates :type, presence: true

  scope :admins, -> { where(type: 'Admin') }
  scope :employees, -> { where(type: 'Employee') }
  scope :customers, -> { where(type: 'Customer') }

  # CALLBACKS
  before_validation :generate_uuid!
  before_create :downcase_email

  def password_required?
    return false if skip_password_validation
    super
  end

  # sobrescrita do metodo do devise para poder retornar os valores que quero apos fazer login
  def token_validation_response
    {
      id: id,
      email: email,
      name: name,
      surname: surname,
      cpf: cpf,
      landline: landline,
      cellphone: cellphone,
      whatsapp: whatsapp,
      simple_address: simple_address,
      created_at: created_at,
      updated_at: updated_at,
      type: type
    }
  end

  private

  def generate_uuid!
    self.uid = SecureRandom.uuid if self.uid.blank?
  end

  def downcase_email
    self.email = self.email.delete(' ').downcase
  end
end
